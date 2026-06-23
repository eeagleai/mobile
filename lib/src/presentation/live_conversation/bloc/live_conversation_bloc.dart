import 'dart:async';

import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/service/analytics_socket_service.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart' as domain;
import 'package:eeagle_ai/src/domain/model/live_assist_send_status.dart';
import 'package:eeagle_ai/src/domain/model/live_chat_message.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_stream_token_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/send_live_assist_message_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_conversation_event.dart';
part 'live_conversation_state.dart';
part 'live_conversation_bloc.freezed.dart';

/// Drives one owner ⇄ visitor live conversation.
///
/// Owns a dedicated analytics [AnalyticsSocketService] (the live-assist frames
/// ride that socket) filtered to a single `conversation_id`, plus the optimistic
/// send → confirm lifecycle for owner messages. Disposes the socket and timers
/// in [close].
class LiveConversationBloc
    extends Bloc<LiveConversationEvent, LiveConversationState> {
  LiveConversationBloc(
    this._sendLiveAssistMessageUseCase,
    this._getAnalyticsStreamTokenUseCase,
  ) : super(const LiveConversationState()) {
    on<_Started>(_onStarted);
    on<_ConnectSocketRequested>(_onConnectSocketRequested);
    on<_SocketMessageReceived>(_onSocketMessageReceived);
    on<_MessageSent>(_onMessageSent);
    on<_MessageRetried>(_onMessageRetried);
  }

  final SendLiveAssistMessageUseCase _sendLiveAssistMessageUseCase;
  final GetAnalyticsStreamTokenUseCase _getAnalyticsStreamTokenUseCase;

  final AnalyticsSocketService _socket = AnalyticsSocketService();
  StreamSubscription<AnalyticsSocketMessage>? _socketSub;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  int _localIdCounter = 0;

  String? _apikey;
  String? _conversationId;

  String _nextLocalId() => 'local-${_localIdCounter++}';

  Future<void> _onStarted(
    _Started event,
    Emitter<LiveConversationState> emit,
  ) async {
    _apikey = event.apikey;
    _conversationId = event.conversationId;
    appLogger.d(
      'live-conv: started apikey=${event.apikey} '
      'conversationId=${event.conversationId} hasSeed=${event.seedMessage != null}',
    );

    final seed = event.seedMessage;
    if (seed != null && seed.isNotEmpty) {
      emit(
        state.copyWith(
          messages: [
            LiveChatMessage(
              id: _nextLocalId(),
              sender: LiveChatSender.visitor,
              text: seed,
              status: LiveChatMessageStatus.sent,
              createdAt: event.seedCreatedAt,
            ),
          ],
        ),
      );
    }

    _socketSub ??= _socket.messages.listen((message) {
      if (!isClosed) {
        add(LiveConversationEvent.socketMessageReceived(message));
      }
    });

    add(const LiveConversationEvent.connectSocketRequested());
  }

  Future<void> _onConnectSocketRequested(
    _ConnectSocketRequested event,
    Emitter<LiveConversationState> emit,
  ) async {
    final apikey = _apikey;
    if (apikey == null) {
      return;
    }

    if (event.isReconnect) {
      emit(state.copyWith(status: AnalyticsConnectionStatus.reconnecting));
    }

    appLogger.d('live-conv: requesting stream-token (reconnect=${event.isReconnect})');
    final result = await _getAnalyticsStreamTokenUseCase(apikey).run();
    if (isClosed) {
      return;
    }
    result.match(
      (failure) {
        appLogger.w('live-conv: stream-token failed: ${failure.message}');
        _scheduleReconnect();
      },
      (info) {
        appLogger.d('live-conv: connecting socket → ${info.wsUrl}');
        _socket.connect(info);
      },
    );
  }

  void _onSocketMessageReceived(
    _SocketMessageReceived event,
    Emitter<LiveConversationState> emit,
  ) {
    switch (event.message) {
      case AnalyticsSocketReady():
        _reconnectAttempts = 0;
        appLogger.d('live-conv: socket ready (live)');
        emit(state.copyWith(status: AnalyticsConnectionStatus.live));
      case AnalyticsSocketVisitorMessage(:final event):
        final matches = _matchesConversation(event);
        appLogger.d(
          'live-conv: visitor message conversationId=${event.conversationId} '
          'matches=$matches (mine=$_conversationId)',
        );
        if (matches) {
          _appendVisitorMessage(emit, event);
        }
      case AnalyticsSocketOwnerMessage(:final event):
        final matches = _matchesConversation(event);
        appLogger.d(
          'live-conv: owner message echo conversationId=${event.conversationId} '
          'matches=$matches (mine=$_conversationId)',
        );
        if (matches) {
          _confirmOwnerMessage(emit, event);
        }
      case AnalyticsSocketConnectionLost():
        appLogger.w('live-conv: connection lost — reconnecting');
        emit(state.copyWith(status: AnalyticsConnectionStatus.reconnecting));
        _scheduleReconnect();
      // Frames not relevant to this conversation screen.
      case AnalyticsSocketEvent(:final event):
        appLogger.d(
          'live-conv: ignored analytics_event eventType=${event.eventType} '
          'conversationId=${event.conversationId}',
        );
      case AnalyticsSocketLiveAssistEvent(:final event):
        appLogger.d(
          'live-conv: ignored live_assist_event eventType=${event.eventType} '
          'conversationId=${event.conversationId}',
        );
      case AnalyticsSocketPong():
        break;
    }
  }

  Future<void> _onMessageSent(
    _MessageSent event,
    Emitter<LiveConversationState> emit,
  ) async {
    final text = event.text.trim();
    if (text.isEmpty) {
      return;
    }

    final localId = _nextLocalId();
    emit(
      state.copyWith(
        messages: [
          ...state.messages,
          LiveChatMessage(
            id: localId,
            sender: LiveChatSender.owner,
            text: text,
            status: LiveChatMessageStatus.sending,
            createdAt: DateTime.now(),
          ),
        ],
      ),
    );

    await _send(emit, localId: localId, text: text);
  }

  Future<void> _onMessageRetried(
    _MessageRetried event,
    Emitter<LiveConversationState> emit,
  ) async {
    LiveChatMessage? message;
    for (final m in state.messages) {
      if (m.id == event.localId) {
        message = m;
        break;
      }
    }
    if (message == null) {
      return;
    }

    _updateStatus(emit, event.localId, LiveChatMessageStatus.sending);
    await _send(emit, localId: event.localId, text: message.text);
  }

  Future<void> _send(
    Emitter<LiveConversationState> emit, {
    required String localId,
    required String text,
  }) async {
    final apikey = _apikey;
    final conversationId = _conversationId;
    if (apikey == null || conversationId == null) {
      _updateStatus(emit, localId, LiveChatMessageStatus.failed);
      return;
    }

    appLogger.d(
      'live-conv: send → conversation_id=$conversationId '
      '(not conversation_session_id)',
    );
    final result = await _sendLiveAssistMessageUseCase(
      apikey: apikey,
      conversationId: conversationId,
      message: text,
    ).run();
    if (isClosed) {
      return;
    }

    result.match(
      (failure) {
        appLogger.w('live-conv: send failed: ${failure.message}');
        _updateStatus(emit, localId, LiveChatMessageStatus.failed);
      },
      (status) {
        appLogger.d('live-conv: send accepted status=$status');
        _updateStatus(
          emit,
          localId,
          status == LiveAssistSendStatus.queued
              ? LiveChatMessageStatus.queued
              : LiveChatMessageStatus.sent,
        );
      },
    );
  }

  bool _matchesConversation(domain.AnalyticsEvent event) {
    final id = _conversationId;
    return id != null && event.conversationId == id;
  }

  void _appendVisitorMessage(
    Emitter<LiveConversationState> emit,
    domain.AnalyticsEvent event,
  ) {
    final text = event.message ?? event.preview;
    if (text == null || text.isEmpty) {
      appLogger.w('live-conv: visitor message had no text/preview — skipped');
      return;
    }
    appLogger.d('live-conv: appended visitor message');
    emit(
      state.copyWith(
        messages: [
          ...state.messages,
          LiveChatMessage(
            id: _nextLocalId(),
            sender: LiveChatSender.visitor,
            text: text,
            status: LiveChatMessageStatus.sent,
            createdAt: event.createdAt,
          ),
        ],
      ),
    );
  }

  /// Confirms an echoed owner message: flips the oldest matching pending message
  /// to [LiveChatMessageStatus.sent]; if none exists (e.g. sent from another
  /// device), appends it. Prevents duplicates.
  void _confirmOwnerMessage(
    Emitter<LiveConversationState> emit,
    domain.AnalyticsEvent event,
  ) {
    final text = event.message ?? event.preview;
    if (text == null || text.isEmpty) {
      return;
    }

    final messages = [...state.messages];
    final index = messages.indexWhere(
      (m) => m.isOwner && m.isPending && m.text == text,
    );

    if (index != -1) {
      appLogger.d('live-conv: owner echo matched pending message → sent');
      messages[index] = messages[index].copyWith(
        status: LiveChatMessageStatus.sent,
        createdAt: event.createdAt ?? messages[index].createdAt,
      );
    } else {
      appLogger.d('live-conv: owner echo had no pending match → appended');
      messages.add(
        LiveChatMessage(
          id: _nextLocalId(),
          sender: LiveChatSender.owner,
          text: text,
          status: LiveChatMessageStatus.sent,
          createdAt: event.createdAt,
        ),
      );
    }
    emit(state.copyWith(messages: messages));
  }

  void _updateStatus(
    Emitter<LiveConversationState> emit,
    String localId,
    LiveChatMessageStatus status,
  ) {
    final messages = [
      for (final m in state.messages)
        if (m.id == localId) m.copyWith(status: status) else m,
    ];
    emit(state.copyWith(messages: messages));
  }

  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    _reconnectAttempts += 1;
    final delay = Duration(seconds: (_reconnectAttempts * 2).clamp(2, 30));
    _reconnectTimer = Timer(delay, () {
      if (!isClosed) {
        add(const LiveConversationEvent.connectSocketRequested(
          isReconnect: true,
        ));
      }
    });
  }

  @override
  Future<void> close() {
    _reconnectTimer?.cancel();
    unawaited(_socketSub?.cancel());
    _socket.dispose();
    return super.close();
  }
}

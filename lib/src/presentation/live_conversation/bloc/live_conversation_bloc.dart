import 'dart:async';

import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/live_assist_send_status.dart';
import 'package:eeagle_ai/src/domain/model/live_chat_message.dart';
import 'package:eeagle_ai/src/domain/use_case/mark_conversation_read_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/save_owner_message_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/send_live_assist_message_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_conversation_messages_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_socket_connection_status_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_conversation_event.dart';
part 'live_conversation_state.dart';
part 'live_conversation_bloc.freezed.dart';

/// Drives one owner ⇄ visitor live conversation from the shared local store.
class LiveConversationBloc
    extends Bloc<LiveConversationEvent, LiveConversationState> {
  LiveConversationBloc(
    this._sendLiveAssistMessageUseCase,
    this._watchConversationMessagesUseCase,
    this._saveOwnerMessageUseCase,
    this._updateOwnerMessageStatusUseCase,
    this._markConversationReadUseCase,
    this._watchSocketConnectionStatusUseCase,
  ) : super(const LiveConversationState()) {
    on<_Started>(_onStarted);
    on<_MessagesUpdated>(_onMessagesUpdated);
    on<_ConnectionStatusPolled>(_onConnectionStatusPolled);
    on<_MessageSent>(_onMessageSent);
    on<_MessageRetried>(_onMessageRetried);
  }

  final SendLiveAssistMessageUseCase _sendLiveAssistMessageUseCase;
  final WatchConversationMessagesUseCase _watchConversationMessagesUseCase;
  final SaveOwnerMessageUseCase _saveOwnerMessageUseCase;
  final UpdateOwnerMessageStatusUseCase _updateOwnerMessageStatusUseCase;
  final MarkConversationReadUseCase _markConversationReadUseCase;
  final WatchSocketConnectionStatusUseCase _watchSocketConnectionStatusUseCase;

  StreamSubscription<List<LiveChatMessage>>? _messagesSub;
  Timer? _statusTimer;
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

    await _markConversationReadUseCase(event.conversationId);

    await _messagesSub?.cancel();
    _messagesSub =
        _watchConversationMessagesUseCase(event.conversationId).listen(
      (messages) {
        if (!isClosed) {
          add(LiveConversationEvent.messagesUpdated(messages));
        }
      },
    );

    _statusTimer?.cancel();
    _pollConnectionStatus();
    _statusTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      _pollConnectionStatus();
    });
  }

  void _pollConnectionStatus() {
    final apikey = _apikey;
    if (apikey == null || isClosed) {
      return;
    }
    add(
      LiveConversationEvent.connectionStatusPolled(
        _watchSocketConnectionStatusUseCase(apikey),
      ),
    );
  }

  void _onMessagesUpdated(
    _MessagesUpdated event,
    Emitter<LiveConversationState> emit,
  ) {
    emit(state.copyWith(messages: event.messages));
  }

  void _onConnectionStatusPolled(
    _ConnectionStatusPolled event,
    Emitter<LiveConversationState> emit,
  ) {
    emit(state.copyWith(status: event.status));
  }

  Future<void> _onMessageSent(
    _MessageSent event,
    Emitter<LiveConversationState> emit,
  ) async {
    final text = event.text.trim();
    if (text.isEmpty) {
      return;
    }

    final apikey = _apikey;
    final conversationId = _conversationId;
    if (apikey == null || conversationId == null) {
      return;
    }

    final localId = _nextLocalId();
    final createdAt = DateTime.now();
    await _saveOwnerMessageUseCase(
      siteApiKey: apikey,
      conversationId: conversationId,
      localId: localId,
      text: text,
      createdAt: createdAt,
    );

    await _send(emit, localId: localId, text: text);
  }

  Future<void> _onMessageRetried(
    _MessageRetried event,
    Emitter<LiveConversationState> emit,
  ) async {
    LiveChatMessage? message;
    for (final candidate in state.messages) {
      if (candidate.id == event.localId) {
        message = candidate;
        break;
      }
    }
    if (message == null) {
      return;
    }

    await _updateOwnerMessageStatusUseCase(
      localId: event.localId,
      status: LiveChatMessageStatus.sending,
    );
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
      await _updateOwnerMessageStatusUseCase(
        localId: localId,
        status: LiveChatMessageStatus.failed,
      );
      return;
    }

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
        unawaited(
          _updateOwnerMessageStatusUseCase(
            localId: localId,
            status: LiveChatMessageStatus.failed,
          ),
        );
      },
      (status) {
        unawaited(
          _updateOwnerMessageStatusUseCase(
            localId: localId,
            status: status == LiveAssistSendStatus.queued
                ? LiveChatMessageStatus.queued
                : LiveChatMessageStatus.sent,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _statusTimer?.cancel();
    unawaited(_messagesSub?.cancel());
    return super.close();
  }
}

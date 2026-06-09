import 'dart:async';

import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/core/util/page_url_util.dart';
import 'package:eeagle_ai/src/domain/model/chat_connection_phase.dart';
import 'package:eeagle_ai/src/domain/model/chat_inbound_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_message.dart';
import 'package:eeagle_ai/src/domain/model/chat_session.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/use_case/connect_chat_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/disconnect_chat_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/mint_chat_token_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/send_chat_message_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_chat_inbound_events_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'llm_chat_session_event.dart';
part 'llm_chat_session_state.dart';
part 'llm_chat_session_bloc.freezed.dart';

class LlmChatSessionBloc extends Bloc<LlmChatSessionEvent, LlmChatSessionState> {
  static const _noResponseFallback =
      'No response received. Check that AI is configured for this site.';

  LlmChatSessionBloc(
    this._mintChatToken,
    this._connectChatSession,
    this._sendChatMessage,
    this._disconnectChatSession,
    this._watchChatInboundEvents,
  ) : super(const LlmChatSessionState()) {
    on<_Started>(_onStarted);
    on<_MessageSent>(_onMessageSent);
    on<_InboundEventReceived>(_onInboundEventReceived);
    on<_Disposed>(_onDisposed);
  }

  final MintChatTokenUseCase _mintChatToken;
  final ConnectChatSessionUseCase _connectChatSession;
  final SendChatMessageUseCase _sendChatMessage;
  final DisconnectChatSessionUseCase _disconnectChatSession;
  final WatchChatInboundEventsUseCase _watchChatInboundEvents;

  StreamSubscription<ChatInboundEvent>? _inboundSubscription;
  Site? _site;
  ChatSession? _session;
  int _messageCounter = 0;

  Future<void> _onStarted(_Started event, Emitter<LlmChatSessionState> emit) async {
    _site = event.site;
    emit(
      state.copyWith(
        connectionPhase: ChatConnectionPhase.connecting,
        errorMessage: null,
      ),
    );

    await _startInboundListener();
    await _connect(emit, newChat: true);
  }

  Future<void> _connect(
    Emitter<LlmChatSessionState> emit, {
    required bool newChat,
  }) async {
    final site = _site;
    if (site == null) {
      return;
    }

    final pageUrl = normalizePageUrl(site.host);

    final tokenResult = await _mintChatToken(
      apikey: site.apikey,
      pageUrl: pageUrl,
      model: ApiConfig.defaultChatModel,
      newChat: newChat,
    ).run();

    if (isClosed || emit.isDone) {
      return;
    }

    await tokenResult.match(
      (failure) async {
        emit(
          state.copyWith(
            connectionPhase: ChatConnectionPhase.error,
            errorMessage: failure.message,
          ),
        );
      },
      (session) async {
        _session = session;
        final connectResult = await _connectChatSession(
          session: session,
          apikey: site.apikey,
          pageUrl: pageUrl,
          model: ApiConfig.defaultChatModel,
        ).run();

        if (isClosed || emit.isDone) {
          return;
        }

        connectResult.match(
          (failure) => emit(
            state.copyWith(
              connectionPhase: ChatConnectionPhase.error,
              errorMessage: failure.message,
            ),
          ),
          (_) {
            emit(
              state.copyWith(
                connectionPhase: ChatConnectionPhase.connected,
                quotaRemaining: session.config.remaining,
                errorMessage: null,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _startInboundListener() async {
    await _inboundSubscription?.cancel();
    _inboundSubscription = _watchChatInboundEvents().listen(
      (event) {
        if (!isClosed) {
          add(LlmChatSessionEvent.inboundEventReceived(event));
        }
      },
    );
  }

  Future<void> _onMessageSent(
    _MessageSent event,
    Emitter<LlmChatSessionState> emit,
  ) async {
    final text = event.text.trim();
    if (text.isEmpty) {
      return;
    }

    final session = _session;
    if (session == null) {
      emit(
        state.copyWith(
          errorMessage: 'Chat is not ready yet. Please wait a moment.',
        ),
      );
      return;
    }

    final userMessage = ChatMessage(
      id: _nextMessageId(),
      role: ChatMessageRole.user,
      content: text,
    );

    emit(
      state.copyWith(
        messages: [...state.messages, userMessage],
        connectionPhase: ChatConnectionPhase.processing,
        errorMessage: null,
      ),
    );

    final result = await _sendChatMessage(
      text: text,
      conversationSessionId: session.conversationSessionId,
    ).run();

    if (isClosed || emit.isDone) {
      return;
    }

    result.match(
      (failure) => emit(
        state.copyWith(
          connectionPhase: ChatConnectionPhase.error,
          errorMessage: failure.message,
        ),
      ),
      (_) {},
    );
  }

  void _onInboundEventReceived(
    _InboundEventReceived event,
    Emitter<LlmChatSessionState> emit,
  ) {
    final inbound = event.event;

    switch (inbound) {
      case ChatInboundStatusEvent(:final state):
        emit(
          this.state.copyWith(
            connectionPhase: _mapStatusState(state),
            errorMessage: null,
          ),
        );
      case ChatInboundMessageEvent(:final role, :final content):
        if (content.isEmpty) {
          return;
        }
        emit(
          state.copyWith(
            messages: _mergeInboundMessage(role, content),
            errorMessage: null,
          ),
        );
      case ChatInboundAssistantFinishedEvent():
        final finishedMessages = _finishAssistantTurn();
        _logFinishedAssistantMessage(finishedMessages);
        emit(
          state.copyWith(
            messages: finishedMessages,
            connectionPhase: ChatConnectionPhase.idle,
          ),
        );
      case ChatInboundErrorEvent(:final error, :final detail):
        final message = _formatInboundError(error, detail);
        final shouldReconnect = _shouldReconnectAfterError(error, detail);
        emit(
          state.copyWith(
            messages: _mergeInboundMessage(
              ChatMessageRole.assistant,
              message,
              isStreaming: false,
            ),
            connectionPhase: ChatConnectionPhase.idle,
            errorMessage: shouldReconnect ? message : null,
          ),
        );
        if (_site != null && !isClosed && shouldReconnect) {
          _reconnectAfterError(emit);
        }
      case ChatInboundPongEvent():
        break;
    }
  }

  String _formatInboundError(String error, String? detail) {
    final combined = '${error.toLowerCase()} ${detail?.toLowerCase() ?? ''}';
    if (combined.contains('invalid_api_key') ||
        combined.contains('invalid api key')) {
      return 'AI is not configured for this site. Check the site LLM API key on Eeagle.';
    }

    if (detail == null || detail.isEmpty) {
      return error;
    }

    return '$error: $detail';
  }

  bool _shouldReconnectAfterError(String error, String? detail) {
    final combined = '${error.toLowerCase()} ${detail?.toLowerCase() ?? ''}';
    if (combined.contains('invalid_api_key') ||
        combined.contains('invalid api key') ||
        combined.contains('assistant_error')) {
      return false;
    }

    return true;
  }

  Future<void> _reconnectAfterError(Emitter<LlmChatSessionState> emit) async {
    emit(
      state.copyWith(
        connectionPhase: ChatConnectionPhase.connecting,
        errorMessage: null,
      ),
    );
    await _connect(emit, newChat: false);
  }

  ChatConnectionPhase _mapStatusState(String status) {
    switch (status.toLowerCase()) {
      case 'processing':
        return ChatConnectionPhase.processing;
      case 'idle':
        return ChatConnectionPhase.idle;
      case 'authenticated':
      case 'subscribed':
        return ChatConnectionPhase.connected;
      default:
        return state.connectionPhase;
    }
  }

  List<ChatMessage> _mergeInboundMessage(
    ChatMessageRole role,
    String content, {
    bool? isStreaming,
  }) {
    final streaming = isStreaming ?? role == ChatMessageRole.assistant;
    final messages = [...state.messages];
    if (messages.isEmpty) {
      return [
        ChatMessage(
          id: _nextMessageId(),
          role: role,
          content: content,
          isStreaming: streaming,
        ),
      ];
    }

    final last = messages.last;
    if (role == ChatMessageRole.user &&
        last.role == ChatMessageRole.user &&
        last.content == content) {
      return messages;
    }

    if (role == ChatMessageRole.assistant && _isFallbackMessage(last)) {
      messages[messages.length - 1] = ChatMessage(
        id: last.id,
        role: ChatMessageRole.assistant,
        content: content,
        isStreaming: streaming,
      );
      return messages;
    }

    if (last.role == role &&
        role == ChatMessageRole.assistant &&
        last.isStreaming &&
        streaming) {
      messages[messages.length - 1] = last.copyWith(
        content: last.content + content,
      );
      return messages;
    }

    messages.add(
      ChatMessage(
        id: _nextMessageId(),
        role: role,
        content: content,
        isStreaming: streaming,
      ),
    );
    return messages;
  }

  List<ChatMessage> _finishAssistantTurn() {
    var messages = _finishStreamingAssistantMessage();
    if (_needsAssistantFallback(messages)) {
      messages = _appendAssistantFallback(messages);
    }
    return messages;
  }

  void _logFinishedAssistantMessage(List<ChatMessage> messages) {
    if (!kDebugMode || messages.isEmpty) {
      return;
    }

    final last = messages.last;
    if (last.role != ChatMessageRole.assistant) {
      return;
    }

    appLogger.d('chat assistant finished:\n${last.content}');
  }

  bool _needsAssistantFallback(List<ChatMessage> messages) {
    if (messages.isEmpty) {
      return false;
    }

    final last = messages.last;
    if (last.role == ChatMessageRole.user) {
      return true;
    }

    return last.role == ChatMessageRole.assistant && last.content.trim().isEmpty;
  }

  List<ChatMessage> _appendAssistantFallback(List<ChatMessage> messages) {
    return [
      ...messages,
      ChatMessage(
        id: _nextMessageId(),
        role: ChatMessageRole.assistant,
        content: _noResponseFallback,
      ),
    ];
  }

  bool _isFallbackMessage(ChatMessage message) {
    return message.role == ChatMessageRole.assistant &&
        message.content == _noResponseFallback;
  }

  List<ChatMessage> _finishStreamingAssistantMessage() {
    final messages = [...state.messages];
    if (messages.isEmpty) {
      return messages;
    }

    final last = messages.last;
    if (last.role == ChatMessageRole.assistant && last.isStreaming) {
      if (last.content.trim().isEmpty) {
        messages.removeLast();
      } else {
        messages[messages.length - 1] = last.copyWith(isStreaming: false);
      }
    }

    return messages;
  }

  String _nextMessageId() {
    _messageCounter += 1;
    return 'message-$_messageCounter';
  }

  Future<void> _onDisposed(
    _Disposed event,
    Emitter<LlmChatSessionState> emit,
  ) async {
    await _inboundSubscription?.cancel();
    _inboundSubscription = null;
    await _disconnectChatSession().run();
  }

  @override
  Future<void> close() async {
    await _inboundSubscription?.cancel();
    await _disconnectChatSession().run();
    return super.close();
  }
}

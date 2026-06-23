part of 'llm_chat_session_bloc.dart';

@freezed
sealed class LlmChatSessionEvent with _$LlmChatSessionEvent {
  const factory LlmChatSessionEvent.started({
    required Site site,
  }) = _Started;

  const factory LlmChatSessionEvent.messageSent({
    required String text,
  }) = _MessageSent;

  const factory LlmChatSessionEvent.inboundEventReceived(
    ChatInboundEvent event,
  ) = _InboundEventReceived;

  const factory LlmChatSessionEvent.disposed() = _Disposed;

  const factory LlmChatSessionEvent.previewActionConsumed() =
      _PreviewActionConsumed;
}

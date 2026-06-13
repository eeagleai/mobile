part of 'llm_chat_session_bloc.dart';

@freezed
sealed class LlmChatSessionState with _$LlmChatSessionState {
  const factory LlmChatSessionState({
    @Default(ChatConnectionPhase.connecting) ChatConnectionPhase connectionPhase,
    @Default([]) List<ChatMessage> messages,
    int? quotaRemaining,
    String? errorMessage,
    SitePreviewAction? previewAction,
  }) = _LlmChatSessionState;
}

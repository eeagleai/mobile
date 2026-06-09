part of 'llm_chat_prompt_bloc.dart';

@freezed
sealed class LlmChatPromptState with _$LlmChatPromptState {
  const factory LlmChatPromptState({
    @Default('') String promptText,
    @Default(false) bool isListening,
    @Default(false) bool isInitializing,
    @Default(false) bool isSpeechAvailable,
    @Default(0.0) double soundLevel,
    @Default([]) List<PromptAttachment> attachments,
    String? errorMessage,
  }) = _LlmChatPromptState;
}

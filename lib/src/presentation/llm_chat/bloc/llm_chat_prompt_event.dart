part of 'llm_chat_prompt_bloc.dart';

@freezed
sealed class LlmChatPromptEvent with _$LlmChatPromptEvent {
  const factory LlmChatPromptEvent.initialized() = _Initialized;

  const factory LlmChatPromptEvent.micToggled() = _MicToggled;

  const factory LlmChatPromptEvent.textChanged(String text) = _TextChanged;

  const factory LlmChatPromptEvent.speechResultReceived({
    required String words,
    required bool isFinal,
  }) = _SpeechResultReceived;

  const factory LlmChatPromptEvent.speechStatusChanged(String status) =
      _SpeechStatusChanged;

  const factory LlmChatPromptEvent.speechErrorReceived(String message) =
      _SpeechErrorReceived;

  const factory LlmChatPromptEvent.sendRequested() = _SendRequested;

  const factory LlmChatPromptEvent.soundLevelChanged(double level) =
      _SoundLevelChanged;

  const factory LlmChatPromptEvent.pickMediaRequested() = _PickMediaRequested;

  const factory LlmChatPromptEvent.pickFilesRequested() = _PickFilesRequested;

  const factory LlmChatPromptEvent.attachmentRemoved(String id) =
      _AttachmentRemoved;
}

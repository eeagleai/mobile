part of 'live_conversation_bloc.dart';

@freezed
sealed class LiveConversationState with _$LiveConversationState {
  const factory LiveConversationState({
    @Default(AnalyticsConnectionStatus.offline) AnalyticsConnectionStatus status,
    @Default(<LiveChatMessage>[]) List<LiveChatMessage> messages,
    String? errorMessage,
  }) = _LiveConversationState;
}

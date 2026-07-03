part of 'live_conversation_bloc.dart';

@freezed
sealed class LiveConversationEvent with _$LiveConversationEvent {
  const factory LiveConversationEvent.started({
    required String apikey,
    required String conversationId,
  }) = _Started;

  const factory LiveConversationEvent.messagesUpdated(
    List<LiveChatMessage> messages,
  ) = _MessagesUpdated;

  const factory LiveConversationEvent.connectionStatusPolled(
    AnalyticsConnectionStatus status,
  ) = _ConnectionStatusPolled;

  const factory LiveConversationEvent.messageSent({required String text}) =
      _MessageSent;

  const factory LiveConversationEvent.messageRetried({
    required String localId,
  }) = _MessageRetried;
}

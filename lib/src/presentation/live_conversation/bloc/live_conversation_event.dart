part of 'live_conversation_bloc.dart';

@freezed
sealed class LiveConversationEvent with _$LiveConversationEvent {
  /// Initialise the screen: store ids, seed any initial message, connect socket.
  const factory LiveConversationEvent.started({
    required String apikey,
    required String conversationId,
    String? seedMessage,
    DateTime? seedCreatedAt,
  }) = _Started;

  /// Internal: mint a stream-token and open (or reopen) the socket.
  const factory LiveConversationEvent.connectSocketRequested({
    @Default(false) bool isReconnect,
  }) = _ConnectSocketRequested;

  /// Internal: a parsed frame arrived on the socket.
  const factory LiveConversationEvent.socketMessageReceived(
    AnalyticsSocketMessage message,
  ) = _SocketMessageReceived;

  /// The owner sent a message.
  const factory LiveConversationEvent.messageSent(String text) = _MessageSent;

  /// Retry a previously failed owner message.
  const factory LiveConversationEvent.messageRetried(String localId) =
      _MessageRetried;
}

part of 'analytics_bloc.dart';

@freezed
sealed class AnalyticsEvent with _$AnalyticsEvent {
  /// Begin loading stats + events for [apikey] and open the live socket.
  const factory AnalyticsEvent.started(String apikey) = _Started;

  /// Reload stats + events (pull-to-refresh / retry).
  const factory AnalyticsEvent.refreshRequested() = _RefreshRequested;

  /// Internal: refetch `/stats` only (debounced via a throttle timer).
  const factory AnalyticsEvent.statsRequested() = _StatsRequested;

  /// Internal: mint a stream-token and open (or reopen) the socket.
  const factory AnalyticsEvent.connectSocketRequested({
    @Default(false) bool isReconnect,
  }) = _ConnectSocketRequested;

  /// Internal: a parsed frame arrived on the socket.
  const factory AnalyticsEvent.socketMessageReceived(
    AnalyticsSocketMessage message,
  ) = _SocketMessageReceived;

  /// The owner opened [conversationId]; clear its unread badge.
  const factory AnalyticsEvent.conversationOpened(String conversationId) =
      _ConversationOpened;
}

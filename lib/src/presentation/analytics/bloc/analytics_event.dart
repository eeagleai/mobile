part of 'analytics_bloc.dart';

@freezed
sealed class AnalyticsEvent with _$AnalyticsEvent {
  /// Begin loading stats + events for [apikey]. Read-only — no socket.
  const factory AnalyticsEvent.started(String apikey) = _Started;

  const factory AnalyticsEvent.tabChanged(AnalyticsTab tab) = _TabChanged;

  const factory AnalyticsEvent.refreshRequested() = _RefreshRequested;

  const factory AnalyticsEvent.statsRequested() = _StatsRequested;

  const factory AnalyticsEvent.conversationsUpdated(
    List<LiveConversationSummary> conversations,
  ) = _ConversationsUpdated;

  const factory AnalyticsEvent.eventsUpdated(
    List<domain.AnalyticsEvent> events,
  ) = _EventsUpdated;

  const factory AnalyticsEvent.connectionStatusUpdated(
    AnalyticsConnectionStatus status,
  ) = _ConnectionStatusUpdated;

  const factory AnalyticsEvent.conversationOpened(String conversationId) =
      _ConversationOpened;
}

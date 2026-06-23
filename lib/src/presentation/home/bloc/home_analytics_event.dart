part of 'home_analytics_bloc.dart';

@freezed
sealed class HomeAnalyticsEvent with _$HomeAnalyticsEvent {
  /// The list of sites changed; (re)wire stats fetches and sockets.
  const factory HomeAnalyticsEvent.sitesUpdated(List<Site> sites) =
      _SitesUpdated;

  /// Refetch stats for every tracked site (pull-to-refresh).
  const factory HomeAnalyticsEvent.refreshRequested() = _RefreshRequested;

  /// Refetch stats for a single site (e.g. returning from AnalyticsScreen).
  const factory HomeAnalyticsEvent.siteRefreshRequested(String apikey) =
      _SiteRefreshRequested;

  /// Internal: fetch `/stats` for [apikey] (debounced via a throttle timer).
  const factory HomeAnalyticsEvent.statsRequested(String apikey) =
      _StatsRequested;

  /// Internal: mint a stream-token and open (or reopen) the socket for [apikey].
  const factory HomeAnalyticsEvent.connectSocketRequested(
    String apikey, {
    @Default(false) bool isReconnect,
  }) = _ConnectSocketRequested;

  /// Internal: a parsed frame arrived on [apikey]'s socket.
  const factory HomeAnalyticsEvent.socketMessageReceived(
    String apikey,
    AnalyticsSocketMessage message,
  ) = _SocketMessageReceived;
}

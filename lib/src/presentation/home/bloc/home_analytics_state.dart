part of 'home_analytics_bloc.dart';

@freezed
sealed class HomeAnalyticsState with _$HomeAnalyticsState {
  const HomeAnalyticsState._();

  const factory HomeAnalyticsState({
    @Default(<String, SiteAnalyticsState>{})
    Map<String, SiteAnalyticsState> analytics,
  }) = _HomeAnalyticsState;

  /// Analytics for [apikey], or an empty offline state if not tracked yet.
  SiteAnalyticsState forApikey(String apikey) =>
      analytics[apikey] ?? const SiteAnalyticsState();
}

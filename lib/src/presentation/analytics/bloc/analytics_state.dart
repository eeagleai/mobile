part of 'analytics_bloc.dart';

@freezed
sealed class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState({
    @Default(AnalyticsConnectionStatus.offline) AnalyticsConnectionStatus status,
    AnalyticsStats? stats,
    @Default(<domain.AnalyticsEvent>[]) List<domain.AnalyticsEvent> events,
    @Default(<String>{}) Set<String> unreadConversationIds,
    @Default(false) bool isLoadingStats,
    @Default(false) bool isLoadingEvents,
    String? errorMessage,
  }) = _AnalyticsState;
}

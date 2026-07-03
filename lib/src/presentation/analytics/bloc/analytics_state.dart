part of 'analytics_bloc.dart';

enum AnalyticsTab { chats, events }

@freezed
sealed class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState({
    @Default(AnalyticsTab.chats) AnalyticsTab selectedTab,
    @Default(AnalyticsConnectionStatus.offline) AnalyticsConnectionStatus status,
    AnalyticsStats? stats,
    @Default(<LiveConversationSummary>[])
    List<LiveConversationSummary> conversations,
    @Default(<domain.AnalyticsEvent>[]) List<domain.AnalyticsEvent> events,
    @Default(false) bool isLoadingStats,
    @Default(false) bool isLoadingEvents,
    String? errorMessage,
  }) = _AnalyticsState;
}

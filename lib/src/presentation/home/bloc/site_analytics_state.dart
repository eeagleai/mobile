import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stats.dart';

/// Per-site analytics state shown on a single home card.
class SiteAnalyticsState {
  const SiteAnalyticsState({
    this.stats,
    this.isLoading = false,
    this.hasError = false,
    this.status = AnalyticsConnectionStatus.offline,
    this.unreadChatCount = 0,
  });

  final AnalyticsStats? stats;
  final bool isLoading;
  final bool hasError;
  final AnalyticsConnectionStatus status;
  final int unreadChatCount;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is SiteAnalyticsState &&
        other.stats?.totalEvents == stats?.totalEvents &&
        other.stats?.uniqueVisitors == stats?.uniqueVisitors &&
        other.stats?.uniqueSessions == stats?.uniqueSessions &&
        other.stats?.lastEventAt == stats?.lastEventAt &&
        other.isLoading == isLoading &&
        other.hasError == hasError &&
        other.status == status &&
        other.unreadChatCount == unreadChatCount;
  }

  @override
  int get hashCode => Object.hash(
        stats?.totalEvents,
        stats?.uniqueVisitors,
        stats?.uniqueSessions,
        stats?.lastEventAt,
        isLoading,
        hasError,
        status,
        unreadChatCount,
      );
}

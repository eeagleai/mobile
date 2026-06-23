/// Aggregate analytics numbers for a single site.
///
/// This is the authoritative source of truth for the home card and the
/// analytics screen: the backend `/api/analytics/stats` response always
/// overwrites any locally tracked values.
class AnalyticsStats {
  const AnalyticsStats({
    required this.totalEvents,
    required this.uniqueVisitors,
    required this.uniqueSessions,
    this.lastEventAt,
  });

  final int totalEvents;
  final int uniqueVisitors;
  final int uniqueSessions;
  final DateTime? lastEventAt;
}

/// Short-lived credentials for opening the live analytics WebSocket.
///
/// Returned by `/api/analytics/stream-token`. The [token] is a JWT passed as a
/// `?token=` query parameter when connecting to [wsUrl].
class AnalyticsStreamInfo {
  const AnalyticsStreamInfo({
    required this.apikey,
    required this.token,
    required this.wsUrl,
  });

  final String apikey;
  final String token;
  final String wsUrl;
}

/// Live connection state for the analytics WebSocket, surfaced to the UI.
enum AnalyticsConnectionStatus {
  /// Not connected (initial state, or socket intentionally closed).
  offline,

  /// Connection lost and a reconnect attempt is in progress.
  reconnecting,

  /// Connected and the backend has acknowledged us with a `ready` frame.
  live,
}

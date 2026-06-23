/// Outcome of `POST /api/live-assist/send`.
///
/// `ok` (HTTP 200) — delivered; `queued` (HTTP 202) — accepted for delivery.
enum LiveAssistSendStatus { ok, queued }

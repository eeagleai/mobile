/// A single analytics event for a site.
///
/// Used both for the `/api/analytics/events` history list and for live events
/// arriving over the WebSocket. Live frames only carry a subset of the fields,
/// so everything except a few essentials is nullable.
class AnalyticsEvent {
  const AnalyticsEvent({
    this.eventType,
    this.endpoint,
    this.method,
    this.outcome,
    this.pageUrl,
    this.country,
    this.city,
    this.region,
    this.apikey,
    this.siteId,
    this.visitId,
    this.conversationId,
    this.conversationSessionId,
    this.message,
    this.preview,
    this.statusCode,
    this.attachmentCount,
    this.waitingForVisitorReply,
    this.createdAt,
  });

  final String? eventType;
  final String? endpoint;
  final String? method;
  final String? outcome;
  final String? pageUrl;
  final String? country;
  final String? city;
  final String? region;
  final String? apikey;
  final String? siteId;
  final String? visitId;
  final String? conversationId;
  final String? conversationSessionId;

  /// Full message text for live-assist message events.
  final String? message;

  /// Short preview text for live-assist message events.
  final String? preview;
  final int? statusCode;
  final int? attachmentCount;
  final bool? waitingForVisitorReply;
  final DateTime? createdAt;

  /// Whether this event can open a live conversation (it carries a
  /// `conversation_id`).
  bool get canOpenChat => (conversationId ?? '').isNotEmpty;
}

import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_event_model.freezed.dart';
part 'analytics_event_model.g.dart';

@freezed
abstract class AnalyticsEventModel with _$AnalyticsEventModel {
  const AnalyticsEventModel._();

  const factory AnalyticsEventModel({
    @JsonKey(name: 'event_type') String? eventType,
    String? endpoint,
    String? method,
    String? outcome,
    @JsonKey(name: 'page_url') String? pageUrl,
    String? country,
    String? city,
    String? region,
    String? apikey,
    @JsonKey(name: 'site_id') String? siteId,
    @JsonKey(name: 'visit_id') String? visitId,
    @JsonKey(name: 'conversation_id') String? conversationId,
    @JsonKey(name: 'conversation_session_id') String? conversationSessionId,
    String? message,
    String? preview,
    @JsonKey(name: 'status_code') int? statusCode,
    @JsonKey(name: 'attachment_count') int? attachmentCount,
    @JsonKey(name: 'waiting_for_visitor_reply') bool? waitingForVisitorReply,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'opened_at') DateTime? openedAt,
  }) = _AnalyticsEventModel;

  factory AnalyticsEventModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsEventModelFromJson(json);

  AnalyticsEvent toEntity() {
    return AnalyticsEvent(
      eventType: eventType,
      endpoint: endpoint,
      method: method,
      outcome: outcome,
      pageUrl: pageUrl,
      country: country,
      city: city,
      region: region,
      apikey: apikey,
      siteId: siteId,
      visitId: visitId,
      conversationId: conversationId,
      conversationSessionId: conversationSessionId,
      message: message,
      preview: preview,
      statusCode: statusCode,
      attachmentCount: attachmentCount,
      waitingForVisitorReply: waitingForVisitorReply,
      // Live-assist "opened" frames carry `opened_at` instead of `created_at`.
      createdAt: createdAt ?? openedAt,
    );
  }
}

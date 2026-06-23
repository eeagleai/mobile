// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyticsEventModel _$AnalyticsEventModelFromJson(Map<String, dynamic> json) =>
    _AnalyticsEventModel(
      eventType: json['event_type'] as String?,
      endpoint: json['endpoint'] as String?,
      method: json['method'] as String?,
      outcome: json['outcome'] as String?,
      pageUrl: json['page_url'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      apikey: json['apikey'] as String?,
      siteId: json['site_id'] as String?,
      visitId: json['visit_id'] as String?,
      conversationId: json['conversation_id'] as String?,
      conversationSessionId: json['conversation_session_id'] as String?,
      message: json['message'] as String?,
      preview: json['preview'] as String?,
      statusCode: (json['status_code'] as num?)?.toInt(),
      attachmentCount: (json['attachment_count'] as num?)?.toInt(),
      waitingForVisitorReply: json['waiting_for_visitor_reply'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      openedAt: json['opened_at'] == null
          ? null
          : DateTime.parse(json['opened_at'] as String),
    );

Map<String, dynamic> _$AnalyticsEventModelToJson(
  _AnalyticsEventModel instance,
) => <String, dynamic>{
  'event_type': instance.eventType,
  'endpoint': instance.endpoint,
  'method': instance.method,
  'outcome': instance.outcome,
  'page_url': instance.pageUrl,
  'country': instance.country,
  'city': instance.city,
  'region': instance.region,
  'apikey': instance.apikey,
  'site_id': instance.siteId,
  'visit_id': instance.visitId,
  'conversation_id': instance.conversationId,
  'conversation_session_id': instance.conversationSessionId,
  'message': instance.message,
  'preview': instance.preview,
  'status_code': instance.statusCode,
  'attachment_count': instance.attachmentCount,
  'waiting_for_visitor_reply': instance.waitingForVisitorReply,
  'created_at': instance.createdAt?.toIso8601String(),
  'opened_at': instance.openedAt?.toIso8601String(),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_stats_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyticsStatsResponseModel _$AnalyticsStatsResponseModelFromJson(
  Map<String, dynamic> json,
) => _AnalyticsStatsResponseModel(
  apikey: json['apikey'] as String?,
  stats: json['stats'] == null
      ? null
      : AnalyticsStatsModel.fromJson(json['stats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AnalyticsStatsResponseModelToJson(
  _AnalyticsStatsResponseModel instance,
) => <String, dynamic>{'apikey': instance.apikey, 'stats': instance.stats};

_AnalyticsStatsModel _$AnalyticsStatsModelFromJson(Map<String, dynamic> json) =>
    _AnalyticsStatsModel(
      totalEvents: (json['total_events'] as num?)?.toInt() ?? 0,
      uniqueVisitors: (json['unique_visitors'] as num?)?.toInt() ?? 0,
      uniqueSessions: (json['unique_sessions'] as num?)?.toInt() ?? 0,
      lastEventAt: json['last_event_at'] == null
          ? null
          : DateTime.parse(json['last_event_at'] as String),
    );

Map<String, dynamic> _$AnalyticsStatsModelToJson(
  _AnalyticsStatsModel instance,
) => <String, dynamic>{
  'total_events': instance.totalEvents,
  'unique_visitors': instance.uniqueVisitors,
  'unique_sessions': instance.uniqueSessions,
  'last_event_at': instance.lastEventAt?.toIso8601String(),
};

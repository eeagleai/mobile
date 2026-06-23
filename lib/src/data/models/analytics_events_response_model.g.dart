// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_events_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyticsEventsResponseModel _$AnalyticsEventsResponseModelFromJson(
  Map<String, dynamic> json,
) => _AnalyticsEventsResponseModel(
  apikey: json['apikey'] as String?,
  events:
      (json['events'] as List<dynamic>?)
          ?.map((e) => AnalyticsEventModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AnalyticsEventsResponseModelToJson(
  _AnalyticsEventsResponseModel instance,
) => <String, dynamic>{'apikey': instance.apikey, 'events': instance.events};

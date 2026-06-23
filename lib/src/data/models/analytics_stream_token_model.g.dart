// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_stream_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyticsStreamTokenModel _$AnalyticsStreamTokenModelFromJson(
  Map<String, dynamic> json,
) => _AnalyticsStreamTokenModel(
  apikey: json['apikey'] as String,
  token: json['token'] as String,
  wsUrl: json['ws_url'] as String,
);

Map<String, dynamic> _$AnalyticsStreamTokenModelToJson(
  _AnalyticsStreamTokenModel instance,
) => <String, dynamic>{
  'apikey': instance.apikey,
  'token': instance.token,
  'ws_url': instance.wsUrl,
};

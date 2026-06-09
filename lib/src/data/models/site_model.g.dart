// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SiteModel _$SiteModelFromJson(Map<String, dynamic> json) => _SiteModel(
  apikey: json['apikey'] as String,
  siteId: json['site_id'] as String,
  name: json['name'] as String,
  host: json['host'] as String,
  quota: json['quota'] == null
      ? null
      : SiteQuotaModel.fromJson(json['quota'] as Map<String, dynamic>),
  subscriptionStatus: json['subscription_status'] as String?,
);

Map<String, dynamic> _$SiteModelToJson(_SiteModel instance) =>
    <String, dynamic>{
      'apikey': instance.apikey,
      'site_id': instance.siteId,
      'name': instance.name,
      'host': instance.host,
      'quota': instance.quota,
      'subscription_status': instance.subscriptionStatus,
    };

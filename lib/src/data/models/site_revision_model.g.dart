// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_revision_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SiteRevisionModel _$SiteRevisionModelFromJson(Map<String, dynamic> json) =>
    _SiteRevisionModel(
      id: json['id'] as String,
      apikey: json['apikey'] as String? ?? '',
      sha256: json['sha256'] as String? ?? '',
      kind: json['kind'] as String? ?? 'frontend',
      bytes: (json['bytes'] as num?)?.toInt(),
      userSummary: json['user_summary'] as String?,
      createdAt: DateTime.parse(json['created_at_iso'] as String),
      changeId: json['change_id'] as String?,
      quotaConsumed: json['quota_consumed'] as bool? ?? false,
    );

Map<String, dynamic> _$SiteRevisionModelToJson(_SiteRevisionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apikey': instance.apikey,
      'sha256': instance.sha256,
      'kind': instance.kind,
      'bytes': instance.bytes,
      'user_summary': instance.userSummary,
      'created_at_iso': instance.createdAt.toIso8601String(),
      'change_id': instance.changeId,
      'quota_consumed': instance.quotaConsumed,
    };

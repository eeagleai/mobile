// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_rollback_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SiteRollbackReloadModel _$SiteRollbackReloadModelFromJson(
  Map<String, dynamic> json,
) => _SiteRollbackReloadModel(dte: json['dte'] as bool? ?? false);

Map<String, dynamic> _$SiteRollbackReloadModelToJson(
  _SiteRollbackReloadModel instance,
) => <String, dynamic>{'dte': instance.dte};

_SiteRollbackResponseModel _$SiteRollbackResponseModelFromJson(
  Map<String, dynamic> json,
) => _SiteRollbackResponseModel(
  rolledBackTo: json['rolled_back_to'] as String,
  sha256: json['sha256'] as String?,
  kind: json['kind'] as String?,
  kinds:
      (json['kinds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  quotaRefunded: json['quota_refunded'] as bool? ?? false,
  quota: json['quota'] == null
      ? null
      : SiteQuotaModel.fromJson(json['quota'] as Map<String, dynamic>),
  reload: json['reload'] == null
      ? null
      : SiteRollbackReloadModel.fromJson(
          json['reload'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$SiteRollbackResponseModelToJson(
  _SiteRollbackResponseModel instance,
) => <String, dynamic>{
  'rolled_back_to': instance.rolledBackTo,
  'sha256': instance.sha256,
  'kind': instance.kind,
  'kinds': instance.kinds,
  'quota_refunded': instance.quotaRefunded,
  'quota': instance.quota,
  'reload': instance.reload,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_revisions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SiteRevisionsResponseModel _$SiteRevisionsResponseModelFromJson(
  Map<String, dynamic> json,
) => _SiteRevisionsResponseModel(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => SiteRevisionModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$SiteRevisionsResponseModelToJson(
  _SiteRevisionsResponseModel instance,
) => <String, dynamic>{'items': instance.items};

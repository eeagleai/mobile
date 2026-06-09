// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sites_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SitesResponseModel _$SitesResponseModelFromJson(Map<String, dynamic> json) =>
    _SitesResponseModel(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => SiteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SitesResponseModelToJson(_SitesResponseModel instance) =>
    <String, dynamic>{'items': instance.items};

import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_quota_model.freezed.dart';
part 'site_quota_model.g.dart';

@freezed
abstract class SiteQuotaModel with _$SiteQuotaModel {
  const factory SiteQuotaModel({
    @JsonKey(name: 'remaining') int? remaining,
  }) = _SiteQuotaModel;

  factory SiteQuotaModel.fromJson(Map<String, dynamic> json) =>
      _$SiteQuotaModelFromJson(json);
}

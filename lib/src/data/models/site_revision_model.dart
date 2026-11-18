import 'package:eeagle_ai/src/domain/model/site_revision.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_revision_model.freezed.dart';
part 'site_revision_model.g.dart';

@freezed
abstract class SiteRevisionModel with _$SiteRevisionModel {
  const SiteRevisionModel._();

  const factory SiteRevisionModel({
    required String id,
    @Default('') String apikey,
    @Default('') String sha256,
    @Default('frontend') String kind,
    int? bytes,
    @JsonKey(name: 'user_summary') String? userSummary,
    @JsonKey(name: 'created_at_iso') required DateTime createdAt,
    @JsonKey(name: 'change_id') String? changeId,
    @JsonKey(name: 'quota_consumed') @Default(false) bool quotaConsumed,
  }) = _SiteRevisionModel;

  factory SiteRevisionModel.fromJson(Map<String, dynamic> json) =>
      _$SiteRevisionModelFromJson(json);

  SiteRevision toEntity() {
    return SiteRevision(
      id: id,
      sha256: sha256,
      kind: kind,
      createdAt: createdAt,
      userSummary: userSummary,
      changeId: changeId,
      bytes: bytes,
      quotaConsumed: quotaConsumed,
    );
  }
}

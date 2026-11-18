import 'package:eeagle_ai/src/data/models/site_quota_model.dart';
import 'package:eeagle_ai/src/domain/model/site_rollback_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_rollback_response_model.freezed.dart';
part 'site_rollback_response_model.g.dart';

@freezed
abstract class SiteRollbackReloadModel with _$SiteRollbackReloadModel {
  const factory SiteRollbackReloadModel({@Default(false) bool dte}) =
      _SiteRollbackReloadModel;

  factory SiteRollbackReloadModel.fromJson(Map<String, dynamic> json) =>
      _$SiteRollbackReloadModelFromJson(json);
}

@freezed
abstract class SiteRollbackResponseModel with _$SiteRollbackResponseModel {
  const SiteRollbackResponseModel._();

  const factory SiteRollbackResponseModel({
    @JsonKey(name: 'rolled_back_to') required String rolledBackTo,
    String? sha256,
    String? kind,
    @Default([]) List<String> kinds,
    @JsonKey(name: 'quota_refunded') @Default(false) bool quotaRefunded,
    SiteQuotaModel? quota,
    SiteRollbackReloadModel? reload,
  }) = _SiteRollbackResponseModel;

  factory SiteRollbackResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SiteRollbackResponseModelFromJson(json);

  SiteRollbackResult toEntity() {
    return SiteRollbackResult(
      rolledBackTo: rolledBackTo,
      sha256: sha256,
      kind: kind ?? (kinds.isEmpty ? 'frontend' : kinds.first),
      quotaRefunded: quotaRefunded,
      quotaRemaining: quota?.remaining,
      reloadSucceeded: reload?.dte ?? false,
    );
  }
}

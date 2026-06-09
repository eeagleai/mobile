import 'package:eeagle_ai/src/data/models/site_quota_model.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_model.freezed.dart';
part 'site_model.g.dart';

@freezed
abstract class SiteModel with _$SiteModel {
  const SiteModel._();

  const factory SiteModel({
    required String apikey,
    @JsonKey(name: 'site_id') required String siteId,
    required String name,
    required String host,
    SiteQuotaModel? quota,
    @JsonKey(name: 'subscription_status') String? subscriptionStatus,
  }) = _SiteModel;

  factory SiteModel.fromJson(Map<String, dynamic> json) =>
      _$SiteModelFromJson(json);

  Site toEntity() {
    return Site(
      apikey: apikey,
      siteId: siteId,
      name: name,
      host: host,
      subscriptionStatus: subscriptionStatus,
      quotaRemaining: quota?.remaining,
    );
  }
}

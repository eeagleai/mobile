import 'package:eeagle_ai/src/data/models/site_model.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sites_response_model.freezed.dart';
part 'sites_response_model.g.dart';

@freezed
abstract class SitesResponseModel with _$SitesResponseModel {
  const SitesResponseModel._();

  const factory SitesResponseModel({
    @Default([]) List<SiteModel> items,
  }) = _SitesResponseModel;

  factory SitesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SitesResponseModelFromJson(json);

  List<Site> toEntities() {
    return items.map((item) => item.toEntity()).toList();
  }
}

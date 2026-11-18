import 'package:eeagle_ai/src/data/models/site_revision_model.dart';
import 'package:eeagle_ai/src/domain/model/site_revision.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_revisions_response_model.freezed.dart';
part 'site_revisions_response_model.g.dart';

@freezed
abstract class SiteRevisionsResponseModel with _$SiteRevisionsResponseModel {
  const SiteRevisionsResponseModel._();

  const factory SiteRevisionsResponseModel({
    @Default([]) List<SiteRevisionModel> items,
  }) = _SiteRevisionsResponseModel;

  factory SiteRevisionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SiteRevisionsResponseModelFromJson(json);

  List<SiteRevision> toEntities() =>
      items.map((revision) => revision.toEntity()).toList(growable: false);
}

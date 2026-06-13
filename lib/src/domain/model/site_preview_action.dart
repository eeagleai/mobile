import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_preview_action.freezed.dart';

@freezed
sealed class SitePreviewAction with _$SitePreviewAction {
  const factory SitePreviewAction.open({
    required String url,
  }) = SitePreviewActionOpen;

  const factory SitePreviewAction.choose({
    required List<String> urls,
  }) = SitePreviewActionChoose;
}

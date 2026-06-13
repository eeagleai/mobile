import 'package:freezed_annotation/freezed_annotation.dart';

part 'clickable_page_link.freezed.dart';

@freezed
abstract class ClickablePageLink with _$ClickablePageLink {
  const factory ClickablePageLink({
    required String path,
    required String url,
  }) = _ClickablePageLink;
}

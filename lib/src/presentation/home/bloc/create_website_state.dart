part of 'create_website_bloc.dart';

@freezed
sealed class CreateWebsiteState with _$CreateWebsiteState {
  const factory CreateWebsiteState({
    @Default('') String prompt,
    @Default(false) bool isBuilding,
    @Default(false) bool isComplete,
    WebsiteBuildStatus? build,
    String? errorMessage,
  }) = _CreateWebsiteState;
}

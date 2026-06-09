part of 'sites_bloc.dart';

@freezed
sealed class SitesState with _$SitesState {
  const factory SitesState({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    @Default([]) List<Site> sites,
    String? errorMessage,
  }) = _SitesState;
}

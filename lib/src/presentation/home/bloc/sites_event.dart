part of 'sites_bloc.dart';

@freezed
sealed class SitesEvent with _$SitesEvent {
  const factory SitesEvent.started() = _Started;

  const factory SitesEvent.refreshRequested() = _RefreshRequested;
}

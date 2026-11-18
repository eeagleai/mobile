part of 'revision_history_bloc.dart';

@freezed
sealed class RevisionHistoryEvent with _$RevisionHistoryEvent {
  const factory RevisionHistoryEvent.started({required String siteApiKey}) =
      _Started;

  const factory RevisionHistoryEvent.refreshRequested() = _RefreshRequested;

  const factory RevisionHistoryEvent.rollbackRequested({
    required SiteRevision revision,
  }) = _RollbackRequested;
}

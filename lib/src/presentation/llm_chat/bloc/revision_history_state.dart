part of 'revision_history_bloc.dart';

@freezed
sealed class RevisionHistoryState with _$RevisionHistoryState {
  const factory RevisionHistoryState({
    @Default(RevisionHistoryStatus.initial) RevisionHistoryStatus status,
    @Default([]) List<SiteRevision> revisions,
    @Default(false) bool isRefreshing,
    @Default(false) bool isRollingBack,
    String? rollingBackRevisionId,
    String? errorMessage,
    String? rollbackErrorMessage,
    SiteRollbackResult? rollbackResult,
  }) = _RevisionHistoryState;
}

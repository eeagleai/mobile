import 'package:eeagle_ai/src/domain/model/site_revision.dart';
import 'package:eeagle_ai/src/domain/model/site_rollback_result.dart';
import 'package:eeagle_ai/src/domain/use_case/get_site_revisions_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/rollback_site_revision_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'revision_history_event.dart';
part 'revision_history_state.dart';
part 'revision_history_bloc.freezed.dart';

enum RevisionHistoryStatus { initial, loading, loaded, failure }

class RevisionHistoryBloc
    extends Bloc<RevisionHistoryEvent, RevisionHistoryState> {
  RevisionHistoryBloc(this._getSiteRevisions, this._rollbackSiteRevision)
    : super(const RevisionHistoryState()) {
    on<_Started>(_onStarted);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_RollbackRequested>(_onRollbackRequested);
  }

  final GetSiteRevisionsUseCase _getSiteRevisions;
  final RollbackSiteRevisionUseCase _rollbackSiteRevision;
  String? _siteApiKey;

  Future<void> _onStarted(
    _Started event,
    Emitter<RevisionHistoryState> emit,
  ) async {
    _siteApiKey = event.siteApiKey;
    await _load(emit, showLoading: true);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<RevisionHistoryState> emit,
  ) async {
    await _load(emit, showLoading: state.revisions.isEmpty);
  }

  Future<void> _load(
    Emitter<RevisionHistoryState> emit, {
    required bool showLoading,
  }) async {
    final siteApiKey = _siteApiKey;
    if (siteApiKey == null) {
      return;
    }

    emit(
      state.copyWith(
        status: showLoading ? RevisionHistoryStatus.loading : state.status,
        isRefreshing: !showLoading,
        errorMessage: null,
        rollbackErrorMessage: null,
      ),
    );

    final result = await _getSiteRevisions(siteApiKey).run();
    if (emit.isDone) {
      return;
    }

    result.match(
      (failure) => emit(
        state.copyWith(
          status: state.revisions.isEmpty
              ? RevisionHistoryStatus.failure
              : RevisionHistoryStatus.loaded,
          isRefreshing: false,
          errorMessage: failure.message,
        ),
      ),
      (revisions) => emit(
        state.copyWith(
          status: RevisionHistoryStatus.loaded,
          revisions: revisions,
          isRefreshing: false,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> _onRollbackRequested(
    _RollbackRequested event,
    Emitter<RevisionHistoryState> emit,
  ) async {
    final siteApiKey = _siteApiKey;
    if (siteApiKey == null || state.isRollingBack) {
      return;
    }

    emit(
      state.copyWith(
        isRollingBack: true,
        rollingBackRevisionId: event.revision.id,
        rollbackErrorMessage: null,
        rollbackResult: null,
      ),
    );

    final result = await _rollbackSiteRevision(
      siteApiKey: siteApiKey,
      revisionIdOrSha: event.revision.id,
    ).run();
    if (emit.isDone) {
      return;
    }

    result.match(
      (failure) => emit(
        state.copyWith(
          isRollingBack: false,
          rollingBackRevisionId: null,
          rollbackErrorMessage: failure.message,
        ),
      ),
      (rollbackResult) => emit(
        state.copyWith(
          isRollingBack: false,
          rollingBackRevisionId: null,
          rollbackErrorMessage: null,
          rollbackResult: rollbackResult,
        ),
      ),
    );
  }
}

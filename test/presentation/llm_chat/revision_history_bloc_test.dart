import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/site_revision.dart';
import 'package:eeagle_ai/src/domain/model/site_rollback_result.dart';
import 'package:eeagle_ai/src/domain/use_case/get_site_revisions_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/rollback_site_revision_use_case.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/revision_history_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetSiteRevisionsUseCase extends Mock
    implements GetSiteRevisionsUseCase {}

class _MockRollbackSiteRevisionUseCase extends Mock
    implements RollbackSiteRevisionUseCase {}

final _revision = SiteRevision(
  id: 'revision-1',
  sha256: 'sha-1',
  kind: 'frontend',
  createdAt: DateTime.utc(2026, 7, 14, 10, 15),
  userSummary: 'Improve the homepage CTA',
);

const _rollbackResult = SiteRollbackResult(
  rolledBackTo: 'revision-1',
  sha256: 'sha-1',
  kind: 'frontend',
  quotaRefunded: true,
  quotaRemaining: 9,
  reloadSucceeded: true,
);

void main() {
  late _MockGetSiteRevisionsUseCase getRevisions;
  late _MockRollbackSiteRevisionUseCase rollbackRevision;

  setUp(() {
    getRevisions = _MockGetSiteRevisionsUseCase();
    rollbackRevision = _MockRollbackSiteRevisionUseCase();
  });

  RevisionHistoryBloc createBloc() =>
      RevisionHistoryBloc(getRevisions, rollbackRevision);

  blocTest<RevisionHistoryBloc, RevisionHistoryState>(
    'loads revision history',
    build: () {
      when(
        () => getRevisions('site-key'),
      ).thenReturn(TaskEither.right([_revision]));
      return createBloc();
    },
    act: (bloc) =>
        bloc.add(const RevisionHistoryEvent.started(siteApiKey: 'site-key')),
    expect: () => [
      const RevisionHistoryState(status: RevisionHistoryStatus.loading),
      RevisionHistoryState(
        status: RevisionHistoryStatus.loaded,
        revisions: [_revision],
      ),
    ],
  );

  blocTest<RevisionHistoryBloc, RevisionHistoryState>(
    'shows an empty loaded state',
    build: () {
      when(
        () => getRevisions('site-key'),
      ).thenReturn(TaskEither.right(const []));
      return createBloc();
    },
    act: (bloc) =>
        bloc.add(const RevisionHistoryEvent.started(siteApiKey: 'site-key')),
    expect: () => [
      const RevisionHistoryState(status: RevisionHistoryStatus.loading),
      const RevisionHistoryState(status: RevisionHistoryStatus.loaded),
    ],
  );

  blocTest<RevisionHistoryBloc, RevisionHistoryState>(
    'keeps revisions visible when rollback fails',
    build: () {
      when(
        () => getRevisions('site-key'),
      ).thenReturn(TaskEither.right([_revision]));
      when(
        () => rollbackRevision(
          siteApiKey: 'site-key',
          revisionIdOrSha: 'revision-1',
        ),
      ).thenReturn(
        TaskEither.left(const OperationFailure('Unable to restore version.')),
      );
      return createBloc();
    },
    act: (bloc) async {
      bloc.add(const RevisionHistoryEvent.started(siteApiKey: 'site-key'));
      await bloc.stream.firstWhere(
        (state) => state.status == RevisionHistoryStatus.loaded,
      );
      bloc.add(RevisionHistoryEvent.rollbackRequested(revision: _revision));
    },
    expect: () => [
      const RevisionHistoryState(status: RevisionHistoryStatus.loading),
      RevisionHistoryState(
        status: RevisionHistoryStatus.loaded,
        revisions: [_revision],
      ),
      RevisionHistoryState(
        status: RevisionHistoryStatus.loaded,
        revisions: [_revision],
        isRollingBack: true,
        rollingBackRevisionId: 'revision-1',
      ),
      RevisionHistoryState(
        status: RevisionHistoryStatus.loaded,
        revisions: [_revision],
        rollbackErrorMessage: 'Unable to restore version.',
      ),
    ],
  );

  blocTest<RevisionHistoryBloc, RevisionHistoryState>(
    'emits rollback result on success',
    build: () {
      when(
        () => getRevisions('site-key'),
      ).thenReturn(TaskEither.right([_revision]));
      when(
        () => rollbackRevision(
          siteApiKey: 'site-key',
          revisionIdOrSha: 'revision-1',
        ),
      ).thenReturn(TaskEither.right(_rollbackResult));
      return createBloc();
    },
    act: (bloc) async {
      bloc.add(const RevisionHistoryEvent.started(siteApiKey: 'site-key'));
      await bloc.stream.firstWhere(
        (state) => state.status == RevisionHistoryStatus.loaded,
      );
      bloc.add(RevisionHistoryEvent.rollbackRequested(revision: _revision));
    },
    expect: () => [
      const RevisionHistoryState(status: RevisionHistoryStatus.loading),
      RevisionHistoryState(
        status: RevisionHistoryStatus.loaded,
        revisions: [_revision],
      ),
      RevisionHistoryState(
        status: RevisionHistoryStatus.loaded,
        revisions: [_revision],
        isRollingBack: true,
        rollingBackRevisionId: 'revision-1',
      ),
      RevisionHistoryState(
        status: RevisionHistoryStatus.loaded,
        revisions: [_revision],
        rollbackResult: _rollbackResult,
      ),
    ],
  );

  test('ignores another rollback while one is running', () async {
    final completer = Completer<SiteRollbackResult>();
    when(
      () => getRevisions('site-key'),
    ).thenReturn(TaskEither.right([_revision]));
    when(
      () => rollbackRevision(
        siteApiKey: 'site-key',
        revisionIdOrSha: 'revision-1',
      ),
    ).thenReturn(TaskEither(() async => right(await completer.future)));
    final bloc = createBloc();

    bloc.add(const RevisionHistoryEvent.started(siteApiKey: 'site-key'));
    await bloc.stream.firstWhere(
      (state) => state.status == RevisionHistoryStatus.loaded,
    );
    bloc
      ..add(RevisionHistoryEvent.rollbackRequested(revision: _revision))
      ..add(RevisionHistoryEvent.rollbackRequested(revision: _revision));
    await Future<void>.delayed(const Duration(milliseconds: 10));

    verify(
      () => rollbackRevision(
        siteApiKey: 'site-key',
        revisionIdOrSha: 'revision-1',
      ),
    ).called(1);

    completer.complete(_rollbackResult);
    await bloc.stream.firstWhere((state) => state.rollbackResult != null);
    await bloc.close();
  });
}

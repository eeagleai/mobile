import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/use_case/get_sites_use_case.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/sites_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetSitesUseCase extends Mock implements GetSitesUseCase {}

const _sites = [
  Site(
    apikey: 'site-key-1',
    siteId: 'site-1',
    name: 'Example Site',
    host: 'example.com',
    quotaRemaining: 9,
  ),
];

void main() {
  late _MockGetSitesUseCase getSitesUseCase;
  late SitesBloc bloc;

  setUp(() {
    getSitesUseCase = _MockGetSitesUseCase();
    bloc = SitesBloc(getSitesUseCase);
  });

  tearDown(() => bloc.close());

  blocTest<SitesBloc, SitesState>(
    'loads sites on start',
    build: () {
      when(() => getSitesUseCase()).thenAnswer(
        (_) => TaskEither.right(_sites),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const SitesEvent.started()),
    expect: () => [
      const SitesState(isLoading: true),
      const SitesState(sites: _sites),
    ],
  );

  blocTest<SitesBloc, SitesState>(
    'emits error when loading fails',
    build: () {
      when(() => getSitesUseCase()).thenAnswer(
        (_) => TaskEither.left(
          const OperationFailure('Unable to load websites.'),
        ),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const SitesEvent.started()),
    expect: () => [
      const SitesState(isLoading: true),
      const SitesState(errorMessage: 'Unable to load websites.'),
    ],
  );

  blocTest<SitesBloc, SitesState>(
    'refreshes sites list',
    build: () {
      when(() => getSitesUseCase()).thenAnswer(
        (_) => TaskEither.right(_sites),
      );
      return bloc;
    },
    seed: () => const SitesState(sites: _sites),
    act: (bloc) => bloc.add(const SitesEvent.refreshRequested()),
    expect: () => [
      const SitesState(sites: _sites, isRefreshing: true),
      const SitesState(sites: _sites),
    ],
  );
}

import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/use_case/logout_use_case.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockLogoutUseCase extends Mock implements LogoutUseCase {}

void main() {
  late _MockLogoutUseCase logoutUseCase;
  late HomeBloc bloc;

  setUp(() {
    logoutUseCase = _MockLogoutUseCase();
    bloc = HomeBloc(logoutUseCase);
  });

  tearDown(() => bloc.close());

  blocTest<HomeBloc, HomeState>(
    'emits loading then success on logout',
    build: () {
      when(() => logoutUseCase()).thenReturn(TaskEither(() async => right(unit)));
      return bloc;
    },
    act: (bloc) => bloc.add(const HomeEvent.logoutRequested()),
    expect: () => [
      const HomeState(isLoggingOut: true),
      const HomeState(logoutSucceeded: true),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'emits failure message when logout fails',
    build: () {
      when(() => logoutUseCase()).thenReturn(
        TaskEither(
          () async => left(const OperationFailure('Logout failed')),
        ),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const HomeEvent.logoutRequested()),
    expect: () => [
      const HomeState(isLoggingOut: true),
      const HomeState(errorMessage: 'Logout failed'),
    ],
  );
}

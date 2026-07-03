import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/use_case/clear_live_assist_local_data_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/logout_use_case.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockLogoutUseCase extends Mock implements LogoutUseCase {}

class _MockClearLiveAssistLocalDataUseCase extends Mock
    implements ClearLiveAssistLocalDataUseCase {}

void main() {
  late _MockLogoutUseCase logoutUseCase;
  late _MockClearLiveAssistLocalDataUseCase clearLiveAssistLocalDataUseCase;
  late HomeBloc bloc;

  setUp(() {
    logoutUseCase = _MockLogoutUseCase();
    clearLiveAssistLocalDataUseCase = _MockClearLiveAssistLocalDataUseCase();
    when(() => clearLiveAssistLocalDataUseCase()).thenAnswer((_) async {});
    bloc = HomeBloc(logoutUseCase, clearLiveAssistLocalDataUseCase);
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
    verify: (_) {
      verify(() => clearLiveAssistLocalDataUseCase()).called(1);
    },
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
    verify: (_) {
      verifyNever(() => clearLiveAssistLocalDataUseCase());
    },
  );
}

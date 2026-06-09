import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/auth_session.dart';
import 'package:eeagle_ai/src/domain/model/auth_user.dart';
import 'package:eeagle_ai/src/domain/use_case/login_use_case.dart';
import 'package:eeagle_ai/src/presentation/login/bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoginUseCase extends Mock implements LoginUseCase {}

const _session = AuthSession(
  accessToken: 'jwt-token',
  user: AuthUser(
    id: 'user-1',
    email: 'owner@example.com',
    emailVerified: true,
    admin: false,
  ),
);

void main() {
  late _MockLoginUseCase loginUseCase;
  late LoginBloc bloc;

  setUp(() {
    loginUseCase = _MockLoginUseCase();
    bloc = LoginBloc(loginUseCase);
  });

  tearDown(() => bloc.close());

  blocTest<LoginBloc, LoginState>(
    'shows validation error for empty credentials',
    build: () => bloc,
    act: (bloc) => bloc.add(
      const LoginEvent.loginSubmitted(email: ' ', password: ''),
    ),
    expect: () => [
      const LoginState(
        submissionAttempt: 1,
        errorMessage: 'Please enter your email and password.',
      ),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    're-emits validation error on repeated empty submits',
    build: () => bloc,
    act: (bloc) {
      bloc.add(const LoginEvent.loginSubmitted(email: ' ', password: ''));
      bloc.add(const LoginEvent.loginSubmitted(email: '', password: ''));
    },
    expect: () => [
      const LoginState(
        submissionAttempt: 1,
        errorMessage: 'Please enter your email and password.',
      ),
      const LoginState(
        submissionAttempt: 2,
        errorMessage: 'Please enter your email and password.',
      ),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'emits loading then success on valid login',
    build: () {
      when(
        () => loginUseCase(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) => TaskEither.right(_session));
      return bloc;
    },
    act: (bloc) => bloc.add(
      const LoginEvent.loginSubmitted(
        email: 'owner@example.com',
        password: 'password',
      ),
    ),
    expect: () => [
      const LoginState(submissionAttempt: 1, isLoading: true),
      const LoginState(submissionAttempt: 1, loginSucceeded: true),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'emits failure message on login error',
    build: () {
      when(
        () => loginUseCase(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) => TaskEither.left(
          const OperationFailure(
            'Invalid email or password.',
            code: 'http-422',
          ),
        ),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(
      const LoginEvent.loginSubmitted(
        email: 'owner@example.com',
        password: 'wrong',
      ),
    ),
    expect: () => [
      const LoginState(submissionAttempt: 1, isLoading: true),
      const LoginState(
        submissionAttempt: 1,
        errorMessage: 'Invalid email or password.',
      ),
    ],
  );
}

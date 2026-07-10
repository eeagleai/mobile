import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/signup_result.dart';
import 'package:eeagle_ai/src/domain/use_case/signup_use_case.dart';
import 'package:eeagle_ai/src/presentation/signup/bloc/signup_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockSignupUseCase extends Mock implements SignupUseCase {}

void main() {
  late _MockSignupUseCase signupUseCase;

  setUp(() {
    signupUseCase = _MockSignupUseCase();
  });

  blocTest<SignupBloc, SignupState>(
    'shows validation error when email is missing',
    build: () => SignupBloc(signupUseCase),
    act: (bloc) => bloc.add(
      const SignupEvent.signupSubmitted(
        email: '',
        password: 'password123',
        passwordConfirmation: 'password123',
        agree: true,
      ),
    ),
    expect: () => [
      isA<SignupState>()
          .having(
            (state) => state.errorMessage,
            'error',
            'Please enter your email.',
          )
          .having((state) => state.signupSucceeded, 'signupSucceeded', isFalse),
    ],
    verify: (_) {
      verifyNever(
        () => signupUseCase(
          email: any(named: 'email'),
          password: any(named: 'password'),
          passwordConfirmation: any(named: 'passwordConfirmation'),
          agree: any(named: 'agree'),
        ),
      );
    },
  );

  blocTest<SignupBloc, SignupState>(
    'shows validation error when passwords do not match',
    build: () => SignupBloc(signupUseCase),
    act: (bloc) => bloc.add(
      const SignupEvent.signupSubmitted(
        email: 'owner@example.com',
        password: 'password123',
        passwordConfirmation: 'password456',
        agree: true,
      ),
    ),
    expect: () => [
      isA<SignupState>().having(
        (state) => state.errorMessage,
        'error',
        'Passwords do not match.',
      ),
    ],
  );

  blocTest<SignupBloc, SignupState>(
    'submits signup successfully',
    build: () {
      when(
        () => signupUseCase(
          email: any(named: 'email'),
          password: any(named: 'password'),
          passwordConfirmation: any(named: 'passwordConfirmation'),
          agree: any(named: 'agree'),
        ),
      ).thenAnswer(
        (_) => TaskEither.right(
          const SignupResult(message: 'Account created. Check your email.'),
        ),
      );
      return SignupBloc(signupUseCase);
    },
    act: (bloc) => bloc.add(
      const SignupEvent.signupSubmitted(
        email: ' owner@example.com ',
        password: 'password123',
        passwordConfirmation: 'password123',
        agree: true,
      ),
    ),
    expect: () => [
      isA<SignupState>().having(
        (state) => state.isLoading,
        'isLoading',
        isTrue,
      ),
      isA<SignupState>()
          .having((state) => state.isLoading, 'isLoading', isFalse)
          .having((state) => state.signupSucceeded, 'signupSucceeded', isTrue)
          .having(
            (state) => state.successMessage,
            'successMessage',
            'Account created. Check your email.',
          ),
    ],
    verify: (_) {
      verify(
        () => signupUseCase(
          email: 'owner@example.com',
          password: 'password123',
          passwordConfirmation: 'password123',
          agree: true,
        ),
      ).called(1);
    },
  );

  blocTest<SignupBloc, SignupState>(
    'shows signup failure',
    build: () {
      when(
        () => signupUseCase(
          email: any(named: 'email'),
          password: any(named: 'password'),
          passwordConfirmation: any(named: 'passwordConfirmation'),
          agree: any(named: 'agree'),
        ),
      ).thenAnswer(
        (_) => TaskEither.left(
          const OperationFailure('Email is already registered.'),
        ),
      );
      return SignupBloc(signupUseCase);
    },
    act: (bloc) => bloc.add(
      const SignupEvent.signupSubmitted(
        email: 'owner@example.com',
        password: 'password123',
        passwordConfirmation: 'password123',
        agree: true,
      ),
    ),
    expect: () => [
      isA<SignupState>().having(
        (state) => state.isLoading,
        'isLoading',
        isTrue,
      ),
      isA<SignupState>()
          .having((state) => state.isLoading, 'isLoading', isFalse)
          .having((state) => state.signupSucceeded, 'signupSucceeded', isFalse)
          .having(
            (state) => state.errorMessage,
            'error',
            'Email is already registered.',
          ),
    ],
  );
}

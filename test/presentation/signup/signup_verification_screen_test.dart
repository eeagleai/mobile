import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/auth_session.dart';
import 'package:eeagle_ai/src/domain/model/auth_user.dart';
import 'package:eeagle_ai/src/domain/use_case/login_use_case.dart';
import 'package:eeagle_ai/src/presentation/login/bloc/login_bloc.dart';
import 'package:eeagle_ai/src/presentation/login/widgets/login_primary_button.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes_constants.dart';
import 'package:eeagle_ai/src/presentation/signup/signup_verification_screen.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoginUseCase extends Mock implements LoginUseCase {}

const _args = SignupVerificationScreenArgs(
  email: 'owner@example.com',
  password: 'password123',
  message: 'Account created. Check your email.',
);

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
  late LoginBloc loginBloc;

  setUp(() {
    loginUseCase = _MockLoginUseCase();
    loginBloc = LoginBloc(loginUseCase);
  });

  tearDown(() => loginBloc.close());

  Future<void> completeLogin(LoginBloc bloc) {
    final loginFuture = bloc.stream.firstWhere(
      (state) => state.submissionAttempt > 0 && !state.isLoading,
    );
    return loginFuture;
  }

  test('login with signup credentials succeeds', () async {
    when(
      () => loginUseCase(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) => TaskEither.right(_session));

    final loginFuture = completeLogin(loginBloc);
    loginBloc.add(
      LoginEvent.loginSubmitted(
        email: _args.email,
        password: _args.password,
      ),
    );
    await loginFuture;

    expect(loginBloc.state.loginSucceeded, isTrue);
    verify(
      () => loginUseCase(
        email: 'owner@example.com',
        password: 'password123',
      ),
    ).called(1);
  });

  test('login before email verification returns failure', () async {
    when(
      () => loginUseCase(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        const OperationFailure('Email verification required.'),
      ),
    );

    final loginFuture = completeLogin(loginBloc);
    loginBloc.add(
      LoginEvent.loginSubmitted(
        email: _args.email,
        password: _args.password,
      ),
    );
    await loginFuture;

    expect(loginBloc.state.loginSucceeded, isFalse);
    expect(loginBloc.state.errorMessage, 'Email verification required.');
  });

  testWidgets('Signup verification route opens verification screen', (
    tester,
  ) async {
    await di.reset();
    await configureDependencies();

    await tester.pumpWidget(
      EeagleTheme(
        data: appTheme,
        child: MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: RoutesConstants.signupVerification,
          onGenerateInitialRoutes: (initialRoute) {
            return [
              AppRoutes.generateRoute(
                RouteSettings(
                  name: initialRoute,
                  arguments: _args,
                ),
              ),
            ];
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(SignupVerificationScreen), findsOneWidget);
    expect(find.text('Check your email'), findsOneWidget);
    expect(find.text('owner@example.com'), findsOneWidget);
    expect(find.text('Account created. Check your email.'), findsOneWidget);
    expect(find.byType(LoginPrimaryButton), findsOneWidget);
    expect(find.text('Back to Login'), findsNothing);
    expect(
      find.text('After verifying your email, tap Login below to continue.'),
      findsOneWidget,
    );
  });
}

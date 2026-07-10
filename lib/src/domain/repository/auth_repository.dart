import 'package:eeagle_ai/src/domain/model/auth_session.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/signup_result.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  TaskEither<OperationFailure, AuthSession> login({
    required String email,
    required String password,
  });

  TaskEither<OperationFailure, SignupResult> signup({
    required String email,
    required String password,
    required String passwordConfirmation,
    required bool agree,
  });

  TaskEither<OperationFailure, AuthSession> restoreSession();

  TaskEither<OperationFailure, Unit> logout();
}

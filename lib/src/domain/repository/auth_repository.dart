import 'package:eeagle_ai/src/domain/model/auth_session.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  TaskEither<OperationFailure, AuthSession> login({
    required String email,
    required String password,
  });

  TaskEither<OperationFailure, AuthSession> restoreSession();

  TaskEither<OperationFailure, Unit> logout();
}

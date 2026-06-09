import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/auth_session.dart';
import 'package:eeagle_ai/src/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class RestoreSessionUseCase {
  RestoreSessionUseCase(this._authRepository);

  final AuthRepository _authRepository;

  TaskEither<OperationFailure, AuthSession> call() {
    return _authRepository.restoreSession();
  }
}

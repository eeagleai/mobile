import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LogoutUseCase {
  LogoutUseCase(this._authRepository);

  final AuthRepository _authRepository;

  TaskEither<OperationFailure, Unit> call() {
    return _authRepository.logout();
  }
}

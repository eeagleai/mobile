import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/signup_result.dart';
import 'package:eeagle_ai/src/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignupUseCase {
  SignupUseCase(this._authRepository);

  final AuthRepository _authRepository;

  TaskEither<OperationFailure, SignupResult> call({
    required String email,
    required String password,
    required String passwordConfirmation,
    required bool agree,
  }) {
    return _authRepository.signup(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      agree: agree,
    );
  }
}

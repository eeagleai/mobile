import 'package:eeagle_ai/src/domain/use_case/signup_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_event.dart';
part 'signup_state.dart';
part 'signup_bloc.freezed.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this._signupUseCase) : super(const SignupState()) {
    on<_SignupSubmitted>(_onSignupSubmitted);
  }

  final SignupUseCase _signupUseCase;

  Future<void> _onSignupSubmitted(
    _SignupSubmitted event,
    Emitter<SignupState> emit,
  ) async {
    final submissionAttempt = state.submissionAttempt + 1;
    final email = event.email.trim();
    final password = event.password;
    final passwordConfirmation = event.passwordConfirmation;

    final validationError = _validationError(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      agree: event.agree,
    );
    if (validationError != null) {
      emit(
        state.copyWith(
          submissionAttempt: submissionAttempt,
          isLoading: false,
          errorMessage: validationError,
          signupSucceeded: false,
          successMessage: null,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        submissionAttempt: submissionAttempt,
        isLoading: true,
        errorMessage: null,
        signupSucceeded: false,
        successMessage: null,
      ),
    );

    final result = await _signupUseCase(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      agree: event.agree,
    ).run();
    if (isClosed) {
      return;
    }

    result.match(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
          signupSucceeded: false,
          successMessage: null,
        ),
      ),
      (signupResult) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: null,
          signupSucceeded: true,
          successMessage: signupResult.message,
        ),
      ),
    );
  }

  String? _validationError({
    required String email,
    required String password,
    required String passwordConfirmation,
    required bool agree,
  }) {
    if (email.isEmpty) {
      return 'Please enter your email.';
    }
    if (password.isEmpty) {
      return 'Please enter your password.';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters.';
    }
    if (passwordConfirmation.isEmpty) {
      return 'Please confirm your password.';
    }
    if (password != passwordConfirmation) {
      return 'Passwords do not match.';
    }
    if (!agree) {
      return 'Please accept the terms to continue.';
    }
    return null;
  }
}

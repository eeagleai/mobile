part of 'signup_bloc.dart';

@freezed
sealed class SignupState with _$SignupState {
  const factory SignupState({
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool signupSucceeded,
    String? successMessage,
    @Default(0) int submissionAttempt,
  }) = _SignupState;
}

part of 'login_bloc.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool loginSucceeded,
    @Default(0) int submissionAttempt,
  }) = _LoginState;
}

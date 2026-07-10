part of 'signup_bloc.dart';

@freezed
sealed class SignupEvent with _$SignupEvent {
  const factory SignupEvent.signupSubmitted({
    required String email,
    required String password,
    required String passwordConfirmation,
    required bool agree,
  }) = _SignupSubmitted;
}

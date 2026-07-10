class SignupRequestModel {
  const SignupRequestModel({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.agree,
  });

  final String email;
  final String password;
  final String passwordConfirmation;
  final bool agree;

  Map<String, dynamic> toJson() {
    return {
      'email': email.trim(),
      'password': password,
      'password_confirmation': passwordConfirmation,
      'agree': agree,
    };
  }
}

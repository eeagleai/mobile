import 'package:eeagle_ai/src/domain/model/auth_user.dart';

class SignupResult {
  const SignupResult({required this.message, this.user});

  final String message;
  final AuthUser? user;
}

import 'package:eeagle_ai/src/data/models/auth_user_model.dart';
import 'package:eeagle_ai/src/domain/model/signup_result.dart';

class SignupResponseModel {
  const SignupResponseModel({
    this.status,
    this.message,
    this.user,
    this.csrfToken,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];

    return SignupResponseModel(
      status: json['status']?.toString(),
      message: json['message']?.toString(),
      user: userJson is Map<String, dynamic>
          ? AuthUserModel.fromJson(userJson)
          : null,
      csrfToken: json['csrf_token']?.toString(),
    );
  }

  final String? status;
  final String? message;
  final AuthUserModel? user;
  final String? csrfToken;

  SignupResult toEntity() {
    return SignupResult(
      message:
          message ??
          'Account created. Check your email to verify your address.',
      user: user?.toEntity(),
    );
  }
}

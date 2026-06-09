import 'package:eeagle_ai/src/domain/model/auth_user.dart';

class AuthSession {
  const AuthSession({
    required this.accessToken,
    required this.user,
    this.expiresAt,
  });

  final String accessToken;
  final AuthUser user;
  final DateTime? expiresAt;

  bool get isExpired {
    final expiresAt = this.expiresAt;
    if (expiresAt == null) {
      return false;
    }

    return DateTime.now().isAfter(expiresAt);
  }
}

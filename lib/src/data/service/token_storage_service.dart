import 'package:eeagle_ai/src/domain/model/auth_session.dart';
import 'package:eeagle_ai/src/domain/model/auth_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageService {
  TokenStorageService({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(encryptedSharedPreferences: true),
              mOptions: MacOsOptions(),
            );

  static const _accessTokenKey = 'access_token';
  static const _expiresAtKey = 'access_token_expires_at';
  static const _userIdKey = 'user_id';
  static const _userEmailKey = 'user_email';
  static const _userEmailVerifiedKey = 'user_email_verified';
  static const _userAdminKey = 'user_admin';

  final FlutterSecureStorage _secureStorage;

  Future<void> saveSession(AuthSession session) async {
    await _secureStorage.write(
      key: _accessTokenKey,
      value: session.accessToken,
    );
    await _secureStorage.write(
      key: _expiresAtKey,
      value: session.expiresAt?.toIso8601String(),
    );
    await _secureStorage.write(key: _userIdKey, value: session.user.id);
    await _secureStorage.write(key: _userEmailKey, value: session.user.email);
    await _secureStorage.write(
      key: _userEmailVerifiedKey,
      value: session.user.emailVerified.toString(),
    );
    await _secureStorage.write(
      key: _userAdminKey,
      value: session.user.admin.toString(),
    );
  }

  Future<AuthSession?> readSession() async {
    final accessToken = await _secureStorage.read(key: _accessTokenKey);
    if (accessToken == null || accessToken.isEmpty) {
      return null;
    }

    final expiresAtRaw = await _secureStorage.read(key: _expiresAtKey);
    final userId = await _secureStorage.read(key: _userIdKey) ?? '';
    final userEmail = await _secureStorage.read(key: _userEmailKey) ?? '';
    final emailVerifiedRaw =
        await _secureStorage.read(key: _userEmailVerifiedKey);
    final adminRaw = await _secureStorage.read(key: _userAdminKey);

    return AuthSession(
      accessToken: accessToken,
      expiresAt: expiresAtRaw == null ? null : DateTime.tryParse(expiresAtRaw),
      user: AuthUser(
        id: userId,
        email: userEmail,
        emailVerified: emailVerifiedRaw == 'true',
        admin: adminRaw == 'true',
      ),
    );
  }

  Future<void> clearSession() async {
    await _secureStorage.deleteAll();
  }
}

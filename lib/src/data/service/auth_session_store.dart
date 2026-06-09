import 'package:eeagle_ai/src/domain/model/auth_session.dart';

class AuthSessionStore {
  AuthSession? _session;

  AuthSession? get session => _session;

  String? get accessToken => _session?.accessToken;

  void setSession(AuthSession session) {
    _session = session;
  }

  void clear() {
    _session = null;
  }
}

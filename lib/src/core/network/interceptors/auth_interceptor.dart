import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/data/service/auth_session_store.dart';
import 'package:eeagle_ai/src/data/service/token_storage_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._sessionStore, this._tokenStorage);

  final AuthSessionStore _sessionStore;
  final TokenStorageService _tokenStorage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!_isMobileLoginRequest(options)) {
      final accessToken = _sessionStore.accessToken;
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isMobileLoginRequest(err.requestOptions)) {
      _sessionStore.clear();
      await _tokenStorage.clearSession();
    }

    handler.next(err);
  }

  bool _isMobileLoginRequest(RequestOptions options) {
    return options.method.toUpperCase() == 'POST' &&
        options.path.endsWith(ApiConfig.mobileAuthLoginPath);
  }
}

import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/core/network/interceptors/auth_interceptor.dart';
import 'package:eeagle_ai/src/core/network/interceptors/logging_interceptor.dart';
import 'package:eeagle_ai/src/data/service/auth_session_store.dart';
import 'package:eeagle_ai/src/data/service/token_storage_service.dart';

class DioClient {
  DioClient._();

  static Dio create({
    required AuthSessionStore sessionStore,
    required TokenStorageService tokenStorage,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(AuthInterceptor(sessionStore, tokenStorage));
    dio.interceptors.add(LoggingInterceptor());
    return dio;
  }
}

import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    appLogger.d('→ ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    appLogger.d(
      '← ${response.statusCode} ${response.requestOptions.uri} '
      'response: ${response.data}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    appLogger.w(
      '✗ ${err.requestOptions.method} ${err.requestOptions.uri} '
      'status=${err.response?.statusCode} response: ${err.response?.data}',
      error: err,
    );
    handler.next(err);
  }
}

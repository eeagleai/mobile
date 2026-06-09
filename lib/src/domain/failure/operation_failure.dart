import 'package:dio/dio.dart';

/// Generic repository / use-case failure (non-auth flows).
class OperationFailure {
  const OperationFailure(this.message, {this.code});

  final String message;
  final String? code;

  factory OperationFailure.fromDio(DioException exception) {
    final statusCode = exception.response?.statusCode;
    final responseMessage = exception.response?.data;

    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.receiveTimeout ||
        exception.type == DioExceptionType.sendTimeout) {
      return const OperationFailure(
        'Request timed out. Please try again.',
        code: 'timeout',
      );
    }

    if (exception.type == DioExceptionType.connectionError) {
      return const OperationFailure(
        'Unable to connect. Check your network and try again.',
        code: 'connection-error',
      );
    }

    if (statusCode == 423) {
      return OperationFailure(
        _extractLockedMessage(responseMessage) ??
            'Your account is locked. Please upgrade to continue.',
        code: 'account_locked',
      );
    }

    if (statusCode != null) {
      final detail = _extractMessage(responseMessage);
      return OperationFailure(
        detail ?? 'Request failed with status $statusCode.',
        code: 'http-$statusCode',
      );
    }

    return OperationFailure(
      exception.message ?? 'An unexpected network error occurred.',
      code: 'network-error',
    );
  }

  static String? _extractLockedMessage(Object? data) {
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
    }

    return null;
  }

  static String? _extractMessage(Object? data) {
    if (data is Map<String, dynamic>) {
      final errors = data['errors'];
      if (errors is List && errors.isNotEmpty) {
        final firstError = errors.first;
        if (firstError is String && firstError.isNotEmpty) {
          return firstError;
        }
      }

      final message = data['message'] ?? data['error'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
    }
    if (data is String && data.isNotEmpty) {
      return data;
    }
    return null;
  }

  @override
  String toString() => message;
}

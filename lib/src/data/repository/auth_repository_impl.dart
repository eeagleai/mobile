import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/models/mobile_login_request_model.dart';
import 'package:eeagle_ai/src/data/models/mobile_login_response_model.dart';
import 'package:eeagle_ai/src/data/service/auth_session_store.dart';
import 'package:eeagle_ai/src/data/service/token_storage_service.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/auth_session.dart';
import 'package:eeagle_ai/src/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._dio,
    this._tokenStorage,
    this._sessionStore,
  );

  final Dio _dio;
  final TokenStorageService _tokenStorage;
  final AuthSessionStore _sessionStore;

  @override
  TaskEither<OperationFailure, AuthSession> login({
    required String email,
    required String password,
  }) {
    return TaskEither(() async {
      try {
        final response = await _dio.post<Map<String, dynamic>>(
          ApiConfig.mobileAuthLoginPath,
          data: MobileLoginRequestModel(
            email: email.trim(),
            password: password,
          ).toJson(),
        );

        final data = response.data;
        if (data == null) {
          return left(
            const OperationFailure(
              'Login failed. Empty response from server.',
              code: 'empty-response',
            ),
          );
        }

        final loginResponse = MobileLoginResponseModel.fromJson(data);
        if (loginResponse.status != null &&
            loginResponse.status != 'ok' &&
            (loginResponse.accessToken == null ||
                loginResponse.accessToken!.isEmpty)) {
          return left(
            OperationFailure(
              loginResponse.message ?? 'Login failed. Please try again.',
              code: 'login-rejected',
            ),
          );
        }

        late final AuthSession session;
        try {
          session = loginResponse.toEntity();
        } on FormatException catch (error) {
          return left(
            OperationFailure(
              loginResponse.message ?? error.message,
              code: 'missing-token',
            ),
          );
        }

        if (session.accessToken.isEmpty) {
          return left(
            const OperationFailure(
              'Login failed. Missing access token.',
              code: 'missing-token',
            ),
          );
        }

        await _persistSession(session);
        return right(session);
      } on DioException catch (error, stackTrace) {
        appLogger.w('login failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure.fromDio(error));
      } catch (error, stackTrace) {
        appLogger.w('login failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString()));
      }
    });
  }

  @override
  TaskEither<OperationFailure, AuthSession> restoreSession() {
    return TaskEither(() async {
      try {
        final storedSession = await _tokenStorage.readSession();
        if (storedSession == null) {
          return left(
            const OperationFailure(
              'No saved session.',
              code: 'no-session',
            ),
          );
        }

        if (storedSession.isExpired) {
          await _clearSession();
          return left(
            const OperationFailure(
              'Session expired. Please sign in again.',
              code: 'session-expired',
            ),
          );
        }

        _sessionStore.setSession(storedSession);
        return right(storedSession);
      } catch (error, stackTrace) {
        appLogger.w('restoreSession failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString()));
      }
    });
  }

  @override
  TaskEither<OperationFailure, Unit> logout() {
    return TaskEither(() async {
      try {
        await _clearSession();
        return right(unit);
      } catch (error, stackTrace) {
        appLogger.w('logout failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString()));
      }
    });
  }

  Future<void> _persistSession(AuthSession session) async {
    _sessionStore.setSession(session);
    await _tokenStorage.saveSession(session);
  }

  Future<void> _clearSession() async {
    _sessionStore.clear();
    await _tokenStorage.clearSession();
  }
}

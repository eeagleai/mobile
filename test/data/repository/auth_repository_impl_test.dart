import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/data/repository/auth_repository_impl.dart';
import 'package:eeagle_ai/src/data/service/auth_session_store.dart';
import 'package:eeagle_ai/src/data/service/token_storage_service.dart';
import 'package:eeagle_ai/src/domain/model/auth_session.dart';
import 'package:eeagle_ai/src/domain/model/auth_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

class _MockTokenStorageService extends Mock implements TokenStorageService {}

void main() {
  late _MockDio dio;
  late _MockTokenStorageService tokenStorage;
  late AuthSessionStore sessionStore;
  late AuthRepositoryImpl repository;

  setUp(() {
    dio = _MockDio();
    tokenStorage = _MockTokenStorageService();
    sessionStore = AuthSessionStore();
    repository = AuthRepositoryImpl(dio, tokenStorage, sessionStore);

    registerFallbackValue(
      const AuthSession(
        accessToken: 'fallback',
        user: AuthUser(
          id: 'id',
          email: 'email',
          emailVerified: false,
          admin: false,
        ),
      ),
    );
    registerFallbackValue(Options());

    when(() => tokenStorage.saveSession(any())).thenAnswer((_) async {});
    when(() => tokenStorage.clearSession()).thenAnswer((_) async {});
  });

  group('login', () {
    test('maps success response and persists session', () async {
      when(
        () => dio.post<Map<String, dynamic>>(
          ApiConfig.mobileAuthLoginPath,
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          data: {
            'status': 'ok',
            'access_token': 'jwt-token',
            'token_type': 'Bearer',
            'expires_in': 2592000,
            'access_token_expires_at': '2026-07-07T10:15:00+00:00',
            'user': {
              'id': 'user-1',
              'email': 'owner@example.com',
              'email_verified': true,
              'admin': false,
            },
          },
          requestOptions: RequestOptions(path: ApiConfig.mobileAuthLoginPath),
        ),
      );

      final result = await repository
          .login(email: 'owner@example.com', password: 'password')
          .run();

      expect(result.isRight(), isTrue);
      result.match((_) => fail('expected success'), (session) {
        expect(session.accessToken, 'jwt-token');
        expect(session.user.email, 'owner@example.com');
      });
      expect(sessionStore.accessToken, 'jwt-token');
      verify(() => tokenStorage.saveSession(any())).called(1);
    });

    test('maps 422 validation errors', () async {
      when(
        () => dio.post<Map<String, dynamic>>(
          ApiConfig.mobileAuthLoginPath,
          data: any(named: 'data'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ApiConfig.mobileAuthLoginPath),
          response: Response<Map<String, dynamic>>(
            statusCode: 422,
            data: {
              'errors': ['Invalid email or password.'],
            },
            requestOptions: RequestOptions(path: ApiConfig.mobileAuthLoginPath),
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      final result = await repository
          .login(email: 'owner@example.com', password: 'wrong')
          .run();

      expect(result.isLeft(), isTrue);
      result.match((failure) {
        expect(failure.message, 'Invalid email or password.');
        expect(failure.code, 'http-422');
      }, (_) => fail('expected failure'));
    });

    test('returns clear failure when access token is missing', () async {
      when(
        () => dio.post<Map<String, dynamic>>(
          ApiConfig.mobileAuthLoginPath,
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          data: {
            'status': 'ok',
            'message': 'Email verification required.',
            'access_token': null,
          },
          requestOptions: RequestOptions(path: ApiConfig.mobileAuthLoginPath),
        ),
      );

      final result = await repository
          .login(email: 'owner@example.com', password: 'password')
          .run();

      expect(result.isLeft(), isTrue);
      result.match((failure) {
        expect(failure.message, 'Email verification required.');
        expect(failure.code, 'missing-token');
      }, (_) => fail('expected failure'));
    });

    test('maps 423 locked account', () async {
      when(
        () => dio.post<Map<String, dynamic>>(
          ApiConfig.mobileAuthLoginPath,
          data: any(named: 'data'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ApiConfig.mobileAuthLoginPath),
          response: Response<Map<String, dynamic>>(
            statusCode: 423,
            data: {
              'status': 'locked',
              'error': 'account_locked',
              'message': 'Account locked.',
            },
            requestOptions: RequestOptions(path: ApiConfig.mobileAuthLoginPath),
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      final result = await repository
          .login(email: 'owner@example.com', password: 'password')
          .run();

      expect(result.isLeft(), isTrue);
      result.match((failure) {
        expect(failure.message, 'Account locked.');
        expect(failure.code, 'account_locked');
      }, (_) => fail('expected failure'));
    });
  });

  group('signup', () {
    test('bootstraps csrf token and creates account', () async {
      when(
        () => dio.get<Map<String, dynamic>>(
          ApiConfig.authSessionPath,
          options: any(named: 'options'),
        ),
      ).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          data: {'csrf_token': 'csrf-token'},
          headers: Headers.fromMap({
            'set-cookie': ['eeagle.session=session-token; Path=/; HttpOnly'],
          }),
          requestOptions: RequestOptions(path: ApiConfig.authSessionPath),
        ),
      );
      when(
        () => dio.post<Map<String, dynamic>>(
          ApiConfig.authSignupPath,
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          data: {
            'status': 'ok',
            'message': 'Account created. Check your email.',
            'user': {
              'id': 'user-1',
              'email': 'owner@example.com',
              'email_verified': false,
              'admin': false,
            },
            'csrf_token': 'next-csrf-token',
          },
          requestOptions: RequestOptions(path: ApiConfig.authSignupPath),
        ),
      );

      final result = await repository
          .signup(
            email: ' owner@example.com ',
            password: 'password123',
            passwordConfirmation: 'password123',
            agree: true,
          )
          .run();

      expect(result.isRight(), isTrue);
      result.match((_) => fail('expected success'), (signupResult) {
        expect(signupResult.message, 'Account created. Check your email.');
        expect(signupResult.user?.email, 'owner@example.com');
      });

      final capturedData = verify(
        () => dio.post<Map<String, dynamic>>(
          ApiConfig.authSignupPath,
          data: captureAny(named: 'data'),
          options: captureAny(named: 'options'),
        ),
      ).captured;
      final body = capturedData.first as Map<String, dynamic>;
      final options = capturedData.last as Options;

      expect(body['email'], 'owner@example.com');
      expect(body['password'], 'password123');
      expect(body['password_confirmation'], 'password123');
      expect(body['agree'], isTrue);
      expect(options.headers?['X-CSRFToken'], 'csrf-token');
      expect(options.headers?['Cookie'], 'eeagle.session=session-token');
      expect((options.extra ?? const {})['skipAuth'], isTrue);
    });

    test('returns clear failure when csrf token is missing', () async {
      when(
        () => dio.get<Map<String, dynamic>>(
          ApiConfig.authSessionPath,
          options: any(named: 'options'),
        ),
      ).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          data: const {},
          requestOptions: RequestOptions(path: ApiConfig.authSessionPath),
        ),
      );

      final result = await repository
          .signup(
            email: 'owner@example.com',
            password: 'password123',
            passwordConfirmation: 'password123',
            agree: true,
          )
          .run();

      expect(result.isLeft(), isTrue);
      result.match((failure) {
        expect(failure.message, 'Signup failed. Missing CSRF token.');
        expect(failure.code, 'missing-csrf-token');
      }, (_) => fail('expected failure'));
      verifyNever(
        () => dio.post<Map<String, dynamic>>(
          ApiConfig.authSignupPath,
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      );
    });

    test('maps signup validation errors', () async {
      when(
        () => dio.get<Map<String, dynamic>>(
          ApiConfig.authSessionPath,
          options: any(named: 'options'),
        ),
      ).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          data: {'csrf_token': 'csrf-token'},
          requestOptions: RequestOptions(path: ApiConfig.authSessionPath),
        ),
      );
      when(
        () => dio.post<Map<String, dynamic>>(
          ApiConfig.authSignupPath,
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          statusCode: 422,
          data: {
            'errors': {
              'email': ['Email is already registered.'],
            },
          },
          requestOptions: RequestOptions(path: ApiConfig.authSignupPath),
        ),
      );

      final result = await repository
          .signup(
            email: 'owner@example.com',
            password: 'password123',
            passwordConfirmation: 'password123',
            agree: true,
          )
          .run();

      expect(result.isLeft(), isTrue);
      result.match((failure) {
        expect(failure.message, 'Email is already registered.');
        expect(failure.code, 'http-422');
      }, (_) => fail('expected failure'));
    });
  });

  group('restoreSession', () {
    test('returns stored session when not expired', () async {
      final session = AuthSession(
        accessToken: 'jwt-token',
        expiresAt: DateTime.now().add(const Duration(days: 1)),
        user: const AuthUser(
          id: 'user-1',
          email: 'owner@example.com',
          emailVerified: true,
          admin: false,
        ),
      );

      when(() => tokenStorage.readSession()).thenAnswer((_) async => session);

      final result = await repository.restoreSession().run();

      expect(result.isRight(), isTrue);
      expect(sessionStore.accessToken, 'jwt-token');
    });

    test('clears expired session', () async {
      final session = AuthSession(
        accessToken: 'jwt-token',
        expiresAt: DateTime.now().subtract(const Duration(minutes: 1)),
        user: const AuthUser(
          id: 'user-1',
          email: 'owner@example.com',
          emailVerified: true,
          admin: false,
        ),
      );

      when(() => tokenStorage.readSession()).thenAnswer((_) async => session);

      final result = await repository.restoreSession().run();

      expect(result.isLeft(), isTrue);
      verify(() => tokenStorage.clearSession()).called(1);
      expect(sessionStore.accessToken, isNull);
    });
  });

  group('logout', () {
    test('clears in-memory session and secure storage', () async {
      sessionStore.setSession(
        const AuthSession(
          accessToken: 'jwt-token',
          user: AuthUser(
            id: 'user-1',
            email: 'owner@example.com',
            emailVerified: true,
            admin: false,
          ),
        ),
      );

      final result = await repository.logout().run();

      expect(result.isRight(), isTrue);
      verify(() => tokenStorage.clearSession()).called(1);
      expect(sessionStore.accessToken, isNull);
    });
  });
}

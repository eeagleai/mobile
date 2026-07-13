import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/models/sites_response_model.dart';
import 'package:eeagle_ai/src/data/service/auth_session_store.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/repository/sites_repository.dart';
import 'package:fpdart/fpdart.dart';

class SitesRepositoryImpl implements SitesRepository {
  SitesRepositoryImpl(this._dio, [AuthSessionStore? sessionStore])
    : _sessionStore = sessionStore ?? AuthSessionStore();

  final Dio _dio;
  final AuthSessionStore _sessionStore;

  @override
  TaskEither<OperationFailure, List<Site>> getSites() {
    return TaskEither(() async {
      try {
        final response = await _dio.get<Map<String, dynamic>>(
          ApiConfig.sitesPath,
        );

        final data = response.data;
        if (data == null) {
          return left(
            const OperationFailure(
              'Failed to load websites. Empty response from server.',
              code: 'empty-response',
            ),
          );
        }

        return right(SitesResponseModel.fromJson(data).toEntities());
      } on DioException catch (error, stackTrace) {
        appLogger.w('getSites failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure.fromDio(error));
      } catch (error, stackTrace) {
        appLogger.w('getSites failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString()));
      }
    });
  }

  @override
  TaskEither<OperationFailure, WebsiteBuildStatus> createWebsite(
    String prompt,
  ) {
    return TaskEither(() async {
      final email = _sessionStore.session?.user.email;
      if (email == null || email.isEmpty) {
        return left(const OperationFailure('Please sign in again.'));
      }
      try {
        final response = await _dio.post<Map<String, dynamic>>(
          ApiConfig.earlyAccessPath,
          data: {'email': email, 'activation_note': prompt.trim()},
          options: Options(extra: const {'skipAuth': true}),
        );
        return right(_buildStatus(response.data ?? const {}));
      } on DioException catch (error, stackTrace) {
        appLogger.w(
          'createWebsite failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure.fromDio(error));
      } catch (error, stackTrace) {
        appLogger.w(
          'createWebsite failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure(error.toString()));
      }
    });
  }

  @override
  TaskEither<OperationFailure, WebsiteBuildStatus> getWebsiteBuildStatus(
    WebsiteBuildStatus build,
  ) {
    return TaskEither(() async {
      final path =
          build.statusUrl ??
          (build.requestDbId == null
              ? null
              : '/api/early-access/${build.requestDbId}/status');
      if (path == null || path.isEmpty) {
        return left(
          const OperationFailure('Missing website build status URL.'),
        );
      }
      try {
        final response = await _dio.get<Map<String, dynamic>>(
          path,
          options: Options(extra: const {'skipAuth': true}),
        );
        final next = _buildStatus(response.data ?? const {});
        return right(
          WebsiteBuildStatus(
            status: next.status,
            message: next.message,
            complete: next.complete,
            requestDbId: next.requestDbId ?? build.requestDbId,
            statusUrl: next.statusUrl ?? build.statusUrl,
            siteUrl: next.siteUrl ?? build.siteUrl,
          ),
        );
      } on DioException catch (error, stackTrace) {
        appLogger.w(
          'getWebsiteBuildStatus failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure.fromDio(error));
      } catch (error, stackTrace) {
        appLogger.w(
          'getWebsiteBuildStatus failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure(error.toString()));
      }
    });
  }

  WebsiteBuildStatus _buildStatus(Map<String, dynamic> data) {
    final status =
        (data['provisioning_status'] ?? data['status'] ?? 'provisioning')
            .toString();
    final complete =
        data['complete'] == true ||
        const {'completed', 'approved'}.contains(status.toLowerCase());
    return WebsiteBuildStatus(
      status: status,
      message: (data['message'] ?? 'Your website is being built.').toString(),
      complete: complete,
      requestDbId: (data['request_db_id'] ?? data['request_id'])?.toString(),
      statusUrl: data['status_url']?.toString(),
      siteUrl: data['site_url']?.toString(),
    );
  }
}

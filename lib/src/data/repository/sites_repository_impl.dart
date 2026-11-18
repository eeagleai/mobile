import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/models/sites_response_model.dart';
import 'package:eeagle_ai/src/data/models/site_revisions_response_model.dart';
import 'package:eeagle_ai/src/data/models/site_rollback_response_model.dart';
import 'package:eeagle_ai/src/data/service/auth_session_store.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/model/site_revision.dart';
import 'package:eeagle_ai/src/domain/model/site_rollback_result.dart';
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

  @override
  TaskEither<OperationFailure, List<SiteRevision>> getSiteRevisions(
    String siteApiKey,
  ) {
    return TaskEither(() async {
      final path = ApiConfig.siteRevisionsPath(siteApiKey);
      try {
        final response = await _dio.get<Map<String, dynamic>>(path);
        final data = response.data;
        if (data == null) {
          return left(
            const OperationFailure(
              'Failed to load version history. Empty response from server.',
              code: 'empty-response',
            ),
          );
        }
        return right(SiteRevisionsResponseModel.fromJson(data).toEntities());
      } on DioException catch (error, stackTrace) {
        appLogger.w(
          'getSiteRevisions failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure.fromDio(error));
      } catch (error, stackTrace) {
        appLogger.w(
          'getSiteRevisions failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure(error.toString()));
      }
    });
  }

  @override
  TaskEither<OperationFailure, SiteRollbackResult> rollbackSiteRevision({
    required String siteApiKey,
    required String revisionIdOrSha,
  }) {
    return TaskEither(() async {
      final path = ApiConfig.siteRollbackPath(siteApiKey, revisionIdOrSha);
      try {
        final response = await _dio.post<Map<String, dynamic>>(path);
        final data = response.data;
        if (data == null) {
          return left(
            const OperationFailure(
              'The website was restored, but the server returned no details.',
              code: 'empty-response',
            ),
          );
        }
        return right(SiteRollbackResponseModel.fromJson(data).toEntity());
      } on DioException catch (error, stackTrace) {
        appLogger.w(
          'rollbackSiteRevision failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(_rollbackFailure(error));
      } catch (error, stackTrace) {
        appLogger.w(
          'rollbackSiteRevision failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure(error.toString()));
      }
    });
  }

  OperationFailure _rollbackFailure(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;
    final errorCode = data is Map<String, dynamic>
        ? data['error']?.toString()
        : null;

    return switch (statusCode) {
      402 => const OperationFailure(
        'You do not have enough change credits to restore this version.',
        code: 'rollback-quota-exceeded',
      ),
      403 when errorCode == 'email_not_verified' => const OperationFailure(
        'Verify your email before restoring a website version.',
        code: 'email-not-verified',
      ),
      403 => const OperationFailure(
        'You do not have permission to restore this website version.',
        code: 'forbidden',
      ),
      404 => const OperationFailure(
        'This website version is no longer available.',
        code: 'revision-not-found',
      ),
      422 => const OperationFailure(
        'This website version cannot be restored safely.',
        code: 'rollback-unavailable',
      ),
      423 => OperationFailure.fromDio(error),
      _ => OperationFailure.fromDio(error),
    };
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

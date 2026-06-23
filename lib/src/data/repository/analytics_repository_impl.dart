import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/service/analytics_api_service.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stats.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stream_info.dart';
import 'package:eeagle_ai/src/domain/repository/analytics_repository.dart';
import 'package:fpdart/fpdart.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  AnalyticsRepositoryImpl(this._apiService);

  final AnalyticsApiService _apiService;

  @override
  TaskEither<OperationFailure, AnalyticsStats> getStats(String apikey) {
    return _guard(
      () async => (await _apiService.fetchStats(apikey)).toEntity(),
      'getStats',
    );
  }

  @override
  TaskEither<OperationFailure, List<AnalyticsEvent>> getEvents(
    String apikey, {
    int limit = 100,
  }) {
    return _guard(
      () async =>
          (await _apiService.fetchEvents(apikey, limit: limit)).toEntities(),
      'getEvents',
    );
  }

  @override
  TaskEither<OperationFailure, AnalyticsStreamInfo> getStreamToken(
    String apikey,
  ) {
    return _guard(
      () async => (await _apiService.fetchStreamToken(apikey)).toEntity(),
      'getStreamToken',
    );
  }

  /// Runs [action] and maps any failure into an [OperationFailure], mirroring
  /// the pattern in `SitesRepositoryImpl`.
  TaskEither<OperationFailure, T> _guard<T>(
    Future<T> Function() action,
    String label,
  ) {
    return TaskEither(() async {
      try {
        return right(await action());
      } on DioException catch (error, stackTrace) {
        appLogger.w('$label failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure.fromDio(error));
      } catch (error, stackTrace) {
        appLogger.w('$label failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString()));
      }
    });
  }
}

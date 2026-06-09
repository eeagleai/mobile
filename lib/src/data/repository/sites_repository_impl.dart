import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/models/sites_response_model.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/repository/sites_repository.dart';
import 'package:fpdart/fpdart.dart';

class SitesRepositoryImpl implements SitesRepository {
  SitesRepositoryImpl(this._dio);

  final Dio _dio;

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
}

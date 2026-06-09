import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/repository/counter_repository.dart';
import 'package:fpdart/fpdart.dart';

class CounterRepositoryImpl implements CounterRepository {
  CounterRepositoryImpl(this._dio) {
    appLogger.d(
      'CounterRepository initialized (api: ${_dio.options.baseUrl})',
    );
  }

  final Dio _dio;
  int _count = 0;

  @override
  TaskEither<OperationFailure, int> getCount() {
    return TaskEither(() async {
      try {
        return right(_count);
      } catch (error, stackTrace) {
        appLogger.w('getCount failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString()));
      }
    });
  }

  @override
  TaskEither<OperationFailure, int> increment() {
    return TaskEither(() async {
      try {
        _count++;
        return right(_count);
      } on DioException catch (error, stackTrace) {
        appLogger.w('increment failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure.fromDio(error));
      } catch (error, stackTrace) {
        appLogger.w('increment failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString()));
      }
    });
  }
}

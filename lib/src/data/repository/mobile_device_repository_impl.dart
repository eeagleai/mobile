import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/models/mobile_device_fcm_token_request_model.dart';
import 'package:eeagle_ai/src/data/service/mobile_device_api_service.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/mobile_device_fcm_token.dart';
import 'package:eeagle_ai/src/domain/repository/mobile_device_repository.dart';
import 'package:fpdart/fpdart.dart';

class MobileDeviceRepositoryImpl implements MobileDeviceRepository {
  MobileDeviceRepositoryImpl(this._apiService);

  final MobileDeviceApiService _apiService;

  @override
  TaskEither<OperationFailure, Unit> saveFcmToken(MobileDeviceFcmToken token) {
    return TaskEither(() async {
      try {
        await _apiService.saveFcmToken(
          MobileDeviceFcmTokenRequestModel.fromEntity(token),
        );
        return right(unit);
      } on DioException catch (error, stackTrace) {
        appLogger.w(
          'saveFcmToken failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure.fromDio(error));
      } catch (error, stackTrace) {
        appLogger.w(
          'saveFcmToken failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure(error.toString()));
      }
    });
  }
}

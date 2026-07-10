import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/mobile_device_fcm_token.dart';
import 'package:eeagle_ai/src/domain/repository/mobile_device_repository.dart';
import 'package:fpdart/fpdart.dart';

class SaveFcmTokenUseCase {
  SaveFcmTokenUseCase(this._repository);

  final MobileDeviceRepository _repository;

  TaskEither<OperationFailure, Unit> call(MobileDeviceFcmToken token) {
    return _repository.saveFcmToken(token);
  }
}

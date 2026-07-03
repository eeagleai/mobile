import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/mobile_device_fcm_token.dart';
import 'package:fpdart/fpdart.dart';

abstract class MobileDeviceRepository {
  TaskEither<OperationFailure, Unit> saveFcmToken(MobileDeviceFcmToken token);
}

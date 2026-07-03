import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/data/models/mobile_device_fcm_token_request_model.dart';

class MobileDeviceApiService {
  MobileDeviceApiService(this._dio);

  final Dio _dio;

  Future<void> saveFcmToken(MobileDeviceFcmTokenRequestModel request) async {
    await _dio.post<Map<String, dynamic>>(
      ApiConfig.mobileFcmTokenPath,
      data: request.toJson(),
    );
  }
}

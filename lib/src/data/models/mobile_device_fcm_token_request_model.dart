import 'package:eeagle_ai/src/domain/model/mobile_device_fcm_token.dart';

class MobileDeviceFcmTokenRequestModel {
  const MobileDeviceFcmTokenRequestModel({
    required this.deviceId,
    required this.fcmToken,
    required this.platform,
    required this.appVersion,
    this.osVersion,
    this.deviceModel,
  });

  factory MobileDeviceFcmTokenRequestModel.fromEntity(
    MobileDeviceFcmToken token,
  ) {
    return MobileDeviceFcmTokenRequestModel(
      deviceId: token.deviceId,
      fcmToken: token.fcmToken,
      platform: token.platform,
      appVersion: token.appVersion,
      osVersion: token.osVersion,
      deviceModel: token.deviceModel,
    );
  }

  final String deviceId;
  final String fcmToken;
  final String platform;
  final String appVersion;
  final String? osVersion;
  final String? deviceModel;

  Map<String, dynamic> toJson() {
    return {
      'device_id': deviceId,
      'fcm_token': fcmToken,
      'platform': platform,
      'app_version': appVersion,
      if (osVersion != null && osVersion!.isNotEmpty) 'os_version': osVersion,
      if (deviceModel != null && deviceModel!.isNotEmpty)
        'device_model': deviceModel,
    };
  }
}

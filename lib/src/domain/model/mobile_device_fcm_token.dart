class MobileDeviceFcmToken {
  const MobileDeviceFcmToken({
    required this.deviceId,
    required this.fcmToken,
    required this.platform,
    required this.appVersion,
    this.osVersion,
    this.deviceModel,
  });

  final String deviceId;
  final String fcmToken;
  final String platform;
  final String appVersion;
  final String? osVersion;
  final String? deviceModel;
}

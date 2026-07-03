import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/service/device_installation_service.dart';
import 'package:eeagle_ai/src/domain/model/mobile_device_fcm_token.dart';
import 'package:eeagle_ai/src/domain/use_case/save_fcm_token_use_case.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp();
  } catch (_) {
    // Native Firebase config may not exist in local/dev builds.
  }
}

class FirebaseMessagingService {
  FirebaseMessagingService(
    this._saveFcmTokenUseCase,
    this._installationService,
  );

  final SaveFcmTokenUseCase _saveFcmTokenUseCase;
  final DeviceInstallationService _installationService;
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  bool _initialized = false;
  StreamSubscription<String>? _tokenRefreshSub;

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    try {
      await Firebase.initializeApp();
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
            alert: true,
            badge: true,
            sound: true,
          );
      _initialized = true;
    } catch (error, stackTrace) {
      appLogger.w(
        'firebase messaging init skipped',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> syncCurrentToken() async {
    await initialize();
    if (!_initialized) {
      return;
    }

    try {
      // if (await _shouldSkipApplePush()) {
      //   return;
      // }

      await FirebaseMessaging.instance.requestPermission();
      final token = await _resolveFcmToken();
      if (token == null || token.isEmpty) {
        return;
      }
      await _saveToken(token);
      _listenForTokenRefresh();
    } catch (error, stackTrace) {
      appLogger.w(
        'fcm token sync skipped',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// iOS Simulator does not provide a real APNS token; FCM cannot be resolved.
  // Future<bool> _shouldSkipApplePush() async {
  //   if (defaultTargetPlatform == TargetPlatform.iOS) {
  //     final iosInfo = await _deviceInfo.iosInfo;
  //     if (!iosInfo.isPhysicalDevice) {
  //       appLogger.d('fcm token sync skipped on iOS simulator');
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  Future<String?> _resolveFcmToken() async {
    if (_requiresApnsToken) {
      final apnsReady = await _waitForApnsToken();
      if (!apnsReady) {
        appLogger.d('fcm token sync skipped: APNS token unavailable');
        return null;
      }
    }
    return FirebaseMessaging.instance.getToken();
  }

  bool get _requiresApnsToken =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS;

  Future<bool> _waitForApnsToken() async {
    const maxAttempts = 15;
    for (var attempt = 0; attempt < maxAttempts; attempt++) {
      final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnsToken != null && apnsToken.isNotEmpty) {
        return true;
      }
      await Future<void>.delayed(Duration(milliseconds: 200 * (attempt + 1)));
    }
    return false;
  }

  void _listenForTokenRefresh() {
    _tokenRefreshSub ??= FirebaseMessaging.instance.onTokenRefresh.listen(
      (token) {
        unawaited(_saveToken(token));
      },
      onError: (Object error, StackTrace stackTrace) {
        appLogger.w(
          'fcm token refresh failed',
          error: error,
          stackTrace: stackTrace,
        );
      },
    );
  }

  Future<void> _saveToken(String fcmToken) async {
    final metadata = await _deviceMetadata();
    final token = MobileDeviceFcmToken(
      deviceId: await _installationService.getOrCreateDeviceId(),
      fcmToken: fcmToken,
      platform: metadata.platform,
      appVersion: metadata.appVersion,
      osVersion: metadata.osVersion,
      deviceModel: metadata.deviceModel,
    );

    final result = await _saveFcmTokenUseCase(token).run();
    result.match(
      (failure) => appLogger.w('fcm token save failed: ${failure.message}'),
      (_) => appLogger.d('fcm token saved'),
    );
  }

  Future<_DeviceMetadata> _deviceMetadata() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final appVersion = [
      packageInfo.version,
      if (packageInfo.buildNumber.isNotEmpty) packageInfo.buildNumber,
    ].join('+');

    if (kIsWeb) {
      return _DeviceMetadata(platform: 'web', appVersion: appVersion);
    }

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final info = await _deviceInfo.iosInfo;
      return _DeviceMetadata(
        platform: 'ios',
        appVersion: appVersion,
        osVersion: info.systemVersion,
        deviceModel: info.utsname.machine,
      );
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      final info = await _deviceInfo.androidInfo;
      return _DeviceMetadata(
        platform: 'android',
        appVersion: appVersion,
        osVersion: info.version.release,
        deviceModel: info.model,
      );
    }

    if (defaultTargetPlatform == TargetPlatform.macOS) {
      final info = await _deviceInfo.macOsInfo;
      return _DeviceMetadata(
        platform: 'macos',
        appVersion: appVersion,
        osVersion: info.osRelease,
        deviceModel: info.model,
      );
    }

    return _DeviceMetadata(
      platform: defaultTargetPlatform.name,
      appVersion: appVersion,
    );
  }

  Future<void> dispose() async {
    await _tokenRefreshSub?.cancel();
    _tokenRefreshSub = null;
  }
}

class _DeviceMetadata {
  const _DeviceMetadata({
    required this.platform,
    required this.appVersion,
    this.osVersion,
    this.deviceModel,
  });

  final String platform;
  final String appVersion;
  final String? osVersion;
  final String? deviceModel;
}

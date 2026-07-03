import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeviceInstallationService {
  DeviceInstallationService({FlutterSecureStorage? secureStorage})
    : _secureStorage =
          secureStorage ??
          const FlutterSecureStorage(
            aOptions: AndroidOptions(encryptedSharedPreferences: true),
            mOptions: MacOsOptions(),
          );

  static const _deviceIdKey = 'device_installation_id';

  final FlutterSecureStorage _secureStorage;

  Future<String> getOrCreateDeviceId() async {
    final existing = await _secureStorage.read(key: _deviceIdKey);
    if (existing != null && existing.isNotEmpty) {
      return existing;
    }

    final created = _createDeviceId();
    await _secureStorage.write(key: _deviceIdKey, value: created);
    return created;
  }

  String _createDeviceId() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }
}

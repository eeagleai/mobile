import 'dart:convert';

import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:flutter/foundation.dart';

const _redactedValue = '***';

final JsonEncoder _prettyJsonEncoder = const JsonEncoder.withIndent('  ');

bool isChatHeartbeatFrame(Object? type) {
  return type == 'ping' || type == 'pong';
}

void logInboundChatFrame(
  Map<String, dynamic> frame, {
  String? mappedEventType,
}) {
  if (!kDebugMode || isChatHeartbeatFrame(frame['type'])) {
    return;
  }

  final prettyFrame = _prettyJsonEncoder.convert(frame);
  appLogger.d('chat inbound frame:\n$prettyFrame');

  if (mappedEventType != null) {
    appLogger.d('chat inbound mapped: $mappedEventType');
  }
}

void logOutboundChatFrame(Map<String, dynamic> frame) {
  if (!kDebugMode || isChatHeartbeatFrame(frame['type'])) {
    return;
  }

  final redactedFrame = _redactSensitiveFields(frame);
  final prettyFrame = _prettyJsonEncoder.convert(redactedFrame);
  appLogger.d('chat outbound frame:\n$prettyFrame');
}

Map<String, dynamic> _redactSensitiveFields(Map<String, dynamic> frame) {
  final redacted = <String, dynamic>{};

  for (final entry in frame.entries) {
    redacted[entry.key] = _redactValue(entry.key, entry.value);
  }

  return redacted;
}

Object? _redactValue(String key, Object? value) {
  if (_isSensitiveKey(key)) {
    return _redactedValue;
  }

  if (value is Map<String, dynamic>) {
    return _redactSensitiveFields(value);
  }

  if (value is Map) {
    return value.map(
      (nestedKey, nestedValue) => MapEntry(
        nestedKey,
        nestedKey is String
            ? _redactValue(nestedKey, nestedValue)
            : nestedValue,
      ),
    );
  }

  if (value is List) {
    return value
        .map((item) => item is Map<String, dynamic>
            ? _redactSensitiveFields(item)
            : item)
        .toList();
  }

  return value;
}

bool _isSensitiveKey(String key) {
  final normalizedKey = key.toLowerCase();
  return normalizedKey == 'apikey' ||
      normalizedKey == 'token' ||
      normalizedKey.contains('token');
}

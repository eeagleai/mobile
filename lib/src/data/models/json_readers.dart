String? readNullableString(Object? value) {
  if (value is String && value.isNotEmpty) {
    return value;
  }

  return null;
}

String readStringOrEmpty(Object? value) {
  return readNullableString(value) ?? '';
}

Map<String, dynamic> normalizeMobileLoginJson(Map<String, dynamic> json) {
  final nested = json['data'];
  if (nested is Map<String, dynamic>) {
    return nested;
  }

  return json;
}

String normalizePageUrl(String host) {
  final trimmed = host.trim();
  if (trimmed.isEmpty) {
    return 'https://eeagle.ai/';
  }

  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    return trimmed.endsWith('/') ? trimmed : '$trimmed/';
  }

  return 'https://$trimmed/';
}

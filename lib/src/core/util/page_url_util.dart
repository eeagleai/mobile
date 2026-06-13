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

String resolveSitePageUrl(String host, String pageUrl) {
  final trimmedPageUrl = pageUrl.trim();
  if (trimmedPageUrl.isEmpty || trimmedPageUrl == '/') {
    return normalizePageUrl(host);
  }

  if (trimmedPageUrl.startsWith('http://') ||
      trimmedPageUrl.startsWith('https://')) {
    return trimmedPageUrl;
  }

  final baseUri = Uri.parse(normalizePageUrl(host));
  final path = trimmedPageUrl.startsWith('/')
      ? trimmedPageUrl
      : '/$trimmedPageUrl';

  return baseUri.resolve(path).toString();
}

String normalizeExternalUrl(String rawLink) {
  final trimmed = rawLink.trim().replaceAll(RegExp(r'[.,;:!?)]+$'), '');
  if (trimmed.isEmpty) {
    return trimmed;
  }

  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    return trimmed;
  }

  return 'https://$trimmed';
}

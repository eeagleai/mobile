import 'package:flutter/foundation.dart';

String previewSheetDisplayHost(String pageUrl) {
  final uri = Uri.tryParse(previewSheetDisplayUrl(pageUrl));
  if (uri == null || uri.host.isEmpty) {
    return pageUrl;
  }

  return uri.host;
}

String previewSheetDisplayTitle(String pageUrl) {
  final host = previewSheetDisplayHost(pageUrl).toLowerCase();
  if (host == 'eeagle.ai') {
    return 'www.eeagle.ai';
  }

  return previewSheetDisplayHost(pageUrl);
}

String previewSheetFormattedDisplayUrl(String pageUrl) {
  final normalizedUrl = previewSheetDisplayUrl(pageUrl);
  final uri = Uri.tryParse(normalizedUrl);
  if (uri == null) {
    return pageUrl;
  }

  final host = uri.host.toLowerCase() == 'eeagle.ai' ? 'www.eeagle.ai' : uri.host;
  final path = uri.path.isEmpty ? '/' : uri.path;
  final query = uri.hasQuery ? '?${uri.query}' : '';

  return '${uri.scheme}://$host$path$query';
}

String previewSheetDisplayUrl(String pageUrl) {
  final uri = Uri.tryParse(pageUrl);
  if (uri == null) {
    return pageUrl;
  }

  if (uri.hasScheme) {
    return pageUrl;
  }

  return 'https://$pageUrl';
}

bool previewSheetIsSecureUrl(String pageUrl) {
  final uri = Uri.tryParse(pageUrl);
  return uri?.scheme == 'https';
}

bool previewSheetIsEeagleHost(String host) {
  final normalizedHost = host.toLowerCase();
  return normalizedHost == 'eeagle.ai' ||
      normalizedHost.endsWith('.eeagle.ai');
}

String externalBrowserActionLabel() {
  return switch (defaultTargetPlatform) {
    TargetPlatform.iOS => 'Open in Safari',
    _ => 'Open in browser',
  };
}

String externalBrowserActionShortLabel() {
  return switch (defaultTargetPlatform) {
    TargetPlatform.iOS => 'Safari',
    _ => 'Browser',
  };
}

final RegExp _pagePathPattern = RegExp(
  r'/(?:[a-zA-Z0-9][\w-]*(?:/[a-zA-Z0-9][\w-]*)*)?',
);

final RegExp _externalUrlPattern = RegExp(
  r'https?://[^\s]+',
  caseSensitive: false,
);

final RegExp _externalDomainPattern = RegExp(
  r'(?<![@\w./])(?:www\.)?(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(?:/[^\s.,;:!?)]+)?',
);

final RegExp _trailingPunctuationPattern = RegExp(r'[.,;:!?)]+$');

final RegExp _domainBeforeSlashPattern = RegExp(r'[\w-]+\.[\w-]+$');

class _TextLinkMatch {
  const _TextLinkMatch({
    required this.start,
    required this.end,
    required this.text,
  });

  final int start;
  final int end;
  final String text;
}

List<String> extractExternalLinksFromText(String text) {
  return _findExternalLinkMatches(text)
      .map((match) => match.text)
      .toList(growable: false);
}

List<String> extractPagePathsFromText(String text) {
  final externalMatches = _findExternalLinkMatches(text);
  final matches = _pagePathPattern.allMatches(text);
  final dedupedPaths = <String>[];

  for (final match in matches) {
    final rawPath = match.group(0);
    if (rawPath == null || rawPath.isEmpty) {
      continue;
    }

    if (_overlapsAnyMatch(match.start, match.end, externalMatches)) {
      continue;
    }

    if (_isPathSuffixOfDomain(text, match.start)) {
      continue;
    }

    final normalizedPath = _normalizeExtractedLink(rawPath);
    if (normalizedPath.isEmpty || dedupedPaths.contains(normalizedPath)) {
      continue;
    }

    dedupedPaths.add(normalizedPath);
  }

  return dedupedPaths;
}

List<_TextLinkMatch> _findExternalLinkMatches(String text) {
  final matches = <_TextLinkMatch>[];

  for (final match in _externalUrlPattern.allMatches(text)) {
    final rawLink = match.group(0);
    if (rawLink == null || rawLink.isEmpty) {
      continue;
    }

    final normalizedLink = _normalizeExtractedLink(rawLink);
    if (normalizedLink.isEmpty) {
      continue;
    }

    matches.add(
      _TextLinkMatch(
        start: match.start,
        end: match.end,
        text: normalizedLink,
      ),
    );
  }

  for (final match in _externalDomainPattern.allMatches(text)) {
    if (_overlapsAnyMatch(match.start, match.end, matches)) {
      continue;
    }

    final rawLink = match.group(0);
    if (rawLink == null || rawLink.isEmpty) {
      continue;
    }

    final normalizedLink = _normalizeExtractedLink(rawLink);
    if (normalizedLink.isEmpty) {
      continue;
    }

    matches.add(
      _TextLinkMatch(
        start: match.start,
        end: match.end,
        text: normalizedLink,
      ),
    );
  }

  matches.sort((left, right) => left.start.compareTo(right.start));
  return matches;
}

bool _overlapsAnyMatch(int start, int end, List<_TextLinkMatch> matches) {
  for (final match in matches) {
    if (start < match.end && end > match.start) {
      return true;
    }
  }

  return false;
}

bool _isPathSuffixOfDomain(String text, int slashIndex) {
  if (slashIndex <= 0) {
    return false;
  }

  final prefix = text.substring(0, slashIndex);
  return _domainBeforeSlashPattern.hasMatch(prefix);
}

String _normalizeExtractedLink(String rawLink) {
  return rawLink.replaceAll(_trailingPunctuationPattern, '');
}

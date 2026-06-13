import 'package:eeagle_ai/src/core/util/page_path_util.dart';
import 'package:eeagle_ai/src/core/util/page_url_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('extractPagePathsFromText', () {
    test('extracts multiple paths from assistant text', () {
      expect(
        extractPagePathsFromText(
          'You have /flowers and /about pages on your site.',
        ),
        ['/flowers', '/about'],
      );
    });

    test('extracts root path', () {
      expect(
        extractPagePathsFromText('Your homepage is /.'),
        ['/'],
      );
    });

    test('trims trailing punctuation from paths', () {
      expect(
        extractPagePathsFromText('Visit /flowers, /about.'),
        ['/flowers', '/about'],
      );
    });

    test('dedupes repeated paths', () {
      expect(
        extractPagePathsFromText('/flowers is ready. Open /flowers again.'),
        ['/flowers'],
      );
    });

    test('returns empty list when no paths are present', () {
      expect(
        extractPagePathsFromText('No page paths here.'),
        isEmpty,
      );
    });

    test('does not extract path suffix from external domain links', () {
      expect(
        extractPagePathsFromText(
          'For more credits visit eeagle.ai/upgrade.',
        ),
        isEmpty,
      );
    });

    test('extracts site paths alongside external domain links', () {
      expect(
        extractPagePathsFromText(
          'Update /flowers or visit eeagle.ai/upgrade.',
        ),
        ['/flowers'],
      );
    });
  });

  group('extractExternalLinksFromText', () {
    test('extracts bare domain with path', () {
      expect(
        extractExternalLinksFromText(
          'For more credits visit eeagle.ai/upgrade.',
        ),
        ['eeagle.ai/upgrade'],
      );
    });

    test('extracts https urls', () {
      expect(
        extractExternalLinksFromText('Go to https://eeagle.ai/upgrade now.'),
        ['https://eeagle.ai/upgrade'],
      );
    });

    test('trims trailing punctuation from external links', () {
      expect(
        extractExternalLinksFromText('Visit eeagle.ai/upgrade.'),
        ['eeagle.ai/upgrade'],
      );
    });

    test('extracts both external and leaves site paths separate', () {
      expect(
        extractExternalLinksFromText(
          'Update /flowers or visit eeagle.ai/upgrade.',
        ),
        ['eeagle.ai/upgrade'],
      );
    });

    test('returns empty list when no external links are present', () {
      expect(
        extractExternalLinksFromText('You have /flowers and /about pages.'),
        isEmpty,
      );
    });
  });

  group('normalizeExternalUrl', () {
    test('prepends https for bare domain links', () {
      expect(
        normalizeExternalUrl('eeagle.ai/upgrade'),
        'https://eeagle.ai/upgrade',
      );
    });

    test('preserves existing https scheme', () {
      expect(
        normalizeExternalUrl('https://eeagle.ai/upgrade'),
        'https://eeagle.ai/upgrade',
      );
    });
  });
}

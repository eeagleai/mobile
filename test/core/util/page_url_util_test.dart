import 'package:eeagle_ai/src/core/util/page_url_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('resolveSitePageUrl', () {
    const host = 'wedding.eeagle.ai';

    test('resolves root path to site homepage', () {
      expect(resolveSitePageUrl(host, '/'), 'https://wedding.eeagle.ai/');
    });

    test('resolves relative path to site page', () {
      expect(
        resolveSitePageUrl(host, '/flowers'),
        'https://wedding.eeagle.ai/flowers',
      );
    });

    test('keeps absolute urls unchanged', () {
      expect(
        resolveSitePageUrl(
          host,
          'https://wedding.eeagle.ai/about',
        ),
        'https://wedding.eeagle.ai/about',
      );
    });
  });
}

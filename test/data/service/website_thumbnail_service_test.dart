import 'package:eeagle_ai/src/data/service/website_thumbnail_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('builds a cached thumbnail URL for a bare host', () {
    final result = WebsiteThumbnailService.thumbnailUrl('demo.eeagle.ai');

    expect(
      result,
      'https://image.thum.io/get/'
      'width/240/crop/720/noanimate/maxAge/24/'
      'https://demo.eeagle.ai',
    );
  });

  test('keeps an existing HTTPS scheme', () {
    final result = WebsiteThumbnailService.thumbnailUrl(
      'https://demo.eeagle.ai',
    );

    expect(result, endsWith('https://demo.eeagle.ai'));
  });
}

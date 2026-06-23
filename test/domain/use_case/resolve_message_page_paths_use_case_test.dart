import 'package:eeagle_ai/src/domain/use_case/resolve_message_page_paths_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final useCase = ResolveMessagePagePathsUseCase();

  test('resolves extracted paths against the current site host', () {
    final links = useCase(
      siteHost: 'wedding.eeagle.ai',
      messageContent: 'Pages: /flowers and /about',
    );

    expect(links, hasLength(2));
    expect(links[0].path, '/flowers');
    expect(links[0].url, 'https://wedding.eeagle.ai/flowers');
    expect(links[1].path, '/about');
    expect(links[1].url, 'https://wedding.eeagle.ai/about');
  });

  test('resolves external domain links without using the current site host', () {
    final links = useCase(
      siteHost: 'qa.eeagle.ai',
      messageContent:
          'For more change credits, email upgrade@eeagle.ai or visit eeagle.ai/upgrade.',
    );

    expect(links, hasLength(1));
    expect(links.single.path, 'eeagle.ai/upgrade');
    expect(links.single.url, 'https://eeagle.ai/upgrade');
  });

  test('resolves mixed site paths and external links', () {
    final links = useCase(
      siteHost: 'qa.eeagle.ai',
      messageContent: 'Edit /contact or visit eeagle.ai/upgrade.',
    );

    expect(links, hasLength(2));
    expect(links[0].path, 'eeagle.ai/upgrade');
    expect(links[0].url, 'https://eeagle.ai/upgrade');
    expect(links[1].path, '/contact');
    expect(links[1].url, 'https://qa.eeagle.ai/contact');
  });
}

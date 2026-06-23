import 'package:eeagle_ai/src/core/util/page_path_util.dart';
import 'package:eeagle_ai/src/core/util/page_url_util.dart';
import 'package:eeagle_ai/src/domain/model/clickable_page_link.dart';

class ResolveMessagePagePathsUseCase {
  List<ClickablePageLink> call({
    required String siteHost,
    required String messageContent,
  }) {
    final externalLinks = extractExternalLinksFromText(messageContent);
    final pagePaths = extractPagePathsFromText(messageContent);
    final links = <ClickablePageLink>[];
    final seenPaths = <String>{};

    for (final externalLink in externalLinks) {
      if (seenPaths.add(externalLink)) {
        links.add(
          ClickablePageLink(
            path: externalLink,
            url: normalizeExternalUrl(externalLink),
          ),
        );
      }
    }

    for (final pagePath in pagePaths) {
      if (seenPaths.add(pagePath)) {
        links.add(
          ClickablePageLink(
            path: pagePath,
            url: resolveSitePageUrl(siteHost, pagePath),
          ),
        );
      }
    }

    return links;
  }
}

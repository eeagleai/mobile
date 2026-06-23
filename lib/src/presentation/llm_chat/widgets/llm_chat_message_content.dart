import 'package:eeagle_ai/src/domain/model/clickable_page_link.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LlmChatMessageContent extends StatelessWidget {
  const LlmChatMessageContent({
    super.key,
    required this.content,
    required this.clickablePageLinks,
    required this.onPageLinkTap,
  });

  final String content;
  final List<ClickablePageLink> clickablePageLinks;
  final ValueChanged<String> onPageLinkTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final textStyle = EeagleTextStyles.bodyMedium.copyWith(
      color: colors.foregroundPrimary,
    );
    final linkStyle = textStyle.copyWith(
      color: colors.palette.primary.shade400,
      decoration: TextDecoration.underline,
      decorationColor: colors.palette.primary.shade400,
    );

    if (clickablePageLinks.isEmpty) {
      return Text(content, style: textStyle);
    }

    final spans = _buildTextSpans(
      content: content,
      clickablePageLinks: clickablePageLinks,
      textStyle: textStyle,
      linkStyle: linkStyle,
      onPageLinkTap: onPageLinkTap,
    );

    return Text.rich(TextSpan(children: spans));
  }

  List<InlineSpan> _buildTextSpans({
    required String content,
    required List<ClickablePageLink> clickablePageLinks,
    required TextStyle textStyle,
    required TextStyle linkStyle,
    required ValueChanged<String> onPageLinkTap,
  }) {
    final pathMatches = <_PathMatch>[];

    for (final pageLink in clickablePageLinks) {
      var searchStart = 0;
      while (searchStart < content.length) {
        final matchIndex = content.indexOf(pageLink.path, searchStart);
        if (matchIndex == -1) {
          break;
        }

        pathMatches.add(
          _PathMatch(
            start: matchIndex,
            end: matchIndex + pageLink.path.length,
            pageLink: pageLink,
          ),
        );
        searchStart = matchIndex + pageLink.path.length;
      }
    }

    if (pathMatches.isEmpty) {
      return [TextSpan(text: content, style: textStyle)];
    }

    pathMatches.sort((left, right) {
      if (left.start != right.start) {
        return left.start.compareTo(right.start);
      }

      return right.end.compareTo(left.end);
    });

    final nonOverlappingMatches = <_PathMatch>[];
    var lastConsumedEnd = -1;
    for (final pathMatch in pathMatches) {
      if (pathMatch.start < lastConsumedEnd) {
        continue;
      }

      nonOverlappingMatches.add(pathMatch);
      lastConsumedEnd = pathMatch.end;
    }

    final spans = <InlineSpan>[];
    var currentIndex = 0;

    for (final pathMatch in nonOverlappingMatches) {
      if (pathMatch.start > currentIndex) {
        spans.add(
          TextSpan(
            text: content.substring(currentIndex, pathMatch.start),
            style: textStyle,
          ),
        );
      }

      spans.add(
        TextSpan(
          text: pathMatch.pageLink.path,
          style: linkStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () => onPageLinkTap(pathMatch.pageLink.url),
        ),
      );
      currentIndex = pathMatch.end;
    }

    if (currentIndex < content.length) {
      spans.add(
        TextSpan(
          text: content.substring(currentIndex),
          style: textStyle,
        ),
      );
    }

    return spans;
  }
}

class _PathMatch {
  const _PathMatch({
    required this.start,
    required this.end,
    required this.pageLink,
  });

  final int start;
  final int end;
  final ClickablePageLink pageLink;
}

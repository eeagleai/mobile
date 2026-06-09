import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_back_button.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class LlmChatTopAppBar extends StatelessWidget {
  const LlmChatTopAppBar({
    super.key,
    required this.site,
    this.quotaRemaining,
    this.onBackTap,
  });

  final Site site;
  final int? quotaRemaining;
  final VoidCallback? onBackTap;

  static const double _sideWidth = 96;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: _sideWidth,
            child: Align(
              alignment: Alignment.centerLeft,
              child: LlmChatBackButton(onTap: onBackTap),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EeagleText(
                  site.name,
                  style: EeagleTextStyles.titleLarge,
                  textColor: colors.titleNatural,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                EeagleText(
                  site.host,
                  style: EeagleTextStyles.bodySmall,
                  textColor: colors.bodyText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                if (quotaRemaining != null) ...[
                  const SizedBox(height: 2),
                  EeagleText(
                    '$quotaRemaining changes remaining',
                    style: EeagleTextStyles.bodySmall,
                    textColor: colors.foregroundSecondary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: _sideWidth),
        ],
      ),
    );
  }
}

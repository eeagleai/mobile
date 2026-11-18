import 'package:eeagle_ai/gen/assets.gen.dart';
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
    this.onPreviewTap,
    this.onVersionHistoryTap,
    this.isPreviewMode = false,
  });

  final Site site;
  final int? quotaRemaining;
  final VoidCallback? onBackTap;
  final VoidCallback? onPreviewTap;
  final VoidCallback? onVersionHistoryTap;
  final bool isPreviewMode;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colors.chipBorder, width: .5)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(
          children: [
            Row(
              children: [
                LlmChatBackButton(onTap: onBackTap),
                const SizedBox(width: 12),
                Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.palette.natural.shade950,
                    border: Border.all(color: colors.chipBorder),
                    boxShadow: [
                      BoxShadow(
                        color: colors.brandPrimary.withValues(alpha: .18),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: Assets.icons.eegaleIc.image(fit: BoxFit.contain),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: EeagleText(
                              'eeagle.ai',
                              style: EeagleTextStyles.titleLarge,
                              textColor: colors.titleNatural,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.verified_rounded,
                            size: 17,
                            color: colors.brandPrimary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      EeagleText(
                        site.host,
                        style: EeagleTextStyles.bodySmall,
                        textColor: colors.foregroundSecondary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<_ChatMenuAction>(
                  tooltip: 'More options',
                  onSelected: (action) {
                    if (action == _ChatMenuAction.versionHistory) {
                      onVersionHistoryTap?.call();
                    }
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: _ChatMenuAction.versionHistory,
                      child: Row(
                        children: [
                          Icon(Icons.history_rounded, size: 20),
                          SizedBox(width: 10),
                          Text('Version history'),
                        ],
                      ),
                    ),
                  ],
                  icon: const Icon(Icons.more_horiz_rounded, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 4),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: colors.success,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colors.success.withValues(alpha: .45),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                EeagleText(
                  'Online',
                  style: EeagleTextStyles.bodySmall,
                  textColor: colors.success,
                ),
                if (quotaRemaining != null) ...[
                  EeagleText(
                    '  •  $quotaRemaining ${quotaRemaining == 1 ? 'change' : 'changes'} remaining',
                    style: EeagleTextStyles.bodySmall,
                    textColor: colors.bodyText,
                  ),
                ],
                const Spacer(),
                _PreviewButton(
                  isPreviewMode: isPreviewMode,
                  onPressed: onPreviewTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewButton extends StatelessWidget {
  const _PreviewButton({required this.isPreviewMode, this.onPressed});

  final bool isPreviewMode;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        isPreviewMode
            ? Icons.chat_bubble_outline_rounded
            : Icons.visibility_outlined,
        size: 17,
      ),
      label: Text(isPreviewMode ? 'Chat' : 'Preview'),
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.brandPrimary,
        side: BorderSide(color: colors.brandPrimary.withValues(alpha: .45)),
        visualDensity: VisualDensity.compact,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      ),
    );
  }
}

enum _ChatMenuAction { versionHistory }

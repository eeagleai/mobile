import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_url_display.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class SitePreviewHeader extends StatelessWidget {
  const SitePreviewHeader({
    super.key,
    required this.displayTitle,
    required this.displayUrl,
    required this.isSecure,
    required this.canGoBack,
    required this.canGoForward,
    required this.onBack,
    required this.onForward,
    required this.onRefresh,
    required this.onClose,
  });

  final String displayTitle;
  final String displayUrl;
  final bool isSecure;
  final bool canGoBack;
  final bool canGoForward;
  final VoidCallback onBack;
  final VoidCallback onForward;
  final VoidCallback onRefresh;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final isEeagleHost = previewSheetIsEeagleHost(previewSheetDisplayHost(displayUrl));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SitePreviewFavicon(isEeagleHost: isEeagleHost),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EeagleText(
                  displayTitle,
                  style: EeagleTextStyles.titleMedium,
                  textColor: colors.titleNatural,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      isSecure
                          ? Icons.lock_rounded
                          : Icons.lock_open_rounded,
                      size: 14,
                      color: colors.foregroundSecondary,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: EeagleText(
                        displayUrl,
                        style: EeagleTextStyles.bodySmall,
                        textColor: colors.foregroundSecondary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (isSecure) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.verified_user_outlined,
                        size: 14,
                        color: colors.success,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: EeagleText(
                          'Secure connection',
                          style: EeagleTextStyles.bodySmall,
                          textColor: colors.success,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SitePreviewNavButton(
                icon: Icons.arrow_back_rounded,
                onPressed: canGoBack ? onBack : null,
              ),
              const SizedBox(width: 8),
              _SitePreviewNavButton(
                icon: Icons.arrow_forward_rounded,
                onPressed: canGoForward ? onForward : null,
              ),
              const SizedBox(width: 8),
              _SitePreviewNavButton(
                icon: Icons.refresh_rounded,
                onPressed: onRefresh,
              ),
              const SizedBox(width: 8),
              _SitePreviewNavButton(
                icon: Icons.close_rounded,
                onPressed: onClose,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SitePreviewFavicon extends StatelessWidget {
  const _SitePreviewFavicon({required this.isEeagleHost});

  final bool isEeagleHost;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: colors.palette.natural.shade800,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.chipBorder, width: 0.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: isEeagleHost
          ? Image.asset(
              Assets.icons.eegaleIc.path,
              fit: BoxFit.cover,
            )
          : Icon(
              Icons.language_rounded,
              color: colors.foregroundSecondary,
              size: 22,
            ),
    );
  }
}

class _SitePreviewNavButton extends StatelessWidget {
  const _SitePreviewNavButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final isEnabled = onPressed != null;

    return Material(
      color: colors.palette.natural.shade800,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(
            icon,
            size: 18,
            color: isEnabled
                ? colors.foregroundPrimary
                : colors.foregroundSecondary.withValues(alpha: 0.45),
          ),
        ),
      ),
    );
  }
}

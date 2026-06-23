import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_url_display.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class SitePreviewActionBar extends StatelessWidget {
  const SitePreviewActionBar({
    super.key,
    required this.onOpenFullScreen,
    required this.onOpenInBrowser,
    required this.onCopyLink,
    required this.onReload,
    required this.onShare,
  });

  final VoidCallback onOpenFullScreen;
  final VoidCallback onOpenInBrowser;
  final VoidCallback onCopyLink;
  final VoidCallback onReload;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final externalBrowserLabel = externalBrowserActionShortLabel();

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
      child: Row(
        children: [
          Expanded(
            child: _SitePreviewCircleAction(
              icon: Icons.open_in_full_rounded,
              label: 'Full screen',
              onPressed: onOpenFullScreen,
            ),
          ),
          Expanded(
            child: _SitePreviewCircleAction(
              icon: Icons.explore_outlined,
              label: externalBrowserLabel,
              onPressed: onOpenInBrowser,
            ),
          ),
          Expanded(
            child: _SitePreviewCircleAction(
              icon: Icons.link_rounded,
              label: 'Copy',
              onPressed: onCopyLink,
            ),
          ),
          Expanded(
            child: _SitePreviewCircleAction(
              icon: Icons.refresh_rounded,
              label: 'Reload',
              onPressed: onReload,
            ),
          ),
          Expanded(
            child: _SitePreviewCircleAction(
              icon: Icons.ios_share_rounded,
              label: 'Share',
              onPressed: onShare,
            ),
          ),
        ],
      ),
    );
  }
}

class _SitePreviewCircleAction extends StatelessWidget {
  const _SitePreviewCircleAction({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: colors.palette.natural.shade800,
              shape: const CircleBorder(),
              child: SizedBox(
                width: 48,
                height: 48,
                child: Icon(
                  icon,
                  size: 22,
                  color: colors.foregroundPrimary,
                ),
              ),
            ),
            const SizedBox(height: 6),
            EeagleText(
              label,
              style: EeagleTextStyles.bodySmall,
              textColor: colors.foregroundSecondary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

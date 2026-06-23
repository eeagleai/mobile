import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class SitePreviewFooter extends StatelessWidget {
  const SitePreviewFooter({
    super.key,
    required this.onExpand,
  });

  final VoidCallback onExpand;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          Icon(
            Icons.shield_outlined,
            size: 18,
            color: colors.success,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EeagleText(
                  'Secure browsing',
                  style: EeagleTextStyles.bodySmall,
                  textColor: colors.foregroundPrimary,
                ),
                EeagleText(
                  'Your connection is protected',
                  style: EeagleTextStyles.bodySmall,
                  textColor: colors.foregroundSecondary,
                ),
              ],
            ),
          ),
          Material(
            color: colors.palette.natural.shade800,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: onExpand,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.open_in_full_rounded,
                  size: 20,
                  color: colors.foregroundPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

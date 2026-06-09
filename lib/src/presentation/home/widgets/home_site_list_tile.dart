import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class HomeSiteListTile extends StatelessWidget {
  const HomeSiteListTile({
    super.key,
    required this.site,
    required this.onTap,
  });

  final Site site;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colors.inputSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colors.chipBorder, width: 0.5),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EeagleText(
                      site.name,
                      style: EeagleTextStyles.titleMedium,
                      textColor: colors.titleNatural,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    EeagleText(
                      site.host,
                      style: EeagleTextStyles.bodyMedium,
                      textColor: colors.bodyText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (site.quotaRemaining != null) ...[
                      const SizedBox(height: 4),
                      EeagleText(
                        '${site.quotaRemaining} changes remaining',
                        style: EeagleTextStyles.bodySmall,
                        textColor: colors.foregroundSecondary,
                        maxLines: 1,
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: colors.foregroundSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

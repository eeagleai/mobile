import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

/// A single rounded stat tile: an icon, a label, and a value.
class AnalyticsStatCard extends StatelessWidget {
  const AnalyticsStatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.chipBorder, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: colors.palette.primary.shade400),
          const SizedBox(height: 12),
          EeagleText(
            value,
            style: EeagleTextStyles.headlineSmall,
            textColor: colors.titleNatural,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          EeagleText(
            label,
            style: EeagleTextStyles.bodySmall,
            textColor: colors.foregroundSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

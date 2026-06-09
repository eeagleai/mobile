import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_svg_icon.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class LlmChatServiceChip extends StatelessWidget {
  const LlmChatServiceChip({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  final String label;
  final SvgGenImage icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: colors.chipBorder, width: 0.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              EeagleSvgIcon(icon: icon, size: 18),
              const SizedBox(width: 10),
              EeagleText(
                label,
                style: EeagleTextStyles.bodyMedium,
                textColor: colors.chipLabel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

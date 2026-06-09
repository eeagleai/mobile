import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class LoginOrDivider extends StatelessWidget {
  const LoginOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Row(
      children: [
        Expanded(
          child: Divider(color: colors.chipBorder, height: 1),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: colors.orBadgeBackground,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: colors.chipBorder),
          ),
          child: EeagleText(
            'OR',
            style: EeagleTextStyles.bodySmall,
            textColor: colors.descriptionMuted,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Divider(color: colors.chipBorder, height: 1),
        ),
      ],
    );
  }
}

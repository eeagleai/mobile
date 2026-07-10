import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class SignupVerificationEmailCard extends StatelessWidget {
  const SignupVerificationEmailCard({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.chipBorder),
      ),
      child: Row(
        children: [
          Icon(
            Icons.email_outlined,
            color: colors.brandPrimaryAccent,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: EeagleText(
              email,
              style: EeagleTextStyles.bodyLarge,
              textColor: colors.titleNatural,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class LlmChatGreetingText extends StatelessWidget {
  const LlmChatGreetingText({
    super.key,
    required this.siteName,
  });

  final String siteName;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: EeagleText(
        'How can I help you with\n$siteName today?',
        style: EeagleTextStyles.headlineSmall,
        textColor: colors.foregroundSecondary,
        textAlign: TextAlign.center,
      ),
    );
  }
}

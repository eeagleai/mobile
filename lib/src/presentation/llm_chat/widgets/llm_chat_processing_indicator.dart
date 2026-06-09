import 'package:eeagle_ai/src/domain/model/chat_connection_phase.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_app_loader.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class LlmChatProcessingIndicator extends StatelessWidget {
  const LlmChatProcessingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        children: [
          const EeagleAppLoader(size: 18),
          const SizedBox(width: 10),
          EeagleText(
            'Thinking...',
            style: EeagleTextStyles.bodySmall,
            textColor: colors.foregroundSecondary,
          ),
        ],
      ),
    );
  }
}

bool shouldShowProcessingIndicator(ChatConnectionPhase phase) {
  return phase == ChatConnectionPhase.processing;
}

import 'package:eeagle_ai/src/presentation/llm_chat/models/llm_chat_ready_prompt_data.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_service_chip.dart';
import 'package:flutter/material.dart';

class LlmChatReadyPromptChips extends StatelessWidget {
  const LlmChatReadyPromptChips({
    super.key,
    this.prompts,
    this.onPromptTap,
    
  });

  final List<LlmChatReadyPromptData>? prompts;
  final ValueChanged<LlmChatReadyPromptData>? onPromptTap;

  @override
  Widget build(BuildContext context) {
    final resolvedPrompts = prompts ?? llmChatReadyPrompts;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 12,
        runSpacing: 12,
        children: [
          for (final prompt in resolvedPrompts)
            LlmChatServiceChip(
              label: prompt.label,
              icon: prompt.icon,
              onTap: onPromptTap == null ? null : () => onPromptTap!(prompt),
            ),
        ],
      ),
    );
  }
}

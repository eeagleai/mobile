import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/models/llm_chat_ready_prompt_data.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_service_chip.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_colors.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LlmChatIntroView extends StatelessWidget {
  const LlmChatIntroView({super.key, required this.site});

  final Site site;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AssistantAvatar(colors: colors),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: colors.palette.natural.shade900.withValues(alpha: .82),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: colors.brandPrimary.withValues(alpha: .34),
                  width: .8,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.brandPrimary.withValues(alpha: .10),
                    blurRadius: 24,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EeagleText(
                    'Hi! 👋',
                    style: EeagleTextStyles.titleLarge,
                    textColor: colors.titleNatural,
                  ),
                  const SizedBox(height: 12),
                  EeagleText(
                    'I’m your AI co-pilot for building and improving ${site.name}.',
                    style: EeagleTextStyles.bodyMedium,
                    textColor: colors.foregroundPrimary,
                  ),
                  const SizedBox(height: 8),
                  EeagleText(
                    'How can I help you bring your idea to life today?',
                    style: EeagleTextStyles.bodyMedium,
                    textColor: colors.foregroundPrimary,
                  ),
                  const SizedBox(height: 18),
                  for (
                    var index = 0;
                    index < llmChatReadyPrompts.take(4).length;
                    index++
                  ) ...[
                    SizedBox(
                      width: double.infinity,
                      child: LlmChatServiceChip(
                        label: llmChatReadyPrompts[index].label,
                        icon: llmChatReadyPrompts[index].icon,
                        onTap: () => context.read<LlmChatPromptBloc>().add(
                          LlmChatPromptEvent.textChanged(
                            llmChatReadyPrompts[index].prompt,
                          ),
                        ),
                      ),
                    ),
                    if (index != 3) const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AssistantAvatar extends StatelessWidget {
  const _AssistantAvatar({required this.colors});

  final EeagleColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.palette.natural.shade950,
        border: Border.all(color: colors.brandPrimary.withValues(alpha: .45)),
      ),
      child: Assets.icons.eegaleIc.image(fit: BoxFit.contain),
    );
  }
}

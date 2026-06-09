import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_ai_orb.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_greeting_text.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_ready_prompt_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LlmChatIntroView extends StatelessWidget {
  const LlmChatIntroView({
    super.key,
    required this.site,
  });

  final Site site;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LlmChatAiOrb(),
                const SizedBox(height: 24),
                LlmChatGreetingText(siteName: site.name),
                const SizedBox(height: 16),
                LlmChatReadyPromptChips(
                  onPromptTap: (prompt) => context.read<LlmChatPromptBloc>().add(
                        LlmChatPromptEvent.textChanged(prompt.prompt),
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

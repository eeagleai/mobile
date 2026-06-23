import 'package:eeagle_ai/src/domain/model/chat_message.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_message_content.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class LlmChatMessageBubble extends StatelessWidget {
  const LlmChatMessageBubble({
    super.key,
    required this.message,
    required this.onPageLinkTap,
  });

  final ChatMessage message;
  final ValueChanged<String> onPageLinkTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final isUser = message.role == ChatMessageRole.user;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.82,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isUser
                ? colors.palette.primary.shade700
                : colors.inputSurface,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(18),
              topRight: const Radius.circular(18),
              bottomLeft: Radius.circular(isUser ? 18 : 6),
              bottomRight: Radius.circular(isUser ? 6 : 18),
            ),
            border: Border.all(
              color: isUser ? colors.chipBorder : colors.chipBorder,
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: isUser
                ? EeagleText(
                    message.content,
                    style: EeagleTextStyles.bodyMedium,
                    textColor: colors.foregroundPrimary,
                  )
                : LlmChatMessageContent(
                    content: message.content,
                    clickablePageLinks: message.clickablePageLinks,
                    onPageLinkTap: onPageLinkTap,
                  ),
          ),
        ),
      ),
    );
  }
}

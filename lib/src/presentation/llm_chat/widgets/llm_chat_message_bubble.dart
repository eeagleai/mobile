import 'package:eeagle_ai/gen/assets.gen.dart';
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
    final bubble = Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * (isUser ? .76 : .80),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: isUser
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colors.palette.primary.shade800,
                  colors.palette.primary.shade700,
                ],
              )
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colors.palette.natural.shade900.withValues(alpha: .94),
                  colors.palette.primary.shade950.withValues(alpha: .70),
                ],
              ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isUser
              ? colors.palette.primary.shade500.withValues(alpha: .55)
              : colors.brandPrimary.withValues(alpha: .28),
          width: .8,
        ),
        boxShadow: [
          BoxShadow(
            color: (isUser ? colors.brandPrimary : Colors.black).withValues(
              alpha: .12,
            ),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
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
    );

    if (isUser) {
      return Align(alignment: Alignment.centerRight, child: bubble);
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.palette.natural.shade950,
              border: Border.all(
                color: colors.brandPrimary.withValues(alpha: .42),
              ),
            ),
            child: Assets.icons.eegaleIc.image(fit: BoxFit.contain),
          ),
          const SizedBox(width: 10),
          Flexible(child: bubble),
        ],
      ),
    );
  }
}

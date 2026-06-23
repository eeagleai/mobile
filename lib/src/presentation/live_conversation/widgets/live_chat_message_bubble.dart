import 'package:eeagle_ai/src/core/util/analytics_time_format.dart';
import 'package:eeagle_ai/src/domain/model/live_chat_message.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

/// A chat bubble: owner messages on the right, visitor messages on the left.
class LiveChatMessageBubble extends StatelessWidget {
  const LiveChatMessageBubble({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final LiveChatMessage message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final isOwner = message.isOwner;

    return Align(
      alignment: isOwner ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.82,
        ),
        child: Column(
          crossAxisAlignment:
              isOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: isOwner
                    ? colors.palette.primary.shade700
                    : colors.inputSurface,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isOwner ? 18 : 6),
                  bottomRight: Radius.circular(isOwner ? 6 : 18),
                ),
                border: Border.all(color: colors.chipBorder, width: 0.5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: EeagleText(
                  message.text,
                  style: EeagleTextStyles.bodyMedium,
                  textColor: colors.foregroundPrimary,
                ),
              ),
            ),
            const SizedBox(height: 4),
            _MetaLine(message: message, onRetry: onRetry),
          ],
        ),
      ),
    );
  }
}

class _MetaLine extends StatelessWidget {
  const _MetaLine({required this.message, required this.onRetry});

  final LiveChatMessage message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final time = AnalyticsTimeFormat.relative(message.createdAt);

    if (message.isOwner && message.status == LiveChatMessageStatus.failed) {
      return GestureDetector(
        onTap: onRetry,
        child: EeagleText(
          'Failed · Tap to retry',
          style: EeagleTextStyles.labelSmall,
          textColor: colors.error,
          maxLines: 1,
        ),
      );
    }

    final suffix = switch (message.status) {
      LiveChatMessageStatus.sending => ' · Sending…',
      LiveChatMessageStatus.queued => ' · Queued',
      _ => '',
    };

    return EeagleText(
      '$time$suffix',
      style: EeagleTextStyles.labelSmall,
      textColor: colors.foregroundSecondary,
      maxLines: 1,
    );
  }
}

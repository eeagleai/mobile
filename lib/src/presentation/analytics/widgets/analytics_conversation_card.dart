import 'package:eeagle_ai/src/core/util/analytics_time_format.dart';
import 'package:eeagle_ai/src/domain/entities/live_conversation_summary.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class AnalyticsConversationCard extends StatelessWidget {
  const AnalyticsConversationCard({
    super.key,
    required this.conversation,
    required this.onTap,
  });

  final LiveConversationSummary conversation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final accent = colors.palette.primary.shade400;
    final hasUnread = conversation.unreadCount > 0;
    final preview = conversation.latestPreview;
    final statusLabel = switch (conversation.status) {
      LiveConversationStatus.closed => 'Closed',
      LiveConversationStatus.waiting => 'Waiting',
      LiveConversationStatus.active => 'Active',
    };

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: colors.inputSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: hasUnread ? accent.withValues(alpha: 0.6) : colors.chipBorder,
              width: hasUnread ? 1 : 0.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (hasUnread) ...[
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: EeagleText(
                      conversation.visitorLabel,
                      style: EeagleTextStyles.titleSmall,
                      textColor: colors.titleNatural,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  EeagleText(
                    AnalyticsTimeFormat.relative(conversation.lastActivityAt),
                    style: EeagleTextStyles.bodySmall,
                    textColor: colors.foregroundSecondary,
                    maxLines: 1,
                  ),
                ],
              ),
              if (preview != null && preview.isNotEmpty) ...[
                const SizedBox(height: 6),
                EeagleText(
                  _previewLabel(conversation.latestEventType, preview),
                  style: EeagleTextStyles.bodyMedium,
                  textColor: colors.foregroundPrimary,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (conversation.pageUrl != null &&
                  conversation.pageUrl!.isNotEmpty) ...[
                const SizedBox(height: 6),
                EeagleText(
                  conversation.pageUrl!,
                  style: EeagleTextStyles.bodySmall,
                  textColor: colors.bodyText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 10),
              Row(
                children: [
                  _StatusChip(label: statusLabel),
                  if (hasUnread) ...[
                    const SizedBox(width: 8),
                    _StatusChip(
                      label: '${conversation.unreadCount} unread',
                      color: accent,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.chat_bubble_outline_rounded, size: 14, color: accent),
                  const SizedBox(width: 6),
                  EeagleText(
                    'Tap to open chat',
                    style: EeagleTextStyles.labelSmall,
                    textColor: accent,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _previewLabel(String? eventType, String preview) {
    return switch (eventType) {
      'live_owner_message' => 'You: $preview',
      'live_visitor_message' => 'Visitor: $preview',
      _ => preview,
    };
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, this.color});

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final chipColor = color ?? colors.foregroundSecondary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: chipColor.withValues(alpha: 0.3), width: 0.5),
      ),
      child: EeagleText(
        label,
        style: EeagleTextStyles.labelSmall,
        textColor: chipColor,
        maxLines: 1,
      ),
    );
  }
}

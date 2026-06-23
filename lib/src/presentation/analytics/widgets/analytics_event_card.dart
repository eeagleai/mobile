import 'package:eeagle_ai/src/core/util/analytics_time_format.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_colors.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

/// A single event row in the recent/live events list. Tappable when it can
/// open a live conversation.
class AnalyticsEventCard extends StatelessWidget {
  const AnalyticsEventCard({
    super.key,
    required this.event,
    this.onTap,
    this.hasUnread = false,
  });

  final AnalyticsEvent event;
  final VoidCallback? onTap;
  final bool hasUnread;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final accent = colors.palette.primary.shade400;

    final location = [event.city, event.country]
        .where((part) => part != null && part.isNotEmpty)
        .join(', ');
    final visit = event.visitId;
    final messageText = event.message ?? event.preview;
    final canChat = event.canOpenChat;

    final card = Container(
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
                  event.eventType ?? 'event',
                  style: EeagleTextStyles.titleSmall,
                  textColor: colors.titleNatural,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              EeagleText(
                AnalyticsTimeFormat.relative(event.createdAt),
                style: EeagleTextStyles.bodySmall,
                textColor: colors.foregroundSecondary,
                maxLines: 1,
              ),
            ],
          ),
          if (messageText != null && messageText.isNotEmpty) ...[
            const SizedBox(height: 6),
            EeagleText(
              messageText,
              style: EeagleTextStyles.bodyMedium,
              textColor: colors.foregroundPrimary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (event.pageUrl != null && event.pageUrl!.isNotEmpty) ...[
            const SizedBox(height: 6),
            EeagleText(
              event.pageUrl!,
              style: EeagleTextStyles.bodySmall,
              textColor: colors.bodyText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              if (event.method != null) _Chip(label: event.method!),
              if (event.statusCode != null)
                _Chip(
                  label: '${event.statusCode}',
                  color: _statusColor(event.statusCode!, colors),
                ),
              if (event.outcome != null && event.outcome!.isNotEmpty)
                _Chip(label: event.outcome!),
              if (event.endpoint != null && event.endpoint!.isNotEmpty)
                _Chip(label: event.endpoint!),
              if (location.isNotEmpty) _Chip(label: location),
            ],
          ),
          if (visit != null && visit.isNotEmpty) ...[
            const SizedBox(height: 8),
            EeagleText(
              'Visit: $visit',
              style: EeagleTextStyles.labelSmall,
              textColor: colors.foregroundDisabled,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (canChat) ...[
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
        ],
      ),
    );

    if (onTap == null) {
      return card;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: card,
      ),
    );
  }

  Color _statusColor(int statusCode, EeagleColors colors) {
    if (statusCode >= 500) {
      return colors.error;
    }
    if (statusCode >= 400) {
      return colors.warning;
    }
    return colors.success;
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, this.color});

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

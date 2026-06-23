import 'package:eeagle_ai/src/core/util/analytics_time_format.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

/// Top card on the analytics screen: site name, host, live status pill, and
/// the last-event time.
class AnalyticsHeaderCard extends StatelessWidget {
  const AnalyticsHeaderCard({
    super.key,
    required this.siteName,
    required this.host,
    required this.status,
    this.lastEventAt,
  });

  final String siteName;
  final String host;
  final AnalyticsConnectionStatus status;
  final DateTime? lastEventAt;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.chipBorder, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: EeagleText(
                  siteName,
                  style: EeagleTextStyles.titleLarge,
                  textColor: colors.titleNatural,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              _ConnectionPill(status: status),
            ],
          ),
          const SizedBox(height: 4),
          EeagleText(
            host,
            style: EeagleTextStyles.bodyMedium,
            textColor: colors.bodyText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          EeagleText(
            'Last event: ${AnalyticsTimeFormat.relative(lastEventAt)}',
            style: EeagleTextStyles.bodySmall,
            textColor: colors.foregroundSecondary,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

class _ConnectionPill extends StatelessWidget {
  const _ConnectionPill({required this.status});

  final AnalyticsConnectionStatus status;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    final (Color color, String label) = switch (status) {
      AnalyticsConnectionStatus.live => (colors.success, 'Live'),
      AnalyticsConnectionStatus.reconnecting => (
          colors.warning,
          'Reconnecting…',
        ),
      AnalyticsConnectionStatus.offline => (colors.foregroundSecondary, 'Offline'),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          EeagleText(
            label,
            style: EeagleTextStyles.labelSmall,
            textColor: color,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

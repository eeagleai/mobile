import 'package:eeagle_ai/src/core/util/analytics_time_format.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

/// Header card for the live conversation: page title/url, live status, location.
class LiveConversationHeaderCard extends StatelessWidget {
  const LiveConversationHeaderCard({
    super.key,
    required this.status,
    this.pageUrl,
    this.visitorLocation,
    this.createdAt,
  });

  final AnalyticsConnectionStatus status;
  final String? pageUrl;
  final String? visitorLocation;
  final DateTime? createdAt;

  String get _title {
    final url = pageUrl;
    if (url == null || url.isEmpty) {
      return 'Visitor';
    }
    final host = Uri.tryParse(url)?.host;
    return (host == null || host.isEmpty) ? url : host;
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    final meta = <String>[
      if (visitorLocation != null && visitorLocation!.isNotEmpty)
        visitorLocation!,
      if (createdAt != null) 'Started ${AnalyticsTimeFormat.relative(createdAt)}',
    ].join(' · ');

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
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
                  _title,
                  style: EeagleTextStyles.titleMedium,
                  textColor: colors.titleNatural,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              _ConnectionPill(status: status),
            ],
          ),
          if (pageUrl != null && pageUrl!.isNotEmpty) ...[
            const SizedBox(height: 4),
            EeagleText(
              pageUrl!,
              style: EeagleTextStyles.bodySmall,
              textColor: colors.bodyText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (meta.isNotEmpty) ...[
            const SizedBox(height: 8),
            EeagleText(
              meta,
              style: EeagleTextStyles.bodySmall,
              textColor: colors.foregroundSecondary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
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
      AnalyticsConnectionStatus.offline => (
          colors.foregroundSecondary,
          'Offline',
        ),
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

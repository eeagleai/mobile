import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/home_analytics_bloc.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSiteListTile extends StatelessWidget {
  const HomeSiteListTile({
    super.key,
    required this.site,
    required this.onTap,
    required this.onPreviewTap,
    required this.onAnalyticsTap,
  });

  final Site site;
  final VoidCallback onTap;
  final VoidCallback onPreviewTap;
  final VoidCallback onAnalyticsTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final accent = colors.palette.primary.shade400;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF161C28), Color(0xFF0E131C)],
            ),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: colors.chipBorder, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: globe box · title/host · divider · action buttons.
              Row(
                children: [
                  _IconBox(icon: Icons.public_rounded, color: accent),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        EeagleText(
                          site.name,
                          style: EeagleTextStyles.titleLarge,
                          textColor: colors.titleNatural,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        EeagleText(
                          site.host,
                          style: EeagleTextStyles.bodyMedium,
                          textColor: colors.bodyText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 1,
                    height: 40,
                    color: colors.chipBorder,
                  ),
                  const SizedBox(width: 12),
                  _IconBox(
                    icon: Icons.open_in_new_rounded,
                    color: accent,
                    tooltip: 'Preview website',
                    onTap: onPreviewTap,
                  ),
                  const SizedBox(width: 10),
                  _IconBox(
                    icon: Icons.insights_rounded,
                    color: accent,
                    tooltip: 'View analytics',
                    onTap: onAnalyticsTap,
                  ),
                  const SizedBox(width: 10),
                  _IconBox(
                    icon: Icons.chevron_right_rounded,
                    color: colors.foregroundSecondary,
                    tooltip: 'Open website',
                    onTap: onTap,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(height: 1, color: colors.chipBorder),
              const SizedBox(height: 16),
              // Bottom row: stat chips.
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  if (site.quotaRemaining != null)
                    _StatChip(
                      icon: Icons.bolt_rounded,
                      value: '${site.quotaRemaining}',
                      label: 'changes remaining',
                    ),
                  _VisitorsStatChip(apikey: site.apikey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A rounded-square surface holding a single icon. Tappable when [onTap] is set.
class _IconBox extends StatelessWidget {
  const _IconBox({
    required this.icon,
    required this.color,
    this.tooltip,
    this.onTap,
  });

  final IconData icon;
  final Color color;
  final String? tooltip;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    final box = Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.chipBorder, width: 0.5),
      ),
      child: Icon(icon, size: 22, color: color),
    );

    if (onTap == null) {
      return box;
    }

    final tappable = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: box,
      ),
    );

    return tooltip == null ? tappable : Tooltip(message: tooltip!, child: tappable);
  }
}

/// A rounded pill: blue icon + bold blue value + muted label.
class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.value,
    required this.label,
    this.onTap,
  });

  final IconData icon;
  final String value;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final accent = colors.palette.primary.shade400;

    final content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.chipBorder, width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: accent),
          const SizedBox(width: 8),
          EeagleText(
            value,
            style: EeagleTextStyles.titleSmall,
            textColor: accent,
            maxLines: 1,
          ),
          const SizedBox(width: 6),
          EeagleText(
            label,
            style: EeagleTextStyles.bodySmall,
            textColor: colors.foregroundSecondary,
            maxLines: 1,
          ),
        ],
      ),
    );

    if (onTap == null) {
      return content;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: content,
      ),
    );
  }
}

/// The live "unique visitors" chip, driven by [HomeAnalyticsBloc].
///
/// Rebuilds only when this site's analytics change (scoped via `context.select`).
class _VisitorsStatChip extends StatelessWidget {
  const _VisitorsStatChip({required this.apikey});

  final String apikey;

  @override
  Widget build(BuildContext context) {
    final analytics =
        context.select((HomeAnalyticsBloc bloc) => bloc.state.forApikey(apikey));
    final stats = analytics.stats;

    // No stats yet: dim placeholder while loading, retry on error.
    if (stats == null) {
      return _StatChip(
        icon: Icons.group_rounded,
        value: '—',
        label: 'unique visitors',
        onTap: analytics.hasError
            ? () => context
                .read<HomeAnalyticsBloc>()
                .add(HomeAnalyticsEvent.siteRefreshRequested(apikey))
            : null,
      );
    }

    return _StatChip(
      icon: Icons.group_rounded,
      value: '${stats.uniqueVisitors}',
      label: 'unique visitors',
    );
  }
}

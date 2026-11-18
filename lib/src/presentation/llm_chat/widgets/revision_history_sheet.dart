import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/model/site_revision.dart';
import 'package:eeagle_ai/src/domain/model/site_rollback_result.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/revision_history_bloc.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_app_loader.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<SiteRollbackResult?> showRevisionHistorySheet(
  BuildContext context, {
  required Site site,
}) {
  return showModalBottomSheet<SiteRollbackResult>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => BlocProvider(
      create: (_) =>
          di<RevisionHistoryBloc>()
            ..add(RevisionHistoryEvent.started(siteApiKey: site.apikey)),
      child: const _RevisionHistorySheet(),
    ),
  );
}

class _RevisionHistorySheet extends StatelessWidget {
  const _RevisionHistorySheet();

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return DraggableScrollableSheet(
      initialChildSize: 0.88,
      minChildSize: 0.55,
      maxChildSize: 0.96,
      expand: false,
      builder: (context, scrollController) {
        return BlocListener<RevisionHistoryBloc, RevisionHistoryState>(
          listenWhen: (previous, current) =>
              previous.rollbackResult != current.rollbackResult &&
              current.rollbackResult != null,
          listener: (context, state) {
            Navigator.of(context).pop(state.rollbackResult);
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors.palette.natural.shade950,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              border: Border.all(color: colors.chipBorder),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colors.foregroundSecondary.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 14, 12, 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EeagleText(
                              'Version history',
                              style: EeagleTextStyles.headlineSmall,
                              textColor: colors.titleNatural,
                            ),
                            const SizedBox(height: 3),
                            EeagleText(
                              'Restore a previously saved website version.',
                              style: EeagleTextStyles.bodySmall,
                              textColor: colors.bodyText,
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<RevisionHistoryBloc, RevisionHistoryState>(
                        buildWhen: (previous, current) =>
                            previous.isRefreshing != current.isRefreshing ||
                            previous.isRollingBack != current.isRollingBack,
                        builder: (context, state) {
                          return IconButton(
                            tooltip: 'Refresh versions',
                            onPressed: state.isRefreshing || state.isRollingBack
                                ? null
                                : () => context.read<RevisionHistoryBloc>().add(
                                    const RevisionHistoryEvent.refreshRequested(),
                                  ),
                            icon: state.isRefreshing
                                ? EeagleAppLoader(
                                    size: 20,
                                    color: colors.brandPrimary,
                                  )
                                : const Icon(Icons.refresh_rounded),
                          );
                        },
                      ),
                      IconButton(
                        tooltip: 'Close',
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, color: colors.chipBorder),
                Expanded(
                  child: BlocBuilder<RevisionHistoryBloc, RevisionHistoryState>(
                    builder: (context, state) {
                      return _RevisionHistoryContent(
                        state: state,
                        scrollController: scrollController,
                      );
                    },
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

class _RevisionHistoryContent extends StatelessWidget {
  const _RevisionHistoryContent({
    required this.state,
    required this.scrollController,
  });

  final RevisionHistoryState state;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    if (state.status == RevisionHistoryStatus.initial ||
        state.status == RevisionHistoryStatus.loading) {
      return const Center(child: EeagleAppLoader());
    }

    if (state.status == RevisionHistoryStatus.failure) {
      return _RevisionHistoryMessage(
        scrollController: scrollController,
        icon: Icons.history_toggle_off_rounded,
        title: 'Could not load versions',
        message: state.errorMessage ?? 'Please try again.',
        actionLabel: 'Try again',
        onAction: () => context.read<RevisionHistoryBloc>().add(
          const RevisionHistoryEvent.refreshRequested(),
        ),
      );
    }

    if (state.revisions.isEmpty) {
      return _RevisionHistoryMessage(
        scrollController: scrollController,
        icon: Icons.history_rounded,
        title: 'No saved versions yet',
        message: 'Website changes will appear here after they are saved.',
      );
    }

    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      itemCount:
          state.revisions.length + (state.rollbackErrorMessage == null ? 0 : 1),
      separatorBuilder: (_, _) => const SizedBox(height: 2),
      itemBuilder: (context, index) {
        if (state.rollbackErrorMessage != null && index == 0) {
          return _RollbackErrorBanner(message: state.rollbackErrorMessage!);
        }
        final revisionIndex =
            index - (state.rollbackErrorMessage == null ? 0 : 1);
        final revision = state.revisions[revisionIndex];
        return _RevisionListRow(
          revision: revision,
          isRestoring:
              state.isRollingBack && state.rollingBackRevisionId == revision.id,
          restoreDisabled: state.isRollingBack,
          onRestore: () => _confirmRestore(context, revision),
        );
      },
    );
  }

  Future<void> _confirmRestore(
    BuildContext context,
    SiteRevision revision,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Restore this version?'),
        content: const Text(
          'Your current website will be replaced. A change credit may be used '
          'or refunded based on the rollback rules. This cannot be cancelled '
          'after it starts.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton.icon(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            icon: const Icon(Icons.restore_rounded, size: 18),
            label: const Text('Restore version'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      context.read<RevisionHistoryBloc>().add(
        RevisionHistoryEvent.rollbackRequested(revision: revision),
      );
    }
  }
}

class _RevisionListRow extends StatelessWidget {
  const _RevisionListRow({
    required this.revision,
    required this.isRestoring,
    required this.restoreDisabled,
    required this.onRestore,
  });

  final SiteRevision revision;
  final bool isRestoring;
  final bool restoreDisabled;
  final VoidCallback onRestore;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final localizations = MaterialLocalizations.of(context);
    final localDate = revision.createdAt.toLocal();
    final summary = revision.userSummary?.trim();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.inputSurface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colors.chipBorder),
            ),
            child: Icon(
              revision.isBackend
                  ? Icons.dns_outlined
                  : Icons.web_asset_outlined,
              size: 21,
              color: colors.brandPrimary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EeagleText(
                  summary == null || summary.isEmpty
                      ? 'Saved website version'
                      : summary,
                  style: EeagleTextStyles.titleSmall,
                  textColor: colors.titleNatural,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 8,
                  runSpacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _RevisionKindLabel(isBackend: revision.isBackend),
                    EeagleText(
                      '${localizations.formatMediumDate(localDate)} at '
                      '${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(localDate))}',
                      style: EeagleTextStyles.bodySmall,
                      textColor: colors.bodyText,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            tooltip: 'Restore version',
            onPressed: restoreDisabled ? null : onRestore,
            icon: isRestoring
                ? EeagleAppLoader(size: 20, color: colors.brandPrimary)
                : const Icon(Icons.restore_rounded),
          ),
        ],
      ),
    );
  }
}

class _RevisionKindLabel extends StatelessWidget {
  const _RevisionKindLabel({required this.isBackend});

  final bool isBackend;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: colors.brandPrimary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: colors.brandPrimary.withValues(alpha: 0.35)),
      ),
      child: EeagleText(
        isBackend ? 'Backend' : 'Frontend',
        style: EeagleTextStyles.labelSmall,
        textColor: colors.brandPrimary,
      ),
    );
  }
}

class _RollbackErrorBanner extends StatelessWidget {
  const _RollbackErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.error.withValues(alpha: 0.45)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.error_outline_rounded, color: colors.error, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: EeagleText(
              message,
              style: EeagleTextStyles.bodySmall,
              textColor: colors.error,
            ),
          ),
        ],
      ),
    );
  }
}

class _RevisionHistoryMessage extends StatelessWidget {
  const _RevisionHistoryMessage({
    required this.scrollController,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  final ScrollController scrollController;
  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(32),
      children: [
        const SizedBox(height: 70),
        Icon(icon, size: 46, color: colors.foregroundSecondary),
        const SizedBox(height: 16),
        EeagleText(
          title,
          style: EeagleTextStyles.titleLarge,
          textColor: colors.titleNatural,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        EeagleText(
          message,
          style: EeagleTextStyles.bodyMedium,
          textColor: colors.bodyText,
          textAlign: TextAlign.center,
        ),
        if (onAction != null && actionLabel != null) ...[
          const SizedBox(height: 18),
          Center(
            child: OutlinedButton.icon(
              onPressed: onAction,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(actionLabel!),
            ),
          ),
        ],
      ],
    );
  }
}

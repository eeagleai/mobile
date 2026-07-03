import 'package:eeagle_ai/src/domain/model/analytics_event.dart' as domain;
import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/domain/entities/live_conversation_summary.dart';
import 'package:eeagle_ai/src/presentation/analytics/bloc/analytics_bloc.dart';
import 'package:eeagle_ai/src/presentation/live_conversation/live_conversation_screen.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes_constants.dart';
import 'package:eeagle_ai/src/presentation/analytics/widgets/analytics_conversation_card.dart';
import 'package:eeagle_ai/src/presentation/analytics/widgets/analytics_event_card.dart';
import 'package:eeagle_ai/src/presentation/analytics/widgets/analytics_header_card.dart';
import 'package:eeagle_ai/src/presentation/analytics/widgets/analytics_stat_card.dart';
import 'package:eeagle_ai/src/core/util/analytics_time_format.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_app_loader.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_screen_background.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsScreenArgs {
  const AnalyticsScreenArgs({
    required this.siteApiKey,
    required this.siteName,
    required this.host,
  });

  final String siteApiKey;
  final String siteName;
  final String host;
}

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key, required this.args});

  final AnalyticsScreenArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          di<AnalyticsBloc>()..add(AnalyticsEvent.started(args.siteApiKey)),
      child: _AnalyticsView(args: args),
    );
  }
}

class _AnalyticsView extends StatelessWidget {
  const _AnalyticsView({required this.args});

  final AnalyticsScreenArgs args;

  void _onConversationTap(
    BuildContext context,
    LiveConversationSummary conversation,
  ) {
    context.read<AnalyticsBloc>().add(
          AnalyticsEvent.conversationOpened(conversation.conversationId),
        );

    final location = [conversation.city, conversation.country]
        .where((part) => part != null && part.isNotEmpty)
        .join(', ');

    Navigator.of(context).pushNamed(
      RoutesConstants.liveConversation,
      arguments: LiveConversationScreenArgs(
        siteApiKey: args.siteApiKey,
        conversationId: conversation.conversationId,
        pageUrl: conversation.pageUrl,
        visitorLocation: location.isEmpty ? null : location,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const EeagleScreenBackground(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                  child: Row(
                    children: [
                      IconButton(
                        tooltip: 'Back',
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: colors.titleNatural,
                        ),
                      ),
                      Expanded(
                        child: EeagleText(
                          'Analytics',
                          style: EeagleTextStyles.headlineSmall,
                          textColor: colors.titleNatural,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<AnalyticsBloc, AnalyticsState>(
                    builder: (context, state) => _buildBody(context, state),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, AnalyticsState state) {
    final isInitialLoading = state.isLoadingStats &&
        state.stats == null &&
        state.conversations.isEmpty &&
        state.events.isEmpty;

    if (isInitialLoading) {
      return const EeagleAppLoadingView();
    }

    if (state.errorMessage != null &&
        state.stats == null &&
        state.conversations.isEmpty &&
        state.events.isEmpty) {
      return _ErrorView(
        message: state.errorMessage!,
        onRetry: () => context
            .read<AnalyticsBloc>()
            .add(const AnalyticsEvent.refreshRequested()),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<AnalyticsBloc>()
            .add(const AnalyticsEvent.refreshRequested());
        await context.read<AnalyticsBloc>().stream.firstWhere(
              (next) => !next.isLoadingStats && !next.isLoadingEvents,
            );
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            sliver: SliverToBoxAdapter(
              child: _TopSection(args: args, state: state),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            sliver: SliverToBoxAdapter(
              child: _AnalyticsTabBar(
                selectedTab: state.selectedTab,
                onTabSelected: (tab) => context
                    .read<AnalyticsBloc>()
                    .add(AnalyticsEvent.tabChanged(tab)),
              ),
            ),
          ),
          if (state.selectedTab == AnalyticsTab.chats)
            _ChatsList(
              conversations: state.conversations,
              isLoading: state.isLoadingEvents,
              onTap: (conversation) =>
                  _onConversationTap(context, conversation),
            )
          else
            _EventsList(
              events: state.events,
              isLoading: state.isLoadingEvents,
            ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
        ],
      ),
    );
  }
}

class _AnalyticsTabBar extends StatelessWidget {
  const _AnalyticsTabBar({
    required this.selectedTab,
    required this.onTabSelected,
  });

  final AnalyticsTab selectedTab;
  final ValueChanged<AnalyticsTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colors.inputSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.chipBorder, width: 0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              label: 'Chats',
              isSelected: selectedTab == AnalyticsTab.chats,
              onTap: () => onTabSelected(AnalyticsTab.chats),
            ),
          ),
          Expanded(
            child: _TabButton(
              label: 'Events',
              isSelected: selectedTab == AnalyticsTab.events,
              onTap: () => onTabSelected(AnalyticsTab.events),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final accent = colors.palette.primary.shade400;

    return Material(
      color: isSelected ? accent.withValues(alpha: 0.15) : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: EeagleText(
              label,
              style: EeagleTextStyles.bodyMedium,
              textColor: isSelected ? colors.titleNatural : colors.bodyText,
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatsList extends StatelessWidget {
  const _ChatsList({
    required this.conversations,
    required this.isLoading,
    required this.onTap,
  });

  final List<LiveConversationSummary> conversations;
  final bool isLoading;
  final ValueChanged<LiveConversationSummary> onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    if (conversations.isEmpty && !isLoading) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: EeagleText(
              'No chats yet.',
              style: EeagleTextStyles.bodyLarge,
              textColor: colors.bodyText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      sliver: SliverList.separated(
        itemCount: conversations.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final conversation = conversations[index];
          return AnalyticsConversationCard(
            conversation: conversation,
            onTap: () => onTap(conversation),
          );
        },
      ),
    );
  }
}

class _EventsList extends StatelessWidget {
  const _EventsList({
    required this.events,
    required this.isLoading,
  });

  final List<domain.AnalyticsEvent> events;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    if (events.isEmpty && !isLoading) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: EeagleText(
              'No events yet.',
              style: EeagleTextStyles.bodyLarge,
              textColor: colors.bodyText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      sliver: SliverList.separated(
        itemCount: events.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return AnalyticsEventCard(event: events[index]);
        },
      ),
    );
  }
}

class _TopSection extends StatelessWidget {
  const _TopSection({required this.args, required this.state});

  final AnalyticsScreenArgs args;
  final AnalyticsState state;

  @override
  Widget build(BuildContext context) {
    final stats = state.stats;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnalyticsHeaderCard(
          siteName: args.siteName,
          host: args.host,
          status: state.status,
          lastEventAt: stats?.lastEventAt,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: AnalyticsStatCard(
                label: 'Total Events',
                value: '${stats?.totalEvents ?? 0}',
                icon: Icons.bolt_rounded,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AnalyticsStatCard(
                label: 'Unique Visitors',
                value: '${stats?.uniqueVisitors ?? 0}',
                icon: Icons.people_alt_rounded,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: AnalyticsStatCard(
                label: 'Unique Sessions',
                value: '${stats?.uniqueSessions ?? 0}',
                icon: Icons.devices_rounded,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AnalyticsStatCard(
                label: 'Last Event',
                value: AnalyticsTimeFormat.relative(stats?.lastEventAt),
                icon: Icons.schedule_rounded,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EeagleText(
              message,
              style: EeagleTextStyles.bodyLarge,
              textColor: colors.bodyText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: onRetry,
              child: EeagleText(
                'Try again',
                style: EeagleTextStyles.bodyMedium,
                textColor: colors.titleNatural,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

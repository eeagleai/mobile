import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart' as domain;
import 'package:eeagle_ai/src/presentation/analytics/bloc/analytics_bloc.dart';
import 'package:eeagle_ai/src/presentation/live_conversation/live_conversation_screen.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes_constants.dart';
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

/// Arguments for [AnalyticsScreen], passed via the named route.
///
/// `accessToken` is intentionally not threaded here: the shared Dio
/// `AuthInterceptor` already attaches the bearer token to every request.
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

  void _onEventTap(BuildContext context, domain.AnalyticsEvent event) {
    final colors = EeagleTheme.of(context).colors;
    final conversationId = event.conversationId;

    if (conversationId == null || conversationId.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: EeagleText(
              'Chat is not available for this event yet. '
              'The visitor needs to open live chat first.',
              style: EeagleTextStyles.bodyMedium,
              textColor: colors.titleNatural,
            ),
          ),
        );
      return;
    }

    context
        .read<AnalyticsBloc>()
        .add(AnalyticsEvent.conversationOpened(conversationId));

    final location = [event.city, event.country]
        .where((part) => part != null && part.isNotEmpty)
        .join(', ');

    Navigator.of(context).pushNamed(
      RoutesConstants.liveConversation,
      arguments: LiveConversationScreenArgs(
        siteApiKey: args.siteApiKey,
        conversationId: conversationId,
        pageUrl: event.pageUrl,
        visitorLocation: location.isEmpty ? null : location,
        createdAt: event.createdAt,
        seedMessage:
            event.eventType == 'live_visitor_message' ? event.message : null,
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
        state.events.isEmpty;

    if (isInitialLoading) {
      return const EeagleAppLoadingView();
    }

    if (state.errorMessage != null &&
        state.stats == null &&
        state.events.isEmpty) {
      return _ErrorView(
        message: state.errorMessage!,
        onRetry: () =>
            context.read<AnalyticsBloc>().add(const AnalyticsEvent.refreshRequested()),
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
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: state.events.length + 1,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _TopSection(args: args, state: state);
          }
          final event = state.events[index - 1];
          final conversationId = event.conversationId;
          return AnalyticsEventCard(
            event: event,
            hasUnread: conversationId != null &&
                state.unreadConversationIds.contains(conversationId),
            onTap: () => _onEventTap(context, event),
          );
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
    final colors = EeagleTheme.of(context).colors;
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
        const SizedBox(height: 20),
        EeagleText(
          'Recent events',
          style: EeagleTextStyles.titleMedium,
          textColor: colors.titleNatural,
        ),
        const SizedBox(height: 12),
        if (state.events.isEmpty && !state.isLoadingEvents)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: EeagleText(
                'No events yet.',
                style: EeagleTextStyles.bodyLarge,
                textColor: colors.bodyText,
                textAlign: TextAlign.center,
              ),
            ),
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

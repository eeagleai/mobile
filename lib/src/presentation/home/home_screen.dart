import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/analytics/analytics_screen.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/home_analytics_bloc.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/home_bloc.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/sites_bloc.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/create_website_bloc.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/create_website_dialog.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/home_logout_button.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/home_site_list_tile.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/home_site_list_tile_shimmer.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/home_site_preview_sheet.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes_constants.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_screen_background.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_primary_button.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_colors.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di<HomeBloc>()),
        BlocProvider(
          create: (_) => di<SitesBloc>()..add(const SitesEvent.started()),
        ),
        BlocProvider(create: (_) => di<HomeAnalyticsBloc>()),
      ],
      child: const _HomeSitesView(),
    );
  }
}

class _HomeSitesView extends StatefulWidget {
  const _HomeSitesView();

  @override
  State<_HomeSitesView> createState() => _HomeSitesViewState();
}

class _HomeSitesViewState extends State<_HomeSitesView>
    with WidgetsBindingObserver {
  bool _didOfferWebsiteCreation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<HomeAnalyticsBloc>().add(
        const HomeAnalyticsEvent.appResumed(),
      );
    }
  }

  void _openSiteChat(BuildContext context, Site site) {
    Navigator.of(context).pushNamed(RoutesConstants.llmChat, arguments: site);
  }

  void _previewSite(BuildContext context, Site site) {
    showHomeSitePreviewSheet(context, site: site);
  }

  Future<void> _showCreateWebsite(BuildContext context) async {
    final created = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => BlocProvider(
        create: (_) => di<CreateWebsiteBloc>(),
        child: const CreateWebsiteDialog(),
      ),
    );
    if (created == true && context.mounted) {
      context.read<SitesBloc>().add(const SitesEvent.refreshRequested());
    }
  }

  Future<void> _openAnalytics(BuildContext context, Site site) async {
    final analyticsBloc = context.read<HomeAnalyticsBloc>();
    analyticsBloc.add(HomeAnalyticsEvent.chatUnreadCleared(site.apikey));
    await Navigator.of(context).pushNamed(
      RoutesConstants.analytics,
      arguments: AnalyticsScreenArgs(
        siteApiKey: site.apikey,
        siteName: site.name,
        host: site.host,
      ),
    );
    // Returning from the analytics screen: refetch this site's stats so the
    // card reflects anything that changed while it was open.
    analyticsBloc.add(HomeAnalyticsEvent.siteRefreshRequested(site.apikey));
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listenWhen: (previous, current) =>
              previous.logoutSucceeded != current.logoutSucceeded ||
              (previous.errorMessage != current.errorMessage &&
                  current.errorMessage != null),
          listener: (context, state) {
            if (state.logoutSucceeded) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RoutesConstants.login,
                (route) => false,
              );
              return;
            }

            final errorMessage = state.errorMessage;
            if (errorMessage != null) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(errorMessage)));
            }
          },
        ),
        BlocListener<SitesBloc, SitesState>(
          listenWhen: (previous, current) =>
              previous.sites != current.sites ||
              previous.isLoading != current.isLoading ||
              previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            context.read<HomeAnalyticsBloc>().add(
              HomeAnalyticsEvent.sitesUpdated(state.sites),
            );
            if (!_didOfferWebsiteCreation &&
                !state.isLoading &&
                state.errorMessage == null &&
                state.sites.isEmpty) {
              _didOfferWebsiteCreation = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) _showCreateWebsite(context);
              });
            }
          },
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const EeagleScreenBackground(),
            SafeArea(
              child: BlocBuilder<SitesBloc, SitesState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: EeagleText(
                                'Your websites',
                                style: EeagleTextStyles.headlineLarge,
                                textColor: colors.titleNatural,
                              ),
                            ),
                            if (state.sites.isNotEmpty) ...[
                              IconButton(
                                tooltip: 'Create website',
                                onPressed: () => _showCreateWebsite(context),
                                icon: const Icon(Icons.add),
                                color: colors.titleNatural,
                              ),
                              const SizedBox(width: 4),
                            ],
                            BlocBuilder<HomeBloc, HomeState>(
                              buildWhen: (previous, current) =>
                                  previous.isLoggingOut != current.isLoggingOut,
                              builder: (context, homeState) {
                                return HomeLogoutButton(
                                  isLoading: homeState.isLoggingOut,
                                  onTap: () => context.read<HomeBloc>().add(
                                    const HomeEvent.logoutRequested(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: _buildBody(context, state, colors)),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    SitesState state,
    EeagleColors colors,
  ) {
    if (state.isLoading && state.sites.isEmpty) {
      return const HomeSitesShimmerList();
    }

    if (state.errorMessage != null && state.sites.isEmpty) {
      return _ErrorView(
        message: state.errorMessage!,
        onRetry: () =>
            context.read<SitesBloc>().add(const SitesEvent.refreshRequested()),
      );
    }

    if (state.sites.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EeagleText(
                'Your first website starts with an idea.',
                style: EeagleTextStyles.bodyLarge,
                textColor: colors.bodyText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 240,
                child: EeaglePrimaryButton(
                  label: 'Create My Website',
                  onTap: () => _showCreateWebsite(context),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<SitesBloc>().add(const SitesEvent.refreshRequested());
        context.read<HomeAnalyticsBloc>().add(
          const HomeAnalyticsEvent.refreshRequested(),
        );
        await context.read<SitesBloc>().stream.firstWhere(
          (next) => !next.isRefreshing,
        );
      },
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: state.sites.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final site = state.sites[index];
          return HomeSiteListTile(
            site: site,
            onTap: () => _openSiteChat(context, site),
            onPreviewTap: () => _previewSite(context, site),
            onAnalyticsTap: () => _openAnalytics(context, site),
          );
        },
      ),
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

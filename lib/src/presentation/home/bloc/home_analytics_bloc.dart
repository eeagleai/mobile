import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:eeagle_ai/src/data/service/analytics_socket_service.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stats.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/use_case/acquire_site_analytics_socket_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_stats_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/has_open_site_analytics_socket_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/ingest_analytics_socket_frame_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/reconnect_site_analytics_socket_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/release_site_analytics_socket_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_site_analytics_socket_use_case.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/site_analytics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:eeagle_ai/src/presentation/home/bloc/site_analytics_state.dart';

part 'home_analytics_event.dart';
part 'home_analytics_state.dart';
part 'home_analytics_bloc.freezed.dart';

/// Global per-site socket owner at the Home/app shell level.
///
/// Acquires shared sockets, ingests all frames into local chat storage and the
/// analytics events cache, and keeps connection status + unread counts.
class HomeAnalyticsBloc extends Bloc<HomeAnalyticsEvent, HomeAnalyticsState> {
  HomeAnalyticsBloc(
    this._getAnalyticsStatsUseCase,
    this._acquireSiteAnalyticsSocketUseCase,
    this._reconnectSiteAnalyticsSocketUseCase,
    this._releaseSiteAnalyticsSocketUseCase,
    this._watchSiteAnalyticsSocketUseCase,
    this._hasOpenSiteAnalyticsSocketUseCase,
    this._ingestAnalyticsSocketFrameUseCase,
  ) : super(const HomeAnalyticsState()) {
    on<_SitesUpdated>(_onSitesUpdated);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_SiteRefreshRequested>(_onSiteRefreshRequested);
    on<_StatsRequested>(_onStatsRequested, transformer: concurrent());
    on<_ConnectSocketRequested>(
      _onConnectSocketRequested,
      transformer: concurrent(),
    );
    on<_SocketMessageReceived>(_onSocketMessageReceived);
    on<_AppResumed>(_onAppResumed);
    on<_ChatUnreadCleared>(_onChatUnreadCleared);
  }

  final GetAnalyticsStatsUseCase _getAnalyticsStatsUseCase;
  final AcquireSiteAnalyticsSocketUseCase _acquireSiteAnalyticsSocketUseCase;
  final ReconnectSiteAnalyticsSocketUseCase _reconnectSiteAnalyticsSocketUseCase;
  final ReleaseSiteAnalyticsSocketUseCase _releaseSiteAnalyticsSocketUseCase;
  final WatchSiteAnalyticsSocketUseCase _watchSiteAnalyticsSocketUseCase;
  final HasOpenSiteAnalyticsSocketUseCase _hasOpenSiteAnalyticsSocketUseCase;
  final IngestAnalyticsSocketFrameUseCase _ingestAnalyticsSocketFrameUseCase;

  static const Duration _statsThrottle = Duration(seconds: 3);

  final Set<String> _trackedApikeys = {};
  final Map<String, StreamSubscription<AnalyticsSocketMessage>> _socketSubs = {};
  final Map<String, Timer> _throttleTimers = {};
  final Map<String, Timer> _reconnectTimers = {};
  final Map<String, int> _reconnectAttempts = {};

  void _onSitesUpdated(_SitesUpdated event, Emitter<HomeAnalyticsState> emit) {
    final newKeys = event.sites.map((site) => site.apikey).toSet();

    for (final apikey in _trackedApikeys.toList()) {
      if (!newKeys.contains(apikey)) {
        _disposeSite(apikey);
      }
    }

    final next = <String, SiteAnalyticsState>{};
    for (final site in event.sites) {
      next[site.apikey] = state.analytics[site.apikey] ??
          const SiteAnalyticsState(isLoading: true);
    }
    emit(state.copyWith(analytics: next));

    for (final site in event.sites) {
      if (!_trackedApikeys.contains(site.apikey)) {
        _trackedApikeys.add(site.apikey);
        _bindSocketStream(site.apikey);
        add(HomeAnalyticsEvent.statsRequested(site.apikey));
        add(HomeAnalyticsEvent.connectSocketRequested(site.apikey));
      }
    }
  }

  void _onRefreshRequested(
    _RefreshRequested event,
    Emitter<HomeAnalyticsState> emit,
  ) {
    for (final apikey in state.analytics.keys) {
      add(HomeAnalyticsEvent.statsRequested(apikey));
    }
  }

  void _onSiteRefreshRequested(
    _SiteRefreshRequested event,
    Emitter<HomeAnalyticsState> emit,
  ) {
    add(HomeAnalyticsEvent.statsRequested(event.apikey));
  }

  Future<void> _onStatsRequested(
    _StatsRequested event,
    Emitter<HomeAnalyticsState> emit,
  ) async {
    final apikey = event.apikey;
    _updateSite(emit, apikey, isLoading: true, hasError: false);

    final result = await _getAnalyticsStatsUseCase(apikey).run();
    if (isClosed) {
      return;
    }

    result.match(
      (_) => _updateSite(emit, apikey, isLoading: false, hasError: true),
      (stats) => _updateSite(
        emit,
        apikey,
        stats: stats,
        isLoading: false,
        hasError: false,
      ),
    );
  }

  Future<void> _onConnectSocketRequested(
    _ConnectSocketRequested event,
    Emitter<HomeAnalyticsState> emit,
  ) async {
    final apikey = event.apikey;
    if (!_trackedApikeys.contains(apikey)) {
      return;
    }

    if (event.isReconnect) {
      _updateSite(emit, apikey, status: AnalyticsConnectionStatus.reconnecting);
      final result = await _reconnectSiteAnalyticsSocketUseCase(apikey).run();
      if (isClosed) {
        return;
      }
      result.match(
        (_) => _scheduleReconnect(apikey),
        (_) => _markLiveIfConnected(emit, apikey),
      );
      return;
    }

    final result = await _acquireSiteAnalyticsSocketUseCase(apikey).run();
    if (isClosed) {
      return;
    }
    result.match(
      (_) => _scheduleReconnect(apikey),
      (_) => _markLiveIfConnected(emit, apikey),
    );
  }

  Future<void> _onSocketMessageReceived(
    _SocketMessageReceived event,
    Emitter<HomeAnalyticsState> emit,
  ) async {
    final apikey = event.apikey;
    switch (event.message) {
      case AnalyticsSocketReady():
        _reconnectAttempts[apikey] = 0;
        _updateSite(emit, apikey, status: AnalyticsConnectionStatus.live);
      case AnalyticsSocketConnectionLost():
        _updateSite(emit, apikey, status: AnalyticsConnectionStatus.reconnecting);
        _scheduleReconnect(apikey);
      case AnalyticsSocketPong():
        break;
      default:
        final ingestResult = await _ingestAnalyticsSocketFrameUseCase(
          siteApiKey: apikey,
          message: event.message,
        );
        if (ingestResult.analyticsEventReceived) {
          _scheduleStatsThrottle(apikey);
        }
        if (ingestResult.visitorMessageReceived) {
          final current = state.forApikey(apikey);
          _updateSite(
            emit,
            apikey,
            unreadChatCount: current.unreadChatCount + 1,
          );
        }
    }
  }

  Future<void> _onAppResumed(
    _AppResumed event,
    Emitter<HomeAnalyticsState> emit,
  ) async {
    for (final apikey in _trackedApikeys) {
      if (_hasOpenSiteAnalyticsSocketUseCase(apikey)) {
        _updateSite(emit, apikey, status: AnalyticsConnectionStatus.live);
        continue;
      }
      add(HomeAnalyticsEvent.connectSocketRequested(apikey, isReconnect: true));
    }
  }

  void _onChatUnreadCleared(
    _ChatUnreadCleared event,
    Emitter<HomeAnalyticsState> emit,
  ) {
    _updateSite(emit, event.apikey, unreadChatCount: 0);
  }

  void _bindSocketStream(String apikey) {
    unawaited(_socketSubs[apikey]?.cancel());
    _socketSubs[apikey] = _watchSiteAnalyticsSocketUseCase(apikey).listen(
      (message) {
        if (!isClosed) {
          add(HomeAnalyticsEvent.socketMessageReceived(apikey, message));
        }
      },
    );
  }

  void _markLiveIfConnected(Emitter<HomeAnalyticsState> emit, String apikey) {
    if (_hasOpenSiteAnalyticsSocketUseCase(apikey)) {
      _updateSite(emit, apikey, status: AnalyticsConnectionStatus.live);
    }
  }

  void _scheduleStatsThrottle(String apikey) {
    if (_throttleTimers[apikey]?.isActive ?? false) {
      return;
    }
    _throttleTimers[apikey] = Timer(_statsThrottle, () {
      _throttleTimers.remove(apikey);
      if (!isClosed) {
        add(HomeAnalyticsEvent.statsRequested(apikey));
      }
    });
  }

  void _scheduleReconnect(String apikey) {
    _reconnectTimers[apikey]?.cancel();
    final attempts = (_reconnectAttempts[apikey] ?? 0) + 1;
    _reconnectAttempts[apikey] = attempts;
    final delay = Duration(seconds: (attempts * 2).clamp(2, 30));
    _reconnectTimers[apikey] = Timer(delay, () {
      if (!isClosed) {
        add(HomeAnalyticsEvent.connectSocketRequested(apikey, isReconnect: true));
      }
    });
  }

  void _updateSite(
    Emitter<HomeAnalyticsState> emit,
    String apikey, {
    AnalyticsStats? stats,
    bool? isLoading,
    bool? hasError,
    AnalyticsConnectionStatus? status,
    int? unreadChatCount,
  }) {
    final current = state.forApikey(apikey);
    final updated = SiteAnalyticsState(
      stats: stats ?? current.stats,
      isLoading: isLoading ?? current.isLoading,
      hasError: hasError ?? current.hasError,
      status: status ?? current.status,
      unreadChatCount: unreadChatCount ?? current.unreadChatCount,
    );
    emit(
      state.copyWith(
        analytics: {...state.analytics, apikey: updated},
      ),
    );
  }

  void _disposeSite(String apikey) {
    _trackedApikeys.remove(apikey);
    _throttleTimers.remove(apikey)?.cancel();
    _reconnectTimers.remove(apikey)?.cancel();
    _reconnectAttempts.remove(apikey);
    unawaited(_socketSubs.remove(apikey)?.cancel());
    _releaseSiteAnalyticsSocketUseCase(apikey);
  }

  @override
  Future<void> close() {
    for (final timer in _throttleTimers.values) {
      timer.cancel();
    }
    for (final timer in _reconnectTimers.values) {
      timer.cancel();
    }
    for (final sub in _socketSubs.values) {
      unawaited(sub.cancel());
    }
    for (final apikey in _trackedApikeys.toList()) {
      _releaseSiteAnalyticsSocketUseCase(apikey);
    }
    _throttleTimers.clear();
    _reconnectTimers.clear();
    _socketSubs.clear();
    _trackedApikeys.clear();
    return super.close();
  }
}

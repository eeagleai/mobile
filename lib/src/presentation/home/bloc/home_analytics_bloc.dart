import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:eeagle_ai/src/data/service/analytics_socket_service.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stats.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_stats_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_stream_token_use_case.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/site_analytics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:eeagle_ai/src/presentation/home/bloc/site_analytics_state.dart';

part 'home_analytics_event.dart';
part 'home_analytics_state.dart';
part 'home_analytics_bloc.freezed.dart';

/// Drives the live analytics numbers shown on each home card.
///
/// For every site it: fetches `/stats` (the source of truth), opens a live
/// WebSocket, and — when events arrive — refetches `/stats` at most once every
/// few seconds (throttle). Sockets/timers are torn down in [close].
class HomeAnalyticsBloc extends Bloc<HomeAnalyticsEvent, HomeAnalyticsState> {
  HomeAnalyticsBloc(
    this._getAnalyticsStatsUseCase,
    this._getAnalyticsStreamTokenUseCase,
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
  }

  final GetAnalyticsStatsUseCase _getAnalyticsStatsUseCase;
  final GetAnalyticsStreamTokenUseCase _getAnalyticsStreamTokenUseCase;

  /// At most one `/stats` refetch per site per throttle window.
  static const Duration _statsThrottle = Duration(seconds: 3);

  final Map<String, AnalyticsSocketService> _sockets = {};
  final Map<String, StreamSubscription<AnalyticsSocketMessage>> _socketSubs = {};
  final Map<String, Timer> _throttleTimers = {};
  final Map<String, Timer> _reconnectTimers = {};
  final Map<String, int> _reconnectAttempts = {};

  void _onSitesUpdated(_SitesUpdated event, Emitter<HomeAnalyticsState> emit) {
    final newKeys = event.sites.map((site) => site.apikey).toSet();

    // Drop sites that are no longer present.
    for (final apikey in _sockets.keys.toList()) {
      if (!newKeys.contains(apikey)) {
        _disposeSite(apikey);
      }
    }

    // Preserve known sub-states; show a loading placeholder for new sites.
    final next = <String, SiteAnalyticsState>{};
    for (final site in event.sites) {
      next[site.apikey] = state.analytics[site.apikey] ??
          const SiteAnalyticsState(isLoading: true);
    }
    emit(state.copyWith(analytics: next));

    // Kick off stats + socket for newly seen sites only.
    for (final site in event.sites) {
      if (!_sockets.containsKey(site.apikey)) {
        _setupSocket(site.apikey);
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
    final service = _sockets[apikey];
    if (service == null) {
      return;
    }

    if (event.isReconnect) {
      _updateSite(emit, apikey, status: AnalyticsConnectionStatus.reconnecting);
    }

    final result = await _getAnalyticsStreamTokenUseCase(apikey).run();
    if (isClosed || !_sockets.containsKey(apikey)) {
      return;
    }

    result.match(
      (_) => _scheduleReconnect(apikey),
      (info) => service.connect(info),
    );
  }

  void _onSocketMessageReceived(
    _SocketMessageReceived event,
    Emitter<HomeAnalyticsState> emit,
  ) {
    final apikey = event.apikey;
    switch (event.message) {
      case AnalyticsSocketReady():
        _reconnectAttempts[apikey] = 0;
        _updateSite(emit, apikey, status: AnalyticsConnectionStatus.live);
      case AnalyticsSocketEvent():
        _scheduleStatsThrottle(apikey);
      case AnalyticsSocketPong():
        break;
      case AnalyticsSocketConnectionLost():
        _updateSite(emit, apikey, status: AnalyticsConnectionStatus.offline);
        _scheduleReconnect(apikey);
      // Live-assist chat frames don't affect the home cards.
      case AnalyticsSocketLiveAssistEvent():
      case AnalyticsSocketVisitorMessage():
      case AnalyticsSocketOwnerMessage():
        break;
    }
  }

  void _setupSocket(String apikey) {
    final service = AnalyticsSocketService();
    _sockets[apikey] = service;
    _socketSubs[apikey] = service.messages.listen((message) {
      if (!isClosed) {
        add(HomeAnalyticsEvent.socketMessageReceived(apikey, message));
      }
    });
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

  /// Merges partial updates for [apikey] into the map, reading the latest
  /// [state] so concurrent handlers don't clobber each other.
  void _updateSite(
    Emitter<HomeAnalyticsState> emit,
    String apikey, {
    AnalyticsStats? stats,
    bool? isLoading,
    bool? hasError,
    AnalyticsConnectionStatus? status,
  }) {
    final current = state.forApikey(apikey);
    final updated = SiteAnalyticsState(
      stats: stats ?? current.stats,
      isLoading: isLoading ?? current.isLoading,
      hasError: hasError ?? current.hasError,
      status: status ?? current.status,
    );
    emit(
      state.copyWith(
        analytics: {...state.analytics, apikey: updated},
      ),
    );
  }

  void _disposeSite(String apikey) {
    _throttleTimers.remove(apikey)?.cancel();
    _reconnectTimers.remove(apikey)?.cancel();
    _reconnectAttempts.remove(apikey);
    unawaited(_socketSubs.remove(apikey)?.cancel());
    _sockets.remove(apikey)?.dispose();
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
    for (final socket in _sockets.values) {
      socket.dispose();
    }
    _throttleTimers.clear();
    _reconnectTimers.clear();
    _socketSubs.clear();
    _sockets.clear();
    return super.close();
  }
}

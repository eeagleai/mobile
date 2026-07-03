import 'dart:async';

import 'package:eeagle_ai/src/domain/entities/live_conversation_summary.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart' as domain;
import 'package:eeagle_ai/src/domain/model/analytics_stats.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_events_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_stats_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/mark_conversation_read_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_site_analytics_events_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_site_conversations_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_socket_connection_status_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';
part 'analytics_bloc.freezed.dart';

/// Read-only analytics screen: stats, Chats inbox, and Events timeline.
///
/// Does not own or connect the analytics socket. Data comes from REST, the
/// shared local chat store, and the in-memory analytics events cache updated
/// by [HomeAnalyticsBloc].
class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc(
    this._getAnalyticsStatsUseCase,
    this._getAnalyticsEventsUseCase,
    this._watchSiteConversationsUseCase,
    this._watchSiteAnalyticsEventsUseCase,
    this._watchSocketConnectionStatusUseCase,
    this._markConversationReadUseCase,
  ) : super(const AnalyticsState()) {
    on<_Started>(_onStarted);
    on<_TabChanged>(_onTabChanged);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_StatsRequested>(_onStatsRequested);
    on<_ConversationsUpdated>(_onConversationsUpdated);
    on<_EventsUpdated>(_onEventsUpdated);
    on<_ConnectionStatusUpdated>(_onConnectionStatusUpdated);
    on<_ConversationOpened>(_onConversationOpened);
  }

  final GetAnalyticsStatsUseCase _getAnalyticsStatsUseCase;
  final GetAnalyticsEventsUseCase _getAnalyticsEventsUseCase;
  final WatchSiteConversationsUseCase _watchSiteConversationsUseCase;
  final WatchSiteAnalyticsEventsUseCase _watchSiteAnalyticsEventsUseCase;
  final WatchSocketConnectionStatusUseCase _watchSocketConnectionStatusUseCase;
  final MarkConversationReadUseCase _markConversationReadUseCase;

  static const Duration _statsThrottle = Duration(seconds: 3);

  String? _apikey;
  StreamSubscription<List<LiveConversationSummary>>? _conversationsSub;
  StreamSubscription<List<domain.AnalyticsEvent>>? _eventsSub;
  Timer? _statusTimer;
  Timer? _throttleTimer;

  Future<void> _onStarted(_Started event, Emitter<AnalyticsState> emit) async {
    _apikey = event.apikey;

    await _conversationsSub?.cancel();
    await _eventsSub?.cancel();
    _statusTimer?.cancel();

    _conversationsSub =
        _watchSiteConversationsUseCase(event.apikey).listen((conversations) {
      if (!isClosed) {
        add(AnalyticsEvent.conversationsUpdated(conversations));
      }
    });

    _eventsSub = _watchSiteAnalyticsEventsUseCase(event.apikey).listen((events) {
      if (!isClosed) {
        add(AnalyticsEvent.eventsUpdated(events));
      }
    });

    _pollConnectionStatus();
    _statusTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      _pollConnectionStatus();
    });

    await _loadStatsAndEvents(emit);
  }

  void _pollConnectionStatus() {
    final apikey = _apikey;
    if (apikey == null || isClosed) {
      return;
    }
    add(
      AnalyticsEvent.connectionStatusUpdated(
        _watchSocketConnectionStatusUseCase(apikey),
      ),
    );
  }

  void _onTabChanged(_TabChanged event, Emitter<AnalyticsState> emit) {
    emit(state.copyWith(selectedTab: event.tab));
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<AnalyticsState> emit,
  ) async {
    await _loadStatsAndEvents(emit);
  }

  Future<void> _loadStatsAndEvents(Emitter<AnalyticsState> emit) async {
    final apikey = _apikey;
    if (apikey == null) {
      return;
    }

    emit(
      state.copyWith(
        isLoadingStats: true,
        isLoadingEvents: true,
        errorMessage: null,
      ),
    );

    final statsResult = await _getAnalyticsStatsUseCase(apikey).run();
    final eventsResult =
        await _getAnalyticsEventsUseCase(apikey, limit: 100).run();
    if (isClosed) {
      return;
    }

    String? error;

    statsResult.match(
      (failure) => error = failure.message,
      (stats) => emit(state.copyWith(stats: stats, isLoadingStats: false)),
    );

    await eventsResult.match(
      (failure) async {
        error ??= failure.message;
      },
      (events) async {
        await _watchSiteAnalyticsEventsUseCase.seedFromRest(apikey, events);
      },
    );

    emit(
      state.copyWith(
        isLoadingStats: false,
        isLoadingEvents: false,
        errorMessage:
            (state.stats == null && state.events.isEmpty) ? error : null,
      ),
    );
  }

  Future<void> _onStatsRequested(
    _StatsRequested event,
    Emitter<AnalyticsState> emit,
  ) async {
    final apikey = _apikey;
    if (apikey == null) {
      return;
    }

    final result = await _getAnalyticsStatsUseCase(apikey).run();
    if (isClosed) {
      return;
    }
    result.match(
      (_) {},
      (stats) => emit(state.copyWith(stats: stats)),
    );
  }

  void _onConversationsUpdated(
    _ConversationsUpdated event,
    Emitter<AnalyticsState> emit,
  ) {
    emit(state.copyWith(conversations: event.conversations));
  }

  void _onEventsUpdated(
    _EventsUpdated event,
    Emitter<AnalyticsState> emit,
  ) {
    emit(state.copyWith(events: event.events, isLoadingEvents: false));
  }

  void _onConnectionStatusUpdated(
    _ConnectionStatusUpdated event,
    Emitter<AnalyticsState> emit,
  ) {
    emit(state.copyWith(status: event.status));
  }

  Future<void> _onConversationOpened(
    _ConversationOpened event,
    Emitter<AnalyticsState> emit,
  ) async {
    await _markConversationReadUseCase(event.conversationId);
  }

  void scheduleStatsThrottleFromOutside() {
    if (_throttleTimer?.isActive ?? false) {
      return;
    }
    _throttleTimer = Timer(_statsThrottle, () {
      if (!isClosed) {
        add(const AnalyticsEvent.statsRequested());
      }
    });
  }

  @override
  Future<void> close() {
    _throttleTimer?.cancel();
    _statusTimer?.cancel();
    unawaited(_conversationsSub?.cancel());
    unawaited(_eventsSub?.cancel());
    return super.close();
  }
}

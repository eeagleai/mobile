import 'dart:async';

import 'package:eeagle_ai/src/data/service/analytics_socket_service.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart' as domain;
import 'package:eeagle_ai/src/domain/model/analytics_stats.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_events_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_stats_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_stream_token_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';
part 'analytics_bloc.freezed.dart';

/// Drives a single site's analytics screen: stats cards, the recent/live events
/// list, and the live connection indicator. Owns one [AnalyticsSocketService]
/// and tears it down (with all timers) in [close].
class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc(
    this._getAnalyticsStatsUseCase,
    this._getAnalyticsEventsUseCase,
    this._getAnalyticsStreamTokenUseCase,
  ) : super(const AnalyticsState()) {
    on<_Started>(_onStarted);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_StatsRequested>(_onStatsRequested);
    on<_ConnectSocketRequested>(_onConnectSocketRequested);
    on<_SocketMessageReceived>(_onSocketMessageReceived);
    on<_ConversationOpened>(_onConversationOpened);
  }

  final GetAnalyticsStatsUseCase _getAnalyticsStatsUseCase;
  final GetAnalyticsEventsUseCase _getAnalyticsEventsUseCase;
  final GetAnalyticsStreamTokenUseCase _getAnalyticsStreamTokenUseCase;

  static const Duration _statsThrottle = Duration(seconds: 3);
  static const int _maxEvents = 200;

  String? _apikey;
  final AnalyticsSocketService _socket = AnalyticsSocketService();
  StreamSubscription<AnalyticsSocketMessage>? _socketSub;
  Timer? _throttleTimer;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;

  Future<void> _onStarted(_Started event, Emitter<AnalyticsState> emit) async {
    _apikey = event.apikey;

    _socketSub ??= _socket.messages.listen((message) {
      if (!isClosed) {
        add(AnalyticsEvent.socketMessageReceived(message));
      }
    });

    await _loadStatsAndEvents(emit);
    add(const AnalyticsEvent.connectSocketRequested());
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

    eventsResult.match(
      (failure) => error ??= failure.message,
      (events) => emit(
        state.copyWith(events: _sortNewestFirst(events), isLoadingEvents: false),
      ),
    );

    emit(
      state.copyWith(
        isLoadingStats: false,
        isLoadingEvents: false,
        // Only surface an error when we have nothing to show.
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

  Future<void> _onConnectSocketRequested(
    _ConnectSocketRequested event,
    Emitter<AnalyticsState> emit,
  ) async {
    final apikey = _apikey;
    if (apikey == null) {
      return;
    }

    if (event.isReconnect) {
      emit(state.copyWith(status: AnalyticsConnectionStatus.reconnecting));
    }

    final result = await _getAnalyticsStreamTokenUseCase(apikey).run();
    if (isClosed) {
      return;
    }
    result.match(
      (_) => _scheduleReconnect(),
      (info) => _socket.connect(info),
    );
  }

  void _onSocketMessageReceived(
    _SocketMessageReceived event,
    Emitter<AnalyticsState> emit,
  ) {
    switch (event.message) {
      case AnalyticsSocketReady():
        _reconnectAttempts = 0;
        emit(state.copyWith(status: AnalyticsConnectionStatus.live));
      case AnalyticsSocketEvent(:final event):
        // A plain analytics event may still belong to a conversation (the
        // backend can deliver chat activity as a generic analytics_event); if
        // so collapse it into that conversation's card instead of stacking.
        _ingestEvent(emit, event);
        _scheduleStatsThrottle();
      case AnalyticsSocketLiveAssistEvent(:final event):
        _ingestEvent(emit, event);
      case AnalyticsSocketVisitorMessage(:final event):
        _ingestEvent(emit, event, markUnread: true);
      case AnalyticsSocketOwnerMessage(:final event):
        _ingestEvent(emit, event);
      case AnalyticsSocketPong():
        break;
      case AnalyticsSocketConnectionLost():
        emit(state.copyWith(status: AnalyticsConnectionStatus.reconnecting));
        _scheduleReconnect();
    }
  }

  void _onConversationOpened(
    _ConversationOpened event,
    Emitter<AnalyticsState> emit,
  ) {
    if (!state.unreadConversationIds.contains(event.conversationId)) {
      return;
    }
    emit(
      state.copyWith(
        unreadConversationIds: {...state.unreadConversationIds}
          ..remove(event.conversationId),
      ),
    );
  }

  /// Adds [event] to the list: collapsed into its conversation card when it
  /// carries a `conversation_id`, otherwise prepended as a standalone row.
  /// [markUnread] flags the conversation as having an unread visitor message.
  void _ingestEvent(
    Emitter<AnalyticsState> emit,
    domain.AnalyticsEvent event, {
    bool markUnread = false,
  }) {
    final conversationId = event.conversationId;
    final hasConversation =
        conversationId != null && conversationId.isNotEmpty;

    emit(
      state.copyWith(
        events: hasConversation ? _upsertConversation(event) : _prepend(event),
        unreadConversationIds: (markUnread && hasConversation)
            ? {...state.unreadConversationIds, conversationId}
            : state.unreadConversationIds,
      ),
    );
  }

  /// Prepends [event] to the list, capped at [_maxEvents] (newest first).
  List<domain.AnalyticsEvent> _prepend(domain.AnalyticsEvent event) {
    final updated = [event, ...state.events];
    return updated.length > _maxEvents
        ? updated.sublist(0, _maxEvents)
        : updated;
  }

  /// Collapses live-assist frames into one card per `conversation_id`: if a card
  /// for this conversation already exists it is replaced with [event] and moved
  /// to the top; otherwise [event] is prepended. Falls back to [_prepend] for
  /// events without a conversation id.
  List<domain.AnalyticsEvent> _upsertConversation(domain.AnalyticsEvent event) {
    final conversationId = event.conversationId;
    if (conversationId == null || conversationId.isEmpty) {
      return _prepend(event);
    }

    final rest = [
      for (final existing in state.events)
        if (existing.conversationId != conversationId) existing,
    ];
    final updated = [event, ...rest];
    return updated.length > _maxEvents
        ? updated.sublist(0, _maxEvents)
        : updated;
  }

  List<domain.AnalyticsEvent> _sortNewestFirst(
    List<domain.AnalyticsEvent> events,
  ) {
    final sorted = [...events];
    sorted.sort((a, b) {
      final aTime = a.createdAt;
      final bTime = b.createdAt;
      if (aTime == null && bTime == null) {
        return 0;
      }
      if (aTime == null) {
        return 1;
      }
      if (bTime == null) {
        return -1;
      }
      return bTime.compareTo(aTime);
    });
    return sorted;
  }

  void _scheduleStatsThrottle() {
    if (_throttleTimer?.isActive ?? false) {
      return;
    }
    _throttleTimer = Timer(_statsThrottle, () {
      if (!isClosed) {
        add(const AnalyticsEvent.statsRequested());
      }
    });
  }

  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    _reconnectAttempts += 1;
    final delay = Duration(seconds: (_reconnectAttempts * 2).clamp(2, 30));
    _reconnectTimer = Timer(delay, () {
      if (!isClosed) {
        add(const AnalyticsEvent.connectSocketRequested(isReconnect: true));
      }
    });
  }

  @override
  Future<void> close() {
    _throttleTimer?.cancel();
    _reconnectTimer?.cancel();
    unawaited(_socketSub?.cancel());
    _socket.dispose();
    return super.close();
  }
}

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/domain/entities/live_conversation_summary.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart' as domain;
import 'package:eeagle_ai/src/domain/model/analytics_stats.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_events_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_stats_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/mark_conversation_read_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_site_analytics_events_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_site_conversations_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_socket_connection_status_use_case.dart';
import 'package:eeagle_ai/src/presentation/analytics/bloc/analytics_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetAnalyticsStatsUseCase extends Mock
    implements GetAnalyticsStatsUseCase {}

class _MockGetAnalyticsEventsUseCase extends Mock
    implements GetAnalyticsEventsUseCase {}

class _MockWatchSiteConversationsUseCase extends Mock
    implements WatchSiteConversationsUseCase {}

class _MockWatchSiteAnalyticsEventsUseCase extends Mock
    implements WatchSiteAnalyticsEventsUseCase {}

class _MockWatchSocketConnectionStatusUseCase extends Mock
    implements WatchSocketConnectionStatusUseCase {}

class _MockMarkConversationReadUseCase extends Mock
    implements MarkConversationReadUseCase {}

const _apikey = 'site-key';
const _stats = AnalyticsStats(
  totalEvents: 10,
  uniqueVisitors: 4,
  uniqueSessions: 6,
);

final _conversation = LiveConversationSummary(
  conversationId: 'conv-1',
  siteApiKey: _apikey,
  visitorLabel: 'Amman, Jordan',
  status: LiveConversationStatus.active,
  firstSeenAt: DateTime(2025, 1, 1),
  lastActivityAt: DateTime(2025, 1, 2),
  unreadCount: 2,
);

void main() {
  late _MockGetAnalyticsStatsUseCase getStats;
  late _MockGetAnalyticsEventsUseCase getEvents;
  late _MockWatchSiteConversationsUseCase watchConversations;
  late _MockWatchSiteAnalyticsEventsUseCase watchEvents;
  late _MockWatchSocketConnectionStatusUseCase watchConnectionStatus;
  late _MockMarkConversationReadUseCase markConversationRead;
  late StreamController<List<LiveConversationSummary>> conversationsController;
  late StreamController<List<domain.AnalyticsEvent>> eventsController;
  late AnalyticsBloc bloc;

  setUp(() {
    getStats = _MockGetAnalyticsStatsUseCase();
    getEvents = _MockGetAnalyticsEventsUseCase();
    watchConversations = _MockWatchSiteConversationsUseCase();
    watchEvents = _MockWatchSiteAnalyticsEventsUseCase();
    watchConnectionStatus = _MockWatchSocketConnectionStatusUseCase();
    markConversationRead = _MockMarkConversationReadUseCase();
    conversationsController = StreamController.broadcast();
    eventsController = StreamController.broadcast();

    when(() => watchConversations(_apikey))
        .thenAnswer((_) => conversationsController.stream);
    when(() => watchEvents(_apikey))
        .thenAnswer((_) => eventsController.stream);
    when(() => watchConnectionStatus(_apikey))
        .thenReturn(AnalyticsConnectionStatus.live);
    when(() => markConversationRead(any())).thenAnswer((_) async {});
    when(() => watchEvents.seedFromRest(any(), any())).thenAnswer((_) async {});

    bloc = AnalyticsBloc(
      getStats,
      getEvents,
      watchConversations,
      watchEvents,
      watchConnectionStatus,
      markConversationRead,
    );
  });

  tearDown(() async {
    await conversationsController.close();
    await eventsController.close();
    await bloc.close();
  });

  blocTest<AnalyticsBloc, AnalyticsState>(
    'loads stats on started without owning a socket',
    build: () {
      when(() => getStats(_apikey)).thenReturn(
        TaskEither(() async => right(_stats)),
      );
      when(() => getEvents(_apikey, limit: 100)).thenReturn(
        TaskEither(() async => right(const <domain.AnalyticsEvent>[])),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const AnalyticsEvent.started(_apikey)),
    wait: const Duration(milliseconds: 50),
    verify: (_) {
      verify(() => watchConversations(_apikey)).called(1);
      verify(() => watchEvents(_apikey)).called(1);
      verify(() => getStats(_apikey)).called(1);
      verify(() => getEvents(_apikey, limit: 100)).called(1);
      verify(() => watchConnectionStatus(_apikey)).called(greaterThan(0));
    },
  );

  blocTest<AnalyticsBloc, AnalyticsState>(
    'updates conversations from watch stream',
    build: () {
      when(() => getStats(_apikey)).thenReturn(
        TaskEither(() async => right(_stats)),
      );
      when(() => getEvents(_apikey, limit: 100)).thenReturn(
        TaskEither(() async => right(const <domain.AnalyticsEvent>[])),
      );
      return bloc;
    },
    act: (bloc) async {
      bloc.add(const AnalyticsEvent.started(_apikey));
      await Future<void>.delayed(const Duration(milliseconds: 20));
      conversationsController.add([_conversation]);
    },
    verify: (bloc) {
      expect(bloc.state.conversations, [_conversation]);
      expect(bloc.state.stats, _stats);
    },
  );

  blocTest<AnalyticsBloc, AnalyticsState>(
    'switches selected tab',
    build: () => bloc,
    act: (bloc) => bloc.add(
      const AnalyticsEvent.tabChanged(AnalyticsTab.events),
    ),
    expect: () => [
      const AnalyticsState(selectedTab: AnalyticsTab.events),
    ],
  );

  blocTest<AnalyticsBloc, AnalyticsState>(
    'marks conversation read when opened',
    build: () => bloc,
    act: (bloc) => bloc.add(
      const AnalyticsEvent.conversationOpened('conv-1'),
    ),
    verify: (_) {
      verify(() => markConversationRead('conv-1')).called(1);
    },
  );

  blocTest<AnalyticsBloc, AnalyticsState>(
    'surfaces stats load failure when no cached data',
    build: () {
      when(() => getStats(_apikey)).thenReturn(
        TaskEither(
          () async => left(const OperationFailure('Stats unavailable')),
        ),
      );
      when(() => getEvents(_apikey, limit: 100)).thenReturn(
        TaskEither(
          () async => left(const OperationFailure('Events unavailable')),
        ),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const AnalyticsEvent.started(_apikey)),
    wait: const Duration(milliseconds: 50),
    verify: (bloc) {
      expect(bloc.state.errorMessage, 'Stats unavailable');
      expect(bloc.state.stats, isNull);
    },
  );
}

import 'package:eeagle_ai/src/data/service/analytics_events_cache.dart';
import 'package:eeagle_ai/src/data/service/analytics_socket_service.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_local_repository.dart';
import 'package:eeagle_ai/src/domain/use_case/ingest_analytics_socket_frame_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLiveAssistLocalRepository extends Mock
    implements LiveAssistLocalRepository {}

void main() {
  late _MockLiveAssistLocalRepository localRepository;
  late AnalyticsEventsCache eventsCache;
  late IngestAnalyticsSocketFrameUseCase useCase;

  const siteApiKey = 'site-key';
  final createdAt = DateTime(2025, 1, 1, 12);

  setUpAll(() {
    registerFallbackValue(const AnalyticsEvent());
  });

  setUp(() {
    localRepository = _MockLiveAssistLocalRepository();
    eventsCache = AnalyticsEventsCache();
    useCase = IngestAnalyticsSocketFrameUseCase(localRepository, eventsCache);

    when(
      () => localRepository.ingestSocketEvent(any(), any()),
    ).thenAnswer((_) async {});
  });

  test('routes chat frames to local repository', () async {
    const event = AnalyticsEvent(
      eventType: 'live_visitor_message',
      conversationId: 'conv-1',
      message: 'Hello',
      createdAt: null,
    );

    final result = await useCase(
      siteApiKey: siteApiKey,
      message: const AnalyticsSocketVisitorMessage(event),
    );

    verify(() => localRepository.ingestSocketEvent(siteApiKey, event)).called(1);
    expect(result.visitorMessageReceived, isTrue);
    expect(result.analyticsEventReceived, isFalse);
    expect(eventsCache.snapshot(siteApiKey), isEmpty);
  });

  test('routes non-chat frames to events cache', () async {
    final event = AnalyticsEvent(
      eventType: 'page_view',
      pageUrl: '/home',
      createdAt: createdAt,
    );

    final result = await useCase(
      siteApiKey: siteApiKey,
      message: AnalyticsSocketEvent(event),
    );

    verifyNever(() => localRepository.ingestSocketEvent(any(), any()));
    expect(result.analyticsEventReceived, isTrue);
    expect(eventsCache.snapshot(siteApiKey), [event]);
  });

  test('ignores frames without extractable events', () async {
    final result = await useCase(
      siteApiKey: siteApiKey,
      message: AnalyticsSocketPong(),
    );

    expect(result.visitorMessageReceived, isFalse);
    expect(result.analyticsEventReceived, isFalse);
    verifyNever(() => localRepository.ingestSocketEvent(any(), any()));
  });
}

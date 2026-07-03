import 'package:eeagle_ai/src/data/service/analytics_events_cache.dart';
import 'package:eeagle_ai/src/data/service/analytics_socket_service.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_event_classifier.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_local_repository.dart';

class IngestAnalyticsSocketFrameResult {
  const IngestAnalyticsSocketFrameResult({
    this.visitorMessageReceived = false,
    this.analyticsEventReceived = false,
  });

  final bool visitorMessageReceived;
  final bool analyticsEventReceived;
}

class IngestAnalyticsSocketFrameUseCase {
  IngestAnalyticsSocketFrameUseCase(
    this._localRepository,
    this._eventsCache,
  );

  final LiveAssistLocalRepository _localRepository;
  final AnalyticsEventsCache _eventsCache;

  Future<IngestAnalyticsSocketFrameResult> call({
    required String siteApiKey,
    required AnalyticsSocketMessage message,
  }) async {
    final event = _extractEvent(message);
    if (event == null) {
      return const IngestAnalyticsSocketFrameResult();
    }

    if (isChatEvent(event)) {
      await _localRepository.ingestSocketEvent(siteApiKey, event);
      return IngestAnalyticsSocketFrameResult(
        visitorMessageReceived: event.eventType == 'live_visitor_message',
      );
    }

    _eventsCache.append(siteApiKey, event);
    return const IngestAnalyticsSocketFrameResult(analyticsEventReceived: true);
  }

  AnalyticsEvent? _extractEvent(AnalyticsSocketMessage message) {
    return switch (message) {
      AnalyticsSocketEvent(:final event) => event,
      AnalyticsSocketLiveAssistEvent(:final event) => event,
      AnalyticsSocketVisitorMessage(:final event) => event,
      AnalyticsSocketOwnerMessage(:final event) => event,
      _ => null,
    };
  }
}

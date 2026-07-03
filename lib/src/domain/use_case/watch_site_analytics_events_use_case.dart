import 'package:eeagle_ai/src/data/service/analytics_events_cache.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_event_classifier.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_local_repository.dart';

class WatchSiteAnalyticsEventsUseCase {
  WatchSiteAnalyticsEventsUseCase(
    this._eventsCache,
    this._localRepository,
  );

  final AnalyticsEventsCache _eventsCache;
  final LiveAssistLocalRepository _localRepository;

  Stream<List<AnalyticsEvent>> call(String siteApiKey) =>
      _eventsCache.watch(siteApiKey);

  Future<void> seedFromRest(String siteApiKey, List<AnalyticsEvent> events) async {
    final chatEvents = events.where(isChatEvent).toList();
    final analyticsEvents = events.where(isAnalyticsOnlyEvent).toList();
    await _localRepository.mergeApiChatMetadata(siteApiKey, chatEvents);
    _eventsCache.mergeRestSnapshot(siteApiKey, analyticsEvents);
  }
}

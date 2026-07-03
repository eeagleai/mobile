import 'package:eeagle_ai/src/data/service/analytics_events_cache.dart';
import 'package:eeagle_ai/src/data/service/site_analytics_socket_registry.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_local_repository.dart';

class ClearLiveAssistLocalDataUseCase {
  ClearLiveAssistLocalDataUseCase(
    this._localRepository,
    this._eventsCache,
    this._socketRegistry,
  );

  final LiveAssistLocalRepository _localRepository;
  final AnalyticsEventsCache _eventsCache;
  final SiteAnalyticsSocketRegistry _socketRegistry;

  Future<void> call() async {
    _socketRegistry.releaseAll();
    _eventsCache.clear();
    await _localRepository.clearAll();
  }
}

import 'package:eeagle_ai/src/data/service/analytics_socket_service.dart';
import 'package:eeagle_ai/src/data/service/site_analytics_socket_registry.dart';

class WatchSiteAnalyticsSocketUseCase {
  WatchSiteAnalyticsSocketUseCase(this._registry);

  final SiteAnalyticsSocketRegistry _registry;

  Stream<AnalyticsSocketMessage> call(String apikey) => _registry.watch(apikey);
}

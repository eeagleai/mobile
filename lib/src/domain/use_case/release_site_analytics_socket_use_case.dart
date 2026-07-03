import 'package:eeagle_ai/src/data/service/site_analytics_socket_registry.dart';

class ReleaseSiteAnalyticsSocketUseCase {
  ReleaseSiteAnalyticsSocketUseCase(this._registry);

  final SiteAnalyticsSocketRegistry _registry;

  void call(String apikey) => _registry.release(apikey);
}

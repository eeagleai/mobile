import 'package:eeagle_ai/src/data/service/site_analytics_socket_registry.dart';

class HasOpenSiteAnalyticsSocketUseCase {
  HasOpenSiteAnalyticsSocketUseCase(this._registry);

  final SiteAnalyticsSocketRegistry _registry;

  bool call(String apikey) => _registry.hasOpenConnection(apikey);
}

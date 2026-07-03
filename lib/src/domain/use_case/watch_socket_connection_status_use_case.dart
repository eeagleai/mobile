import 'package:eeagle_ai/src/data/service/site_analytics_socket_registry.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';

class WatchSocketConnectionStatusUseCase {
  WatchSocketConnectionStatusUseCase(this._registry);

  final SiteAnalyticsSocketRegistry _registry;

  AnalyticsConnectionStatus call(String apikey) =>
      _registry.connectionStatusFor(apikey);
}

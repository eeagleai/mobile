import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stats.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stream_info.dart';
import 'package:fpdart/fpdart.dart';

/// Read-only access to a site's analytics: aggregate stats, recent events, and
/// the credentials needed to open the live analytics WebSocket.
abstract class AnalyticsRepository {
  TaskEither<OperationFailure, AnalyticsStats> getStats(String apikey);

  TaskEither<OperationFailure, List<AnalyticsEvent>> getEvents(
    String apikey, {
    int limit = 100,
  });

  TaskEither<OperationFailure, AnalyticsStreamInfo> getStreamToken(
    String apikey,
  );
}

import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stats.dart';
import 'package:eeagle_ai/src/domain/repository/analytics_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAnalyticsStatsUseCase {
  GetAnalyticsStatsUseCase(this._analyticsRepository);

  final AnalyticsRepository _analyticsRepository;

  TaskEither<OperationFailure, AnalyticsStats> call(String apikey) {
    return _analyticsRepository.getStats(apikey);
  }
}

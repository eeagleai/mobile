import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/repository/analytics_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAnalyticsEventsUseCase {
  GetAnalyticsEventsUseCase(this._analyticsRepository);

  final AnalyticsRepository _analyticsRepository;

  TaskEither<OperationFailure, List<AnalyticsEvent>> call(
    String apikey, {
    int limit = 100,
  }) {
    return _analyticsRepository.getEvents(apikey, limit: limit);
  }
}

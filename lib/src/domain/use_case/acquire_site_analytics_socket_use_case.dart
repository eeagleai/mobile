import 'package:eeagle_ai/src/data/service/site_analytics_socket_registry.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/repository/analytics_repository.dart';
import 'package:fpdart/fpdart.dart';

class AcquireSiteAnalyticsSocketUseCase {
  AcquireSiteAnalyticsSocketUseCase(
    this._registry,
    this._analyticsRepository,
  );

  final SiteAnalyticsSocketRegistry _registry;
  final AnalyticsRepository _analyticsRepository;

  TaskEither<OperationFailure, Unit> call(String apikey) {
    return TaskEither(() async {
      try {
        await _registry.acquire(
          apikey,
          () => _analyticsRepository.getStreamToken(apikey).run().then(
                (result) => result.match(
                  (failure) => throw failure,
                  (info) => info,
                ),
              ),
        );
        return right(unit);
      } on OperationFailure catch (failure) {
        return left(failure);
      } catch (error) {
        return left(OperationFailure(error.toString()));
      }
    });
  }
}

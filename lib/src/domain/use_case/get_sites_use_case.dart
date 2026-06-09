import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/repository/sites_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetSitesUseCase {
  GetSitesUseCase(this._sitesRepository);

  final SitesRepository _sitesRepository;

  TaskEither<OperationFailure, List<Site>> call() {
    return _sitesRepository.getSites();
  }
}

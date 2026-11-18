import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/site_revision.dart';
import 'package:eeagle_ai/src/domain/repository/sites_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetSiteRevisionsUseCase {
  GetSiteRevisionsUseCase(this._sitesRepository);

  final SitesRepository _sitesRepository;

  TaskEither<OperationFailure, List<SiteRevision>> call(String siteApiKey) {
    return _sitesRepository.getSiteRevisions(siteApiKey);
  }
}

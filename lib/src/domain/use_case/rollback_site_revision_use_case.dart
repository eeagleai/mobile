import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/site_rollback_result.dart';
import 'package:eeagle_ai/src/domain/repository/sites_repository.dart';
import 'package:fpdart/fpdart.dart';

class RollbackSiteRevisionUseCase {
  RollbackSiteRevisionUseCase(this._sitesRepository);

  final SitesRepository _sitesRepository;

  TaskEither<OperationFailure, SiteRollbackResult> call({
    required String siteApiKey,
    required String revisionIdOrSha,
  }) {
    return _sitesRepository.rollbackSiteRevision(
      siteApiKey: siteApiKey,
      revisionIdOrSha: revisionIdOrSha,
    );
  }
}

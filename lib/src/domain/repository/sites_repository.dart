import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:fpdart/fpdart.dart';

class WebsiteBuildStatus {
  const WebsiteBuildStatus({
    required this.status,
    required this.message,
    required this.complete,
    this.requestDbId,
    this.statusUrl,
    this.siteUrl,
  });

  final String status;
  final String message;
  final bool complete;
  final String? requestDbId;
  final String? statusUrl;
  final String? siteUrl;

  bool get failed => const {
    'failed',
    'error',
    'invalid',
    'conflict',
  }.contains(status.toLowerCase());
}

abstract class SitesRepository {
  TaskEither<OperationFailure, List<Site>> getSites();

  TaskEither<OperationFailure, WebsiteBuildStatus> createWebsite(String prompt);

  TaskEither<OperationFailure, WebsiteBuildStatus> getWebsiteBuildStatus(
    WebsiteBuildStatus build,
  );
}

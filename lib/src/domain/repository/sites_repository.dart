import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class SitesRepository {
  TaskEither<OperationFailure, List<Site>> getSites();
}

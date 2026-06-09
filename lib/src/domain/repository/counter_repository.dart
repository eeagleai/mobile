import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class CounterRepository {
  TaskEither<OperationFailure, int> getCount();

  TaskEither<OperationFailure, int> increment();
}

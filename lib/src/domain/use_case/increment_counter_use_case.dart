import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/repository/counter_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetCounterUseCase {
  GetCounterUseCase(this._counterRepository);

  final CounterRepository _counterRepository;

  TaskEither<OperationFailure, int> call() {
    return _counterRepository.getCount();
  }
}

class IncrementCounterUseCase {
  IncrementCounterUseCase(this._counterRepository);

  final CounterRepository _counterRepository;

  TaskEither<OperationFailure, int> call() {
    return _counterRepository.increment();
  }
}

import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stream_info.dart';
import 'package:eeagle_ai/src/domain/repository/analytics_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAnalyticsStreamTokenUseCase {
  GetAnalyticsStreamTokenUseCase(this._analyticsRepository);

  final AnalyticsRepository _analyticsRepository;

  TaskEither<OperationFailure, AnalyticsStreamInfo> call(String apikey) {
    return _analyticsRepository.getStreamToken(apikey);
  }
}

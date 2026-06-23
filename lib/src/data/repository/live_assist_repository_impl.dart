import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/service/live_assist_api_service.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/live_assist_send_status.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_repository.dart';
import 'package:fpdart/fpdart.dart';

class LiveAssistRepositoryImpl implements LiveAssistRepository {
  LiveAssistRepositoryImpl(this._apiService);

  final LiveAssistApiService _apiService;

  @override
  TaskEither<OperationFailure, LiveAssistSendStatus> sendMessage({
    required String apikey,
    required String conversationId,
    required String message,
  }) {
    return TaskEither(() async {
      try {
        final response = await _apiService.send(
          apikey: apikey,
          conversationId: conversationId,
          message: message,
        );
        return right(response.toStatus());
      } on DioException catch (error, stackTrace) {
        appLogger.w(
          'sendLiveAssistMessage failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure.fromDio(error));
      } catch (error, stackTrace) {
        appLogger.w(
          'sendLiveAssistMessage failed',
          error: error,
          stackTrace: stackTrace,
        );
        return left(OperationFailure(error.toString()));
      }
    });
  }
}

import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/live_assist_send_status.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_repository.dart';
import 'package:fpdart/fpdart.dart';

class SendLiveAssistMessageUseCase {
  SendLiveAssistMessageUseCase(this._liveAssistRepository);

  final LiveAssistRepository _liveAssistRepository;

  TaskEither<OperationFailure, LiveAssistSendStatus> call({
    required String apikey,
    required String conversationId,
    required String message,
  }) {
    return _liveAssistRepository.sendMessage(
      apikey: apikey,
      conversationId: conversationId,
      message: message,
    );
  }
}

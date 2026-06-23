import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/live_assist_send_status.dart';
import 'package:fpdart/fpdart.dart';

/// Sends owner messages into a visitor's live conversation.
abstract class LiveAssistRepository {
  TaskEither<OperationFailure, LiveAssistSendStatus> sendMessage({
    required String apikey,
    required String conversationId,
    required String message,
  });
}

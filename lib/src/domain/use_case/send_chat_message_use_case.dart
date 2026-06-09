import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/repository/chat_repository.dart';
import 'package:fpdart/fpdart.dart';

class SendChatMessageUseCase {
  SendChatMessageUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  TaskEither<OperationFailure, Unit> call({
    required String text,
    required String conversationSessionId,
  }) {
    return _chatRepository.sendMessage(
      text: text,
      conversationSessionId: conversationSessionId,
    );
  }
}

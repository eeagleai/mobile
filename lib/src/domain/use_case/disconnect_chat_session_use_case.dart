import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/repository/chat_repository.dart';
import 'package:fpdart/fpdart.dart';

class DisconnectChatSessionUseCase {
  DisconnectChatSessionUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  TaskEither<OperationFailure, Unit> call() {
    return _chatRepository.disconnectSession();
  }
}

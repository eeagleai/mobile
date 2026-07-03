import 'package:eeagle_ai/src/domain/repository/live_assist_local_repository.dart';

class MarkConversationReadUseCase {
  MarkConversationReadUseCase(this._repository);

  final LiveAssistLocalRepository _repository;

  Future<void> call(String conversationId) =>
      _repository.markConversationRead(conversationId);
}

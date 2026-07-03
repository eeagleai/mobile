import 'package:eeagle_ai/src/domain/model/live_chat_message.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_local_repository.dart';

class SaveOwnerMessageUseCase {
  SaveOwnerMessageUseCase(this._repository);

  final LiveAssistLocalRepository _repository;

  Future<String> call({
    required String siteApiKey,
    required String conversationId,
    required String localId,
    required String text,
    required DateTime createdAt,
  }) =>
      _repository.saveOwnerMessage(
        siteApiKey: siteApiKey,
        conversationId: conversationId,
        localId: localId,
        text: text,
        createdAt: createdAt,
      );
}

class UpdateOwnerMessageStatusUseCase {
  UpdateOwnerMessageStatusUseCase(this._repository);

  final LiveAssistLocalRepository _repository;

  Future<void> call({
    required String localId,
    required LiveChatMessageStatus status,
  }) =>
      _repository.updateOwnerMessageStatus(localId: localId, status: status);
}

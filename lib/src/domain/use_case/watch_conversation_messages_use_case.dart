import 'package:eeagle_ai/src/domain/model/live_chat_message.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_local_repository.dart';

class WatchConversationMessagesUseCase {
  WatchConversationMessagesUseCase(this._repository);

  final LiveAssistLocalRepository _repository;

  Stream<List<LiveChatMessage>> call(String conversationId) =>
      _repository.watchMessages(conversationId);
}

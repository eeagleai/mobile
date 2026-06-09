import 'package:eeagle_ai/src/domain/model/chat_inbound_event.dart';
import 'package:eeagle_ai/src/domain/repository/chat_repository.dart';

class WatchChatInboundEventsUseCase {
  WatchChatInboundEventsUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  Stream<ChatInboundEvent> call() => _chatRepository.watchInboundEvents();
}

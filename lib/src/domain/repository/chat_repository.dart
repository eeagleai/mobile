import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/chat_inbound_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_session.dart';
import 'package:fpdart/fpdart.dart';

abstract class ChatRepository {
  TaskEither<OperationFailure, ChatSession> mintChatToken({
    required String apikey,
    required String pageUrl,
    String locale = 'en',
    String model = 'eeagle-default',
    bool newChat = true,
  });

  TaskEither<OperationFailure, Unit> connectSession({
    required ChatSession session,
    required String apikey,
    required String pageUrl,
    required String model,
  });

  TaskEither<OperationFailure, Unit> sendMessage({
    required String text,
    required String conversationSessionId,
  });

  TaskEither<OperationFailure, Unit> disconnectSession();

  Stream<ChatInboundEvent> watchInboundEvents();

  bool get isSessionConnected;
}

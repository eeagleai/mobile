import 'package:eeagle_ai/src/domain/model/chat_session_config.dart';

class ChatSession {
  const ChatSession({
    required this.token,
    required this.wsUrl,
    required this.conversationId,
    required this.conversationSessionId,
    required this.routeKey,
    required this.config,
  });

  final String token;
  final String wsUrl;
  final String conversationId;
  final String conversationSessionId;
  final String routeKey;
  final ChatSessionConfig config;
}

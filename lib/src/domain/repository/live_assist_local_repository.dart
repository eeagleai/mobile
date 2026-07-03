import 'package:eeagle_ai/src/domain/entities/live_conversation_summary.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/model/live_chat_message.dart';

abstract class LiveAssistLocalRepository {
  Future<void> ingestSocketEvent(String siteApiKey, AnalyticsEvent event);

  Stream<List<LiveConversationSummary>> watchConversations(String siteApiKey);

  Stream<List<LiveChatMessage>> watchMessages(String conversationId);

  Future<void> markConversationRead(String conversationId);

  Future<String> saveOwnerMessage({
    required String siteApiKey,
    required String conversationId,
    required String localId,
    required String text,
    required DateTime createdAt,
  });

  Future<void> updateOwnerMessageStatus({
    required String localId,
    required LiveChatMessageStatus status,
  });

  Future<void> mergeApiChatMetadata(
    String siteApiKey,
    List<AnalyticsEvent> events,
  );

  Future<void> clearAll();
}

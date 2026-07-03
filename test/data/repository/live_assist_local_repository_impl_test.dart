import 'package:drift/native.dart';
import 'package:eeagle_ai/src/data/local/live_assist_database.dart';
import 'package:eeagle_ai/src/data/repository/live_assist_local_repository_impl.dart';
import 'package:eeagle_ai/src/domain/entities/live_conversation_summary.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/model/live_chat_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LiveAssistDatabase database;
  late LiveAssistLocalRepositoryImpl repository;

  const siteApiKey = 'site-key';
  const conversationId = 'conv-1';
  final createdAt = DateTime(2025, 6, 1, 10, 30);

  setUp(() {
    database = LiveAssistDatabase(NativeDatabase.memory());
    repository = LiveAssistLocalRepositoryImpl(database);
  });

  tearDown(() async {
    await database.close();
  });

  AnalyticsEvent visitorMessage({
    String text = 'Hello visitor',
    DateTime? at,
  }) {
    return AnalyticsEvent(
      eventType: 'live_visitor_message',
      conversationId: conversationId,
      message: text,
      city: 'Amman',
      country: 'Jordan',
      createdAt: at ?? createdAt,
    );
  }

  test('ingestSocketEvent creates conversation and message', () async {
    await repository.ingestSocketEvent(siteApiKey, visitorMessage());

    final conversations = await repository
        .watchConversations(siteApiKey)
        .first;
    expect(conversations, hasLength(1));
    expect(conversations.first.conversationId, conversationId);
    expect(conversations.first.visitorLabel, 'Amman, Jordan');
    expect(conversations.first.unreadCount, 1);
    expect(conversations.first.latestPreview, 'Hello visitor');

    final messages = await repository.watchMessages(conversationId).first;
    expect(messages, hasLength(1));
    expect(messages.first.sender, LiveChatSender.visitor);
    expect(messages.first.text, 'Hello visitor');
    expect(messages.first.status, LiveChatMessageStatus.sent);
  });

  test('markConversationRead clears unread count', () async {
    await repository.ingestSocketEvent(siteApiKey, visitorMessage());
    await repository.markConversationRead(conversationId);

    final conversations = await repository
        .watchConversations(siteApiKey)
        .first;
    expect(conversations.first.unreadCount, 0);
  });

  test('saveOwnerMessage writes optimistic owner message', () async {
    await repository.ingestSocketEvent(
      siteApiKey,
      AnalyticsEvent(
        eventType: 'live_chat_opened',
        conversationId: conversationId,
        createdAt: createdAt,
      ),
    );

    await repository.saveOwnerMessage(
      siteApiKey: siteApiKey,
      conversationId: conversationId,
      localId: 'local-0',
      text: 'Owner reply',
      createdAt: createdAt.add(const Duration(minutes: 1)),
    );

    final messages = await repository.watchMessages(conversationId).first;
    expect(messages, hasLength(1));
    expect(messages.first.sender, LiveChatSender.owner);
    expect(messages.first.status, LiveChatMessageStatus.sending);
  });

  test('owner socket echo confirms pending optimistic message', () async {
    await repository.ingestSocketEvent(
      siteApiKey,
      AnalyticsEvent(
        eventType: 'live_chat_opened',
        conversationId: conversationId,
        createdAt: createdAt,
      ),
    );

    const ownerText = 'Owner reply';
    await repository.saveOwnerMessage(
      siteApiKey: siteApiKey,
      conversationId: conversationId,
      localId: 'local-0',
      text: ownerText,
      createdAt: createdAt.add(const Duration(minutes: 1)),
    );

    await repository.ingestSocketEvent(
      siteApiKey,
      AnalyticsEvent(
        eventType: 'live_owner_message',
        conversationId: conversationId,
        message: ownerText,
        createdAt: createdAt.add(const Duration(minutes: 1)),
      ),
    );

    final messages = await repository.watchMessages(conversationId).first;
    expect(messages, hasLength(1));
    expect(messages.first.status, LiveChatMessageStatus.sent);
  });

  test('clearAll removes conversations and messages', () async {
    await repository.ingestSocketEvent(siteApiKey, visitorMessage());
    await repository.clearAll();

    final conversations = await repository
        .watchConversations(siteApiKey)
        .first;
    expect(conversations, isEmpty);
  });

  test('mergeApiChatMetadata enriches without deleting socket-only threads',
      () async {
    await repository.ingestSocketEvent(siteApiKey, visitorMessage());

    await repository.mergeApiChatMetadata(siteApiKey, const [
      AnalyticsEvent(
        eventType: 'live_visitor_message',
        conversationId: conversationId,
        pageUrl: '/pricing',
      ),
    ]);

    final conversations = await repository
        .watchConversations(siteApiKey)
        .first;
    expect(conversations, hasLength(1));
    expect(conversations.first.pageUrl, '/pricing');
    expect(conversations.first.status, LiveConversationStatus.active);
  });
}

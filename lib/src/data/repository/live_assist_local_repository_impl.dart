import 'package:drift/drift.dart';
import 'package:eeagle_ai/src/data/local/live_assist_database.dart';
import 'package:eeagle_ai/src/domain/entities/live_conversation_summary.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_event_classifier.dart';
import 'package:eeagle_ai/src/domain/model/live_chat_message.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_local_repository.dart';

class LiveAssistLocalRepositoryImpl implements LiveAssistLocalRepository {
  LiveAssistLocalRepositoryImpl(this._database);

  final LiveAssistDatabase _database;

  @override
  Future<void> ingestSocketEvent(String siteApiKey, AnalyticsEvent event) async {
    if (!isChatEvent(event)) {
      return;
    }

    final conversationId = event.conversationId!;
    final now = event.createdAt ?? DateTime.now();
    final existing = await (_database.select(_database.conversations)
          ..where(
            (row) =>
                row.conversationId.equals(conversationId) &
                row.siteApiKey.equals(siteApiKey),
          ))
        .getSingleOrNull();

    final status = _statusFromEvent(event, existing?.status);
    final preview = chatMessageText(event) ?? existing?.latestPreview;
    final visitorLabel = visitorLabelFor(event);
    final incrementUnread = event.eventType == 'live_visitor_message';

    final companion = ConversationsCompanion(
      conversationId: Value(conversationId),
      siteApiKey: Value(siteApiKey),
      visitorLabel: Value(
        existing == null ? visitorLabel : _pickString(visitorLabel, existing.visitorLabel),
      ),
      pageUrl: Value(_pickNullable(event.pageUrl, existing?.pageUrl)),
      city: Value(_pickNullable(event.city, existing?.city)),
      country: Value(_pickNullable(event.country, existing?.country)),
      visitId: Value(_pickNullable(event.visitId, existing?.visitId)),
      status: Value(status),
      firstSeenAt: Value(existing?.firstSeenAt ?? now),
      lastActivityAt: Value(now),
      unreadCount: Value(
        (existing?.unreadCount ?? 0) + (incrementUnread ? 1 : 0),
      ),
      latestPreview: Value(preview),
      latestEventType: Value(event.eventType ?? existing?.latestEventType),
    );

    await _database.into(_database.conversations).insertOnConflictUpdate(
          companion,
        );

    await _maybeAppendMessageFromEvent(
      siteApiKey: siteApiKey,
      event: event,
      conversationId: conversationId,
    );
  }

  @override
  Stream<List<LiveConversationSummary>> watchConversations(String siteApiKey) {
    final query = _database.select(_database.conversations)
      ..where((row) => row.siteApiKey.equals(siteApiKey))
      ..orderBy([(row) => OrderingTerm.desc(row.lastActivityAt)]);
    return query.watch().map((rows) => rows.map(_mapConversation).toList());
  }

  @override
  Stream<List<LiveChatMessage>> watchMessages(String conversationId) {
    final query = _database.select(_database.chatMessages)
      ..where((row) => row.conversationId.equals(conversationId))
      ..orderBy([(row) => OrderingTerm.asc(row.createdAt)]);
    return query.watch().map((rows) => rows.map(_mapMessage).toList());
  }

  @override
  Future<void> markConversationRead(String conversationId) async {
    await (_database.update(_database.conversations)
          ..where((row) => row.conversationId.equals(conversationId)))
        .write(const ConversationsCompanion(unreadCount: Value(0)));
  }

  @override
  Future<String> saveOwnerMessage({
    required String siteApiKey,
    required String conversationId,
    required String localId,
    required String text,
    required DateTime createdAt,
  }) async {
    await _database.into(_database.chatMessages).insertOnConflictUpdate(
          ChatMessagesCompanion(
            id: Value(localId),
            conversationId: Value(conversationId),
            siteApiKey: Value(siteApiKey),
            sender: const Value('owner'),
            messageText: Value(text),
            status: const Value('sending'),
            createdAt: Value(createdAt),
          ),
        );

    await (_database.update(_database.conversations)
          ..where(
            (row) =>
                row.conversationId.equals(conversationId) &
                row.siteApiKey.equals(siteApiKey),
          ))
        .write(
      ConversationsCompanion(
        lastActivityAt: Value(createdAt),
        latestPreview: Value(text),
        latestEventType: const Value('live_owner_message'),
      ),
    );

    return localId;
  }

  @override
  Future<void> updateOwnerMessageStatus({
    required String localId,
    required LiveChatMessageStatus status,
  }) async {
    await (_database.update(_database.chatMessages)
          ..where((row) => row.id.equals(localId)))
        .write(ChatMessagesCompanion(status: Value(_messageStatusToString(status))));
  }

  @override
  Future<void> mergeApiChatMetadata(
    String siteApiKey,
    List<AnalyticsEvent> events,
  ) async {
    for (final event in events) {
      if (!isChatEvent(event)) {
        continue;
      }

      final conversationId = event.conversationId!;
      final existing = await (_database.select(_database.conversations)
            ..where(
              (row) =>
                  row.conversationId.equals(conversationId) &
                  row.siteApiKey.equals(siteApiKey),
            ))
          .getSingleOrNull();

      if (existing == null) {
        await ingestSocketEvent(siteApiKey, event);
        continue;
      }

      final now = event.createdAt ?? existing.lastActivityAt;
      await (_database.update(_database.conversations)
            ..where(
              (row) =>
                  row.conversationId.equals(conversationId) &
                  row.siteApiKey.equals(siteApiKey),
            ))
          .write(
        ConversationsCompanion(
          pageUrl: Value(_pickNullable(event.pageUrl, existing.pageUrl)),
          city: Value(_pickNullable(event.city, existing.city)),
          country: Value(_pickNullable(event.country, existing.country)),
          visitId: Value(_pickNullable(event.visitId, existing.visitId)),
          latestPreview: Value(
            chatMessageText(event) ?? existing.latestPreview,
          ),
          latestEventType: Value(event.eventType ?? existing.latestEventType),
          lastActivityAt: Value(
            now.isAfter(existing.lastActivityAt) ? now : existing.lastActivityAt,
          ),
        ),
      );
    }
  }

  @override
  Future<void> clearAll() => _database.clearAll();

  Future<void> _maybeAppendMessageFromEvent({
    required String siteApiKey,
    required AnalyticsEvent event,
    required String conversationId,
  }) async {
    final text = chatMessageText(event);
    if (text == null) {
      return;
    }

    final sender = switch (event.eventType) {
      'live_owner_message' => 'owner',
      'live_visitor_message' => 'visitor',
      _ => null,
    };
    if (sender == null) {
      return;
    }

    final messageId = _messageIdFor(event, sender, text);
    final existing = await (_database.select(_database.chatMessages)
          ..where((row) => row.id.equals(messageId)))
        .getSingleOrNull();
    if (existing != null) {
      if (sender == 'owner' && existing.status != 'sent') {
        await (_database.update(_database.chatMessages)
              ..where((row) => row.id.equals(messageId)))
            .write(const ChatMessagesCompanion(status: Value('sent')));
      }
      return;
    }

    if (sender == 'owner') {
      final pending = await (_database.select(_database.chatMessages)
            ..where(
              (row) =>
                  row.conversationId.equals(conversationId) &
                  row.sender.equals('owner') &
                  row.messageText.equals(text) &
                  row.status.isIn(['sending', 'queued']),
            ))
          .getSingleOrNull();
      if (pending != null) {
        await (_database.update(_database.chatMessages)
              ..where((row) => row.id.equals(pending.id)))
            .write(
          ChatMessagesCompanion(
            status: const Value('sent'),
            createdAt: Value(event.createdAt ?? pending.createdAt),
          ),
        );
        return;
      }
    }

    await _database.into(_database.chatMessages).insertOnConflictUpdate(
          ChatMessagesCompanion(
            id: Value(messageId),
            conversationId: Value(conversationId),
            siteApiKey: Value(siteApiKey),
            sender: Value(sender),
            messageText: Value(text),
            status: const Value('sent'),
            createdAt: Value(event.createdAt ?? DateTime.now()),
          ),
        );
  }

  String _messageIdFor(AnalyticsEvent event, String sender, String text) {
    final createdAt = event.createdAt?.toIso8601String() ?? '';
    return 'socket:$sender:${event.conversationId}:$createdAt:${text.hashCode}';
  }

  String _statusFromEvent(AnalyticsEvent event, String? existingStatus) {
    return switch (event.eventType) {
      'live_chat_opened' => 'active',
      'live_chat_closed' => 'closed',
      _ when event.waitingForVisitorReply == true => 'waiting',
      _ => existingStatus ?? 'active',
    };
  }

  LiveConversationSummary _mapConversation(Conversation row) {
    return LiveConversationSummary(
      conversationId: row.conversationId,
      siteApiKey: row.siteApiKey,
      visitorLabel: row.visitorLabel,
      pageUrl: row.pageUrl,
      city: row.city,
      country: row.country,
      visitId: row.visitId,
      status: _parseStatus(row.status),
      firstSeenAt: row.firstSeenAt,
      lastActivityAt: row.lastActivityAt,
      unreadCount: row.unreadCount,
      latestPreview: row.latestPreview,
      latestEventType: row.latestEventType,
    );
  }

  LiveChatMessage _mapMessage(ChatMessage row) {
    return LiveChatMessage(
      id: row.id,
      sender: row.sender == 'owner'
          ? LiveChatSender.owner
          : LiveChatSender.visitor,
      text: row.messageText,
      status: _parseMessageStatus(row.status),
      createdAt: row.createdAt,
    );
  }

  LiveConversationStatus _parseStatus(String raw) {
    return switch (raw) {
      'closed' => LiveConversationStatus.closed,
      'waiting' => LiveConversationStatus.waiting,
      _ => LiveConversationStatus.active,
    };
  }

  LiveChatMessageStatus _parseMessageStatus(String raw) {
    return switch (raw) {
      'sending' => LiveChatMessageStatus.sending,
      'queued' => LiveChatMessageStatus.queued,
      'failed' => LiveChatMessageStatus.failed,
      _ => LiveChatMessageStatus.sent,
    };
  }

  String _messageStatusToString(LiveChatMessageStatus status) {
    return switch (status) {
      LiveChatMessageStatus.sending => 'sending',
      LiveChatMessageStatus.queued => 'queued',
      LiveChatMessageStatus.failed => 'failed',
      LiveChatMessageStatus.sent => 'sent',
    };
  }

  String _pickString(String incoming, String existing) {
    return incoming.isNotEmpty ? incoming : existing;
  }

  String? _pickNullable(String? incoming, String? existing) {
    if (incoming != null && incoming.isNotEmpty) {
      return incoming;
    }
    return existing;
  }
}


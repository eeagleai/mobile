import 'package:drift/drift.dart';

part 'live_assist_database.g.dart';

class Conversations extends Table {
  TextColumn get conversationId => text()();
  TextColumn get siteApiKey => text()();
  TextColumn get visitorLabel => text()();
  TextColumn get pageUrl => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get visitId => text().nullable()();
  TextColumn get status => text()();
  DateTimeColumn get firstSeenAt => dateTime()();
  DateTimeColumn get lastActivityAt => dateTime()();
  IntColumn get unreadCount => integer().withDefault(const Constant(0))();
  TextColumn get latestPreview => text().nullable()();
  TextColumn get latestEventType => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {conversationId, siteApiKey};
}

class ChatMessages extends Table {
  TextColumn get id => text()();
  TextColumn get conversationId => text()();
  TextColumn get siteApiKey => text()();
  TextColumn get sender => text()();
  TextColumn get messageText => text()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(tables: [Conversations, ChatMessages])
class LiveAssistDatabase extends _$LiveAssistDatabase {
  LiveAssistDatabase(super.executor);

  @override
  int get schemaVersion => 1;

  Future<void> clearAll() async {
    await delete(chatMessages).go();
    await delete(conversations).go();
  }
}


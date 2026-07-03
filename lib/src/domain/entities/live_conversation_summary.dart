import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_conversation_summary.freezed.dart';

enum LiveConversationStatus { active, closed, waiting }

@freezed
abstract class LiveConversationSummary with _$LiveConversationSummary {
  const factory LiveConversationSummary({
    required String conversationId,
    required String siteApiKey,
    required String visitorLabel,
    String? pageUrl,
    String? city,
    String? country,
    String? visitId,
    required LiveConversationStatus status,
    required DateTime firstSeenAt,
    required DateTime lastActivityAt,
    @Default(0) int unreadCount,
    String? latestPreview,
    String? latestEventType,
  }) = _LiveConversationSummary;
}

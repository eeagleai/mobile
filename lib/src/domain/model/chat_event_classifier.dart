import 'package:eeagle_ai/src/domain/model/analytics_event.dart';

bool isChatAnalyticsEvent(String? eventType) {
  return switch (eventType) {
    'live_visitor_message' ||
    'live_owner_message' ||
    'live_chat_opened' ||
    'live_chat_closed' =>
      true,
    _ => false,
  };
}

bool isChatEvent(AnalyticsEvent event) =>
    isChatAnalyticsEvent(event.eventType) &&
    (event.conversationId ?? '').isNotEmpty;

bool isAnalyticsOnlyEvent(AnalyticsEvent event) => !isChatEvent(event);

String? chatMessageText(AnalyticsEvent event) {
  final message = event.message;
  if (message != null && message.isNotEmpty) {
    return message;
  }
  final preview = event.preview;
  if (preview != null && preview.isNotEmpty) {
    return preview;
  }
  return null;
}

String visitorLabelFor(AnalyticsEvent event) {
  final location = [event.city, event.country]
      .where((part) => part != null && part.isNotEmpty)
      .join(', ');
  if (location.isNotEmpty) {
    return location;
  }
  final visitId = event.visitId;
  if (visitId != null && visitId.isNotEmpty) {
    return 'Visitor $visitId';
  }
  return 'Visitor';
}


import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_event_classifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isChatAnalyticsEvent', () {
    test('returns true for live chat event types', () {
      expect(isChatAnalyticsEvent('live_visitor_message'), isTrue);
      expect(isChatAnalyticsEvent('live_owner_message'), isTrue);
      expect(isChatAnalyticsEvent('live_chat_opened'), isTrue);
      expect(isChatAnalyticsEvent('live_chat_closed'), isTrue);
    });

    test('returns false for non-chat types', () {
      expect(isChatAnalyticsEvent('page_view'), isFalse);
      expect(isChatAnalyticsEvent(null), isFalse);
    });
  });

  group('isChatEvent', () {
    test('requires chat event type and conversation id', () {
      const withId = AnalyticsEvent(
        eventType: 'live_visitor_message',
        conversationId: 'conv-1',
      );
      const withoutId = AnalyticsEvent(
        eventType: 'live_visitor_message',
      );
      const wrongType = AnalyticsEvent(
        eventType: 'page_view',
        conversationId: 'conv-1',
      );

      expect(isChatEvent(withId), isTrue);
      expect(isChatEvent(withoutId), isFalse);
      expect(isChatEvent(wrongType), isFalse);
    });
  });

  group('visitorLabelFor', () {
    test('prefers city and country', () {
      const event = AnalyticsEvent(city: 'Amman', country: 'Jordan');
      expect(visitorLabelFor(event), 'Amman, Jordan');
    });

    test('falls back to visit id', () {
      const event = AnalyticsEvent(visitId: '42');
      expect(visitorLabelFor(event), 'Visitor 42');
    });

    test('falls back to generic label', () {
      expect(visitorLabelFor(const AnalyticsEvent()), 'Visitor');
    });
  });

  group('chatMessageText', () {
    test('prefers message over preview', () {
      const event = AnalyticsEvent(message: 'hello', preview: 'hi');
      expect(chatMessageText(event), 'hello');
    });

    test('uses preview when message is empty', () {
      const event = AnalyticsEvent(preview: 'preview text');
      expect(chatMessageText(event), 'preview text');
    });
  });
}

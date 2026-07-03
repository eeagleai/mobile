import 'package:eeagle_ai/src/data/service/analytics_socket_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('parseAnalyticsSocketFrame', () {
    test('parses top-level live_chat_opened with nested event payload', () {
      final message = parseAnalyticsSocketFrame({
        'type': 'live_chat_opened',
        'event': {
          'conversation_id': 'conv-42',
          'page_url': 'https://example.com/pricing',
          'city': 'Amman',
          'country': 'Jordan',
          'opened_at': '2025-01-01T12:00:00.000Z',
        },
      });

      expect(message, isA<AnalyticsSocketLiveAssistEvent>());
      final event = (message! as AnalyticsSocketLiveAssistEvent).event;
      expect(event.eventType, 'live_chat_opened');
      expect(event.conversationId, 'conv-42');
      expect(event.pageUrl, 'https://example.com/pricing');
      expect(event.city, 'Amman');
      expect(event.createdAt, DateTime.parse('2025-01-01T12:00:00.000Z'));
    });

    test('parses top-level live_chat_opened with flat payload', () {
      final message = parseAnalyticsSocketFrame({
        'type': 'live_chat_opened',
        'conversation_id': 'conv-99',
        'visit_id': '7',
      });

      expect(message, isA<AnalyticsSocketLiveAssistEvent>());
      final event = (message! as AnalyticsSocketLiveAssistEvent).event;
      expect(event.eventType, 'live_chat_opened');
      expect(event.conversationId, 'conv-99');
      expect(event.visitId, '7');
    });

    test('parses live_assist_event wrapper unchanged', () {
      final message = parseAnalyticsSocketFrame({
        'type': 'live_assist_event',
        'event': {
          'event_type': 'live_chat_closed',
          'conversation_id': 'conv-1',
        },
      });

      expect(message, isA<AnalyticsSocketLiveAssistEvent>());
      final event = (message! as AnalyticsSocketLiveAssistEvent).event;
      expect(event.eventType, 'live_chat_closed');
      expect(event.conversationId, 'conv-1');
    });
  });
}

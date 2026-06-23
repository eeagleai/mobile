import 'package:eeagle_ai/src/data/repository/chat_inbound_frame_mapper.dart';
import 'package:eeagle_ai/src/domain/model/chat_inbound_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps assistant message with content field', () {
    final event = mapChatInboundFrame({
      'type': 'message',
      'role': 'assistant',
      'content': 'Hello there',
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.role, ChatMessageRole.assistant);
    expect(message.content, 'Hello there');
  });

  test('maps assistant message with text field', () {
    final event = mapChatInboundFrame({
      'type': 'message',
      'role': 'assistant',
      'text': 'Hello there',
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.content, 'Hello there');
  });

  test('defaults missing role to assistant', () {
    final event = mapChatInboundFrame({
      'type': 'message',
      'content': 'Hello there',
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.role, ChatMessageRole.assistant);
  });

  test('maps streaming delta frames', () {
    final event = mapChatInboundFrame({
      'type': 'delta',
      'delta': 'Hi',
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.role, ChatMessageRole.assistant);
    expect(message.content, 'Hi');
  });

  test('maps assistant_error frames', () {
    final event = mapChatInboundFrame({
      'type': 'assistant_error',
      'error': 'assistant_error',
      'detail': {
        'message': 'LLM HTTP 401 Unauthorized invalid_api_key',
      },
    });

    expect(event, isA<ChatInboundErrorEvent>());
    final error = event! as ChatInboundErrorEvent;
    expect(error.error, 'assistant_error');
    expect(error.detail, contains('invalid_api_key'));
  });

  test('maps assistant_message frames from server', () {
    final event = mapChatInboundFrame({
      'type': 'assistant_message',
      'content': "I'm doing well, thanks! How can I help you today?",
      'payload': {
        'kind': 'dte_delta',
        'delta': false,
        'user': "I'm doing well, thanks! How can I help you today?",
      },
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.role, ChatMessageRole.assistant);
    expect(message.content, "I'm doing well, thanks! How can I help you today?");
  });

  test('extracts single page_urls from assistant_message payload', () {
    final event = mapChatInboundFrame({
      'type': 'assistant_message',
      'content': 'Created a new flowers page.',
      'payload': {
        'delta': true,
        'page_urls': ['https://wedding.eeagle.ai/flowers'],
      },
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.pageUrls, ['https://wedding.eeagle.ai/flowers']);
  });

  test('extracts page_urls when backend_dte_delta is true', () {
    final event = mapChatInboundFrame({
      'type': 'assistant_message',
      'content': 'Updated the homepage.',
      'payload': {
        'backend_dte_delta': true,
        'page_urls': ['https://wedding.eeagle.ai/'],
      },
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.pageUrls, ['https://wedding.eeagle.ai/']);
  });

  test('extracts multiple page_urls and dedupes them', () {
    final event = mapChatInboundFrame({
      'type': 'assistant_message',
      'content': 'Updated multiple pages.',
      'payload': {
        'delta': true,
        'page_urls': [
          'https://wedding.eeagle.ai/flowers',
          'https://wedding.eeagle.ai/about',
          'https://wedding.eeagle.ai/flowers',
        ],
      },
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(
      message.pageUrls,
      [
        'https://wedding.eeagle.ai/flowers',
        'https://wedding.eeagle.ai/about',
      ],
    );
  });

  test('keeps root path page_urls from payload', () {
    final event = mapChatInboundFrame({
      'type': 'assistant_message',
      'content': 'Updated the homepage.',
      'payload': {
        'delta': true,
        'page_urls': ['/'],
      },
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.pageUrls, ['/']);
  });

  test('ignores page_urls when neither delta flag is true', () {
    final event = mapChatInboundFrame({
      'type': 'assistant_message',
      'content': "I'm doing well, thanks!",
      'payload': {
        'delta': false,
        'backend_dte_delta': false,
        'page_urls': ['https://wedding.eeagle.ai/flowers'],
      },
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.pageUrls, isEmpty);
  });

  test('returns empty page_urls when payload is missing', () {
    final event = mapChatInboundFrame({
      'type': 'assistant_message',
      'content': 'No site changes here.',
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.pageUrls, isEmpty);
  });

  test('ignores page_urls on user messages', () {
    final event = mapChatInboundFrame({
      'type': 'message',
      'role': 'user',
      'content': 'Create a flowers page',
      'payload': {
        'delta': true,
        'page_urls': ['https://wedding.eeagle.ai/flowers'],
      },
    });

    expect(event, isA<ChatInboundMessageEvent>());
    final message = event! as ChatInboundMessageEvent;
    expect(message.pageUrls, isEmpty);
  });

  test('maps error frames with object detail', () {
    final event = mapChatInboundFrame({
      'type': 'error',
      'error': 'assistant_error',
      'detail': {
        'text': 'Invalid API Key',
      },
    });

    expect(event, isA<ChatInboundErrorEvent>());
    final error = event! as ChatInboundErrorEvent;
    expect(error.detail, 'Invalid API Key');
  });
}

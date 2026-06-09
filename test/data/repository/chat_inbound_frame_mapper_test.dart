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

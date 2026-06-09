import 'package:eeagle_ai/src/domain/model/chat_inbound_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_message.dart';

ChatInboundEvent? mapChatInboundFrame(Map<String, dynamic> frame) {
  final type = frame['type'];
  if (type is! String) {
    return null;
  }

  switch (type) {
    case 'status':
      final statusState = frame['state'];
      if (statusState is! String) {
        return null;
      }
      return ChatInboundEvent.status(state: statusState);
    case 'message':
    case 'assistant_message':
      return _mapMessageFrame(frame);
    case 'delta':
    case 'chunk':
    case 'assistant_delta':
    case 'assistant_chunk':
      return _mapStreamingChunkFrame(frame);
    case 'assistant_finished':
    case 'assistant_done':
      return const ChatInboundEvent.assistantFinished();
    case 'assistant_error':
      return _mapErrorFrame(frame);
    case 'error':
      return _mapErrorFrame(frame);
    case 'pong':
      return const ChatInboundEvent.pong();
    default:
      return null;
  }
}

ChatInboundEvent? _mapMessageFrame(Map<String, dynamic> frame) {
  final content = extractChatFrameText(frame);
  if (content == null || content.isEmpty) {
    return null;
  }

  final role = frame['role'];
  return ChatInboundEvent.message(
    role: role is String ? mapChatMessageRole(role) : ChatMessageRole.assistant,
    content: content,
  );
}

ChatInboundEvent? _mapStreamingChunkFrame(Map<String, dynamic> frame) {
  final content = extractChatFrameText(frame);
  if (content == null || content.isEmpty) {
    return null;
  }

  final role = frame['role'];
  return ChatInboundEvent.message(
    role: role is String ? mapChatMessageRole(role) : ChatMessageRole.assistant,
    content: content,
  );
}

ChatInboundEvent? _mapErrorFrame(Map<String, dynamic> frame) {
  final error = _stringOrNull(frame['error']) ??
      _stringOrNull(frame['message']) ??
      _stringOrNull(frame['type']);
  if (error == null || error.isEmpty) {
    return null;
  }

  final detail = frame['detail'];
  final detailText = _stringOrNull(detail) ??
      (detail is Map<String, dynamic> ? extractChatFrameText(detail) : null) ??
      extractChatFrameText(frame);

  return ChatInboundEvent.error(
    error: error,
    detail: detailText == error ? null : detailText,
  );
}

ChatMessageRole mapChatMessageRole(String role) {
  switch (role.toLowerCase()) {
    case 'assistant':
      return ChatMessageRole.assistant;
    case 'user':
    default:
      return ChatMessageRole.user;
  }
}

String? extractChatFrameText(Map<String, dynamic> frame) {
  for (final key in const ['content', 'text', 'message', 'body', 'delta']) {
    final value = frame[key];
    final extracted = _extractText(value);
    if (extracted != null && extracted.isNotEmpty) {
      return extracted;
    }
  }

  final nested = frame['data'];
  if (nested is Map<String, dynamic>) {
    final extracted = extractChatFrameText(nested);
    if (extracted != null && extracted.isNotEmpty) {
      return extracted;
    }
  }

  final payload = frame['payload'];
  if (payload is Map<String, dynamic>) {
    final user = payload['user'];
    if (user is String && user.isNotEmpty) {
      return user;
    }

    final extracted = extractChatFrameText(payload);
    if (extracted != null && extracted.isNotEmpty) {
      return extracted;
    }
  }

  return null;
}

String? _extractText(Object? value) {
  if (value is String) {
    return value;
  }

  if (value is Map) {
    for (final key in const ['content', 'text', 'message', 'value']) {
      final nested = value[key];
      if (nested is String && nested.isNotEmpty) {
        return nested;
      }
    }
  }

  if (value is List) {
    final buffer = StringBuffer();
    for (final item in value) {
      final extracted = _extractText(item);
      if (extracted != null && extracted.isNotEmpty) {
        buffer.write(extracted);
      }
    }
    final combined = buffer.toString();
    return combined.isEmpty ? null : combined;
  }

  return null;
}

String? _stringOrNull(Object? value) {
  return value is String ? value : null;
}

import 'package:eeagle_ai/src/domain/model/chat_inbound_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_message.dart';

/// Translates a raw WebSocket JSON frame from the backend into a typed
/// [ChatInboundEvent] the rest of the app understands.
///
/// The backend uses many different frame `type` names (and nests the text
/// under many different keys), so this file's job is to absorb that messiness
/// and produce a small, predictable set of events.
///
/// Returns `null` when the frame is one we don't act on (e.g. heartbeats or
/// unknown types); the caller decides whether to ignore or log it.
ChatInboundEvent? mapChatInboundFrame(Map<String, dynamic> frame) {
  // Every frame we care about is tagged with a string `type`.
  final type = frame['type'];
  if (type is! String) {
    return null;
  }

  switch (type) {
    // Connection/lifecycle updates (e.g. "processing", "idle").
    case 'status':
      final statusState = frame['state'];
      if (statusState is! String) {
        return null;
      }
      return ChatInboundEvent.status(state: statusState);
    // A complete message from the user or assistant.
    case 'message':
    case 'assistant_message':
      return _mapMessageFrame(frame);
    // A streamed piece of the assistant's reply (arrives token-by-token).
    case 'delta':
    case 'chunk':
    case 'assistant_delta':
    case 'assistant_chunk':
      return _mapStreamingChunkFrame(frame);
    // The assistant has finished its current turn.
    case 'assistant_finished':
    case 'assistant_done':
      return const ChatInboundEvent.assistantFinished();
    // Something went wrong on the backend.
    case 'assistant_error':
      return _mapErrorFrame(frame);
    case 'error':
      return _mapErrorFrame(frame);
    // Keep-alive reply; surfaced so the connection can be considered alive.
    case 'pong':
      return const ChatInboundEvent.pong();
    // Anything else is not actionable.
    default:
      return null;
  }
}

/// Builds a message event from a complete-message frame.
/// Drops the frame when it carries no text. Defaults to the assistant role
/// when the frame doesn't say who sent it.
ChatInboundEvent? _mapMessageFrame(Map<String, dynamic> frame) {
  final content = extractChatFrameText(frame);
  if (content == null || content.isEmpty) {
    return null;
  }

  final role = frame['role'];
  final messageRole =
      role is String ? mapChatMessageRole(role) : ChatMessageRole.assistant;

  return ChatInboundEvent.message(
    role: messageRole,
    content: content,
    pageUrls: _pageUrlsForRole(messageRole, frame),
  );
}

/// Builds a message event from a streamed chunk/delta frame.
///
/// Note: streaming chunks map to the same `message` event as complete
/// messages — stitching the pieces together is handled later by the bloc.
ChatInboundEvent? _mapStreamingChunkFrame(Map<String, dynamic> frame) {
  final content = extractChatFrameText(frame);
  if (content == null || content.isEmpty) {
    return null;
  }

  final role = frame['role'];
  final messageRole =
      role is String ? mapChatMessageRole(role) : ChatMessageRole.assistant;

  return ChatInboundEvent.message(
    role: messageRole,
    content: content,
    pageUrls: _pageUrlsForRole(messageRole, frame),
  );
}

bool hasSiteChangePayload(Map<String, dynamic> frame) {
  final payload = frame['payload'];
  if (payload is! Map<String, dynamic>) {
    return false;
  }

  return payload['delta'] == true || payload['backend_dte_delta'] == true;
}

List<String> extractPageUrls(Map<String, dynamic> frame) {
  if (!hasSiteChangePayload(frame)) {
    return const [];
  }

  final payload = frame['payload'];
  if (payload is! Map<String, dynamic>) {
    return const [];
  }

  final pageUrls = payload['page_urls'];
  if (pageUrls is! List) {
    return const [];
  }

  final deduped = <String>[];
  for (final pageUrl in pageUrls) {
    if (pageUrl is! String) {
      continue;
    }

    final trimmed = pageUrl.trim();
    if (trimmed.isEmpty || deduped.contains(trimmed)) {
      continue;
    }

    deduped.add(trimmed);
  }

  return deduped;
}

List<String> _pageUrlsForRole(
  ChatMessageRole role,
  Map<String, dynamic> frame,
) {
  if (role != ChatMessageRole.assistant) {
    return const [];
  }

  return extractPageUrls(frame);
}

/// Builds an error event, tolerating the various shapes the backend may send.
ChatInboundEvent? _mapErrorFrame(Map<String, dynamic> frame) {
  // Pick the first usable error label, falling back through likely keys.
  final error = _stringOrNull(frame['error']) ??
      _stringOrNull(frame['message']) ??
      _stringOrNull(frame['type']);
  if (error == null || error.isEmpty) {
    return null;
  }

  // The extra detail may be a plain string, a nested object, or buried
  // elsewhere in the frame — try each in turn.
  final detail = frame['detail'];
  final detailText = _stringOrNull(detail) ??
      (detail is Map<String, dynamic> ? extractChatFrameText(detail) : null) ??
      extractChatFrameText(frame);

  return ChatInboundEvent.error(
    error: error,
    // Avoid repeating the same text in both fields.
    detail: detailText == error ? null : detailText,
  );
}

/// Maps a backend role string to our [ChatMessageRole].
/// Anything that isn't explicitly "assistant" is treated as the user.
ChatMessageRole mapChatMessageRole(String role) {
  switch (role.toLowerCase()) {
    case 'assistant':
      return ChatMessageRole.assistant;
    case 'user':
    default:
      return ChatMessageRole.user;
  }
}

/// Finds the human-readable text inside a frame, wherever the backend put it.
///
/// Looks in three places, in order:
///   1. Common top-level keys (`content`, `text`, `message`, `body`, `delta`).
///   2. A nested `data` object (searched recursively).
///   3. A nested `payload` object (with a special case for `payload.user`).
/// Returns `null` if no non-empty text is found anywhere.
String? extractChatFrameText(Map<String, dynamic> frame) {
  // 1. Try the usual top-level keys first.
  for (final key in const ['content', 'text', 'message', 'body', 'delta']) {
    final value = frame[key];
    final extracted = _extractText(value);
    if (extracted != null && extracted.isNotEmpty) {
      return extracted;
    }
  }

  // 2. Some frames wrap their content inside a `data` object.
  final nested = frame['data'];
  if (nested is Map<String, dynamic>) {
    final extracted = extractChatFrameText(nested);
    if (extracted != null && extracted.isNotEmpty) {
      return extracted;
    }
  }

  // 3. Others wrap it inside a `payload` object.
  final payload = frame['payload'];
  if (payload is Map<String, dynamic>) {
    // A user's text sometimes lives directly under `payload.user`.
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

/// Pulls text out of a single value, whatever its type.
/// Handles plain strings, objects (checking common text keys), and lists
/// (concatenating every piece — this is how streamed token arrays are joined).
String? _extractText(Object? value) {
  // Plain string: use it directly.
  if (value is String) {
    return value;
  }

  // Object: look for the text under a few common keys.
  if (value is Map) {
    for (final key in const ['content', 'text', 'message', 'value']) {
      final nested = value[key];
      if (nested is String && nested.isNotEmpty) {
        return nested;
      }
    }
  }

  // List: extract each item and stitch the pieces into one string.
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

/// Returns [value] only if it's a string, otherwise `null`. A small guard
/// used to safely read fields that may be missing or the wrong type.
String? _stringOrNull(Object? value) {
  return value is String ? value : null;
}

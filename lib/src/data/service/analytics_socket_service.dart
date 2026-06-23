import 'dart:async';
import 'dart:convert';

import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/models/analytics_event_model.dart';
import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stream_info.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// A parsed message coming off the analytics WebSocket.
sealed class AnalyticsSocketMessage {
  const AnalyticsSocketMessage();
}

/// Backend acknowledged the connection (`{"type":"ready"}`).
class AnalyticsSocketReady extends AnalyticsSocketMessage {
  const AnalyticsSocketReady(this.apikey);
  final String? apikey;
}

/// A live analytics event (`{"type":"analytics_event"}`).
class AnalyticsSocketEvent extends AnalyticsSocketMessage {
  const AnalyticsSocketEvent(this.event);
  final AnalyticsEvent event;
}

/// Keep-alive reply (`{"type":"pong"}`).
class AnalyticsSocketPong extends AnalyticsSocketMessage {
  const AnalyticsSocketPong();
}

/// The socket closed or errored. The owner should re-mint a token and reconnect.
class AnalyticsSocketConnectionLost extends AnalyticsSocketMessage {
  const AnalyticsSocketConnectionLost();
}

/// A live-assist lifecycle event, e.g. `live_chat_opened`
/// (`{"type":"live_assist_event"}`). Carries a `conversation_id`.
class AnalyticsSocketLiveAssistEvent extends AnalyticsSocketMessage {
  const AnalyticsSocketLiveAssistEvent(this.event);
  final AnalyticsEvent event;
}

/// A message sent by the visitor (`{"type":"live_visitor_message"}`).
class AnalyticsSocketVisitorMessage extends AnalyticsSocketMessage {
  const AnalyticsSocketVisitorMessage(this.event);
  final AnalyticsEvent event;
}

/// A message sent by the owner, echoed back for confirmation
/// (`{"type":"live_owner_message"}`).
class AnalyticsSocketOwnerMessage extends AnalyticsSocketMessage {
  const AnalyticsSocketOwnerMessage(this.event);
  final AnalyticsEvent event;
}

/// Manages a single live analytics WebSocket connection for one site.
///
/// Modeled on the socket half of `ChatRepositoryImpl`: connect with the token
/// as a query parameter, fan parsed frames out over a broadcast stream, keep
/// the connection alive with periodic pings, and tear everything down safely.
/// Reconnection is orchestrated by the owner (the JWT is short-lived, so a
/// fresh stream-token must be minted first) — this service only reports
/// [AnalyticsSocketConnectionLost].
class AnalyticsSocketService {
  AnalyticsSocketService();

  static const Duration _pingInterval = Duration(seconds: 25);

  WebSocketChannel? _channel;
  StreamSubscription<Object?>? _subscription;
  Timer? _pingTimer;
  bool _disposed = false;

  final StreamController<AnalyticsSocketMessage> _controller =
      StreamController<AnalyticsSocketMessage>.broadcast();

  /// Parsed frames for the owner to listen to.
  Stream<AnalyticsSocketMessage> get messages => _controller.stream;

  /// Opens the WebSocket using [info] and starts the keep-alive ping timer.
  void connect(AnalyticsStreamInfo info) {
    if (_disposed) {
      return;
    }

    // Close any previous connection first so we never leak sockets.
    _teardownConnection();

    try {
      final uri = Uri.parse('${info.wsUrl}?token=${info.token}');
      print('uri: $uri');
      _channel = WebSocketChannel.connect(uri);

      _subscription = _channel!.stream.listen(
        _handleRawFrame,
        onError: (Object error, StackTrace stackTrace) {
          appLogger.w(
            'analytics websocket error',
            error: error,
            stackTrace: stackTrace,
          );
          _notifyConnectionLost();
        },
        onDone: _notifyConnectionLost,
      );

      _pingTimer = Timer.periodic(_pingInterval, (_) => _sendPing());
    } catch (error, stackTrace) {
      appLogger.w(
        'analytics websocket connect failed',
        error: error,
        stackTrace: stackTrace,
      );
      _notifyConnectionLost();
    }
  }

  void _sendPing() {
    try {
      _channel?.sink.add(jsonEncode({'type': 'ping'}));
    } catch (error, stackTrace) {
      appLogger.w(
        'analytics ping failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void _handleRawFrame(Object? raw) {
    if (raw is! String) {
      return;
    }

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) {
        return;
      }

      // TEMP diagnostics: surface the exact frame shape so we can verify the
      // backend's `type` / `conversation_id` against what the app expects.
      final inner = decoded['event'];
      appLogger.d(
        'analytics ws frame: type=${decoded['type']} '
        'innerEventType=${inner is Map ? inner['event_type'] : null} '
        'conversationId=${inner is Map ? inner['conversation_id'] : null}',
      );

      final message = _mapFrame(decoded);
      if (message != null && !_controller.isClosed) {
        _controller.add(message);
      }
    } catch (error, stackTrace) {
      // A single bad frame should never crash the connection.
      appLogger.w(
        'analytics frame parse failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  AnalyticsSocketMessage? _mapFrame(Map<String, dynamic> frame) {
    switch (frame['type']) {
      case 'ready':
        final apikey = frame['apikey'];
        return AnalyticsSocketReady(apikey is String ? apikey : null);
      case 'pong':
        return const AnalyticsSocketPong();
      case 'analytics_event':
        final event = _parseEvent(frame);
        return event == null ? null : AnalyticsSocketEvent(event);
      case 'live_assist_event':
        final event = _parseEvent(frame);
        return event == null ? null : AnalyticsSocketLiveAssistEvent(event);
      case 'live_visitor_message':
        final event = _parseEvent(frame, fallbackType: 'live_visitor_message');
        return event == null ? null : AnalyticsSocketVisitorMessage(event);
      case 'live_owner_message':
        final event = _parseEvent(frame, fallbackType: 'live_owner_message');
        return event == null ? null : AnalyticsSocketOwnerMessage(event);
      default:
        return null;
    }
  }

  /// Parses the nested `event` object into an [AnalyticsEvent].
  /// [fallbackType] is used as `event_type` when the inner object omits it.
  AnalyticsEvent? _parseEvent(
    Map<String, dynamic> frame, {
    String? fallbackType,
  }) {
    final event = frame['event'];
    if (event is! Map<String, dynamic>) {
      return null;
    }
    final json = fallbackType != null && event['event_type'] == null
        ? {...event, 'event_type': fallbackType}
        : event;
    return AnalyticsEventModel.fromJson(json).toEntity();
  }

  void _notifyConnectionLost() {
    _teardownConnection();
    if (!_controller.isClosed) {
      _controller.add(const AnalyticsSocketConnectionLost());
    }
  }

  /// Closes the socket, ping timer and subscription. Safe to call repeatedly.
  void _teardownConnection() {
    _pingTimer?.cancel();
    _pingTimer = null;
    unawaited(_subscription?.cancel());
    _subscription = null;
    unawaited(_channel?.sink.close());
    _channel = null;
  }

  /// Permanently disposes the service (closes the stream too).
  void dispose() {
    _disposed = true;
    _teardownConnection();
    unawaited(_controller.close());
  }
}

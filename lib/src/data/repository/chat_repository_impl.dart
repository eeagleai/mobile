import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/core/logging/chat_frame_logger.dart';
import 'package:eeagle_ai/src/data/repository/chat_inbound_frame_mapper.dart';
import 'package:eeagle_ai/src/data/models/chat_token_response_model.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/chat_inbound_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_session.dart';
import 'package:eeagle_ai/src/domain/repository/chat_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Talks to the eeagle chat backend.
///
/// A chat happens in two steps:
///   1. Ask the REST API for a short-lived chat token ([mintChatToken]).
///   2. Open a WebSocket with that token and exchange live frames
///      ([connectSession] / [sendMessage]). Replies arrive as a stream of
///      [ChatInboundEvent]s that the rest of the app listens to via
///      [watchInboundEvents].
class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._dio);

  /// HTTP client used only for the REST call that mints the chat token.
  final Dio _dio;

  /// The currently open WebSocket connection (null when not connected).
  WebSocketChannel? _channel;

  /// Our listener on the WebSocket's incoming frames; cancelled on disconnect.
  StreamSubscription<Object?>? _subscription;

  /// Fan-out stream of parsed events for the app to listen to.
  /// `broadcast` lets the connection be re-listened to without errors.
  final StreamController<ChatInboundEvent> _inboundController =
      StreamController<ChatInboundEvent>.broadcast();

  /// Step 1: ask the REST API for a chat token + WebSocket URL.
  ///
  /// Returns a [ChatSession] describing where and how to connect, or an
  /// [OperationFailure] if the request fails.
  @override
  TaskEither<OperationFailure, ChatSession> mintChatToken({
    required String apikey,
    required String pageUrl,
    String locale = 'en',
    String model = ApiConfig.defaultChatModel,
    bool newChat = true,
  }) {
    return TaskEither(() async {
      try {
        // POST the site credentials; the backend replies with the token,
        // WebSocket URL and conversation identifiers.
        final response = await _dio.post<Map<String, dynamic>>(
          ApiConfig.chatTokenPath,
          data: {
            'apikey': apikey,
            'page_url': pageUrl,
            'locale': locale,
            'model': model,
            'new_chat': newChat,
          },
        );

        final data = response.data;
        if (data == null) {
          return left(
            const OperationFailure(
              'Failed to start chat. Empty response from server.',
              code: 'empty-response',
            ),
          );
        }

        // Convert the raw JSON DTO into a domain entity before returning.
        return right(ChatTokenResponseModel.fromJson(data).toEntity());
      } on DioException catch (error, stackTrace) {
        appLogger.w('mintChatToken failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure.fromDio(error));
      } catch (error, stackTrace) {
        appLogger.w('mintChatToken failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString()));
      }
    });
  }

  /// Step 2: open the WebSocket using the token from [mintChatToken] and
  /// announce ourselves to the backend.
  @override
  TaskEither<OperationFailure, Unit> connectSession({
    required ChatSession session,
    required String apikey,
    required String pageUrl,
    required String model,
  }) {
    return TaskEither(() async {
      try {
        // Close any previous connection first so we never leak sockets.
        await _disconnectInternal();

        // The token is passed as a query parameter on the WebSocket URL.
        final uri = Uri.parse('${session.wsUrl}?token=${session.token}');
        _channel = WebSocketChannel.connect(uri);

        // Listen for incoming frames and forward connection problems to the
        // app as error events so the UI can react (e.g. reconnect/show error).
        _subscription = _channel!.stream.listen(
          _handleRawFrame,
          onError: (Object error, StackTrace stackTrace) {
            appLogger.w('chat websocket error', error: error, stackTrace: stackTrace);
            _inboundController.add(
              ChatInboundEvent.error(error: error.toString()),
            );
          },
          onDone: () {
            // Server (or network) closed the socket.
            _inboundController.add(
              const ChatInboundEvent.error(error: 'Chat connection closed.'),
            );
          },
        );

        // Handshake frame 1: subscribe to this conversation's updates.
        _sendFrame({
          'type': 'subscribe',
          'apikey': apikey,
          'conversation_id': session.conversationId,
          'conversation_session_id': session.conversationSessionId,
        });

        // Handshake frame 2: initialise the chat with the chosen model/page.
        // `chat_only_mode` tells the backend we only want the chat (no extras).
        _sendFrame({
          'type': 'init',
          'apikey': apikey,
          'model': model,
          'page': pageUrl,
          'conversation_id': session.conversationId,
          'conversation_session_id': session.conversationSessionId,
          'chat_only_mode': false,
        });

        return right(unit);
      } catch (error, stackTrace) {
        appLogger.w('connectSession failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString(), code: 'websocket-connect'));
      }
    });
  }

  /// Sends a user message over the open WebSocket.
  ///
  /// Fails fast with `not-connected` if [connectSession] hasn't run yet.
  /// The assistant's reply arrives later through [watchInboundEvents].
  @override
  TaskEither<OperationFailure, Unit> sendMessage({
    required String text,
    required String conversationSessionId,
  }) {
    return TaskEither(() async {
      // Guard: there is nothing to send a message over if not connected.
      if (_channel == null) {
        return left(
          const OperationFailure(
            'Chat is not connected.',
            code: 'not-connected',
          ),
        );
      }

      try {
        _sendFrame({
          'type': 'message',
          'text': text,
          'conversation_session_id': conversationSessionId,
          'chat_only_mode': false,
        });
        return right(unit);
      } catch (error, stackTrace) {
        appLogger.w('sendMessage failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString(), code: 'send-message'));
      }
    });
  }

  /// Closes the chat connection (e.g. when the user leaves the screen).
  @override
  TaskEither<OperationFailure, Unit> disconnectSession() {
    return TaskEither(() async {
      await _disconnectInternal();
      return right(unit);
    });
  }

  /// Stream of parsed assistant events for the bloc/UI to listen to.
  @override
  Stream<ChatInboundEvent> watchInboundEvents() => _inboundController.stream;

  /// Encodes [frame] as JSON and writes it to the socket (no-op if closed).
  void _sendFrame(Map<String, dynamic> frame) {
    logOutboundChatFrame(frame);
    _channel?.sink.add(jsonEncode(frame));
  }

  /// Handles one raw frame coming off the WebSocket.
  ///
  /// Frames arrive as JSON strings. We decode each one, translate it into a
  /// domain [ChatInboundEvent], and push it onto [_inboundController].
  void _handleRawFrame(Object? raw) {
    // We only understand text frames; ignore anything else (e.g. binary).
    if (raw is! String) {
      return;
    }

    try {
      final decoded = jsonDecode(raw);
      // Skip frames that aren't a JSON object.
      if (decoded is! Map<String, dynamic>) {
        return;
      }

      final event = mapChatInboundFrame(decoded);
      logInboundChatFrame(
        decoded,
        mappedEventType: event?.runtimeType.toString(),
      );

      if (event != null) {
        _inboundController.add(event);
      }
    } catch (error, stackTrace) {
      // A single bad frame should never crash the connection.
      appLogger.w('chat frame parse failed', error: error, stackTrace: stackTrace);
    }
  }

  /// Tears down the current connection: stop listening, then close the socket.
  /// Safe to call repeatedly, even when nothing is connected.
  Future<void> _disconnectInternal() async {
    await _subscription?.cancel();
    _subscription = null;
    await _channel?.sink.close();
    _channel = null;
  }
}

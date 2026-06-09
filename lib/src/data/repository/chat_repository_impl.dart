import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/repository/chat_inbound_frame_mapper.dart';
import 'package:eeagle_ai/src/data/models/chat_token_response_model.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/chat_inbound_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_session.dart';
import 'package:eeagle_ai/src/domain/repository/chat_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._dio);

  final Dio _dio;
  WebSocketChannel? _channel;
  StreamSubscription<Object?>? _subscription;
  final StreamController<ChatInboundEvent> _inboundController =
      StreamController<ChatInboundEvent>.broadcast();

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

  @override
  TaskEither<OperationFailure, Unit> connectSession({
    required ChatSession session,
    required String apikey,
    required String pageUrl,
    required String model,
  }) {
    return TaskEither(() async {
      try {
        await _disconnectInternal();

        final uri = Uri.parse('${session.wsUrl}?token=${session.token}');
        _channel = WebSocketChannel.connect(uri);

        _subscription = _channel!.stream.listen(
          _handleRawFrame,
          onError: (Object error, StackTrace stackTrace) {
            appLogger.w('chat websocket error', error: error, stackTrace: stackTrace);
            _inboundController.add(
              ChatInboundEvent.error(error: error.toString()),
            );
          },
          onDone: () {
            _inboundController.add(
              const ChatInboundEvent.error(error: 'Chat connection closed.'),
            );
          },
        );

        _sendFrame({
          'type': 'subscribe',
          'apikey': apikey,
          'conversation_id': session.conversationId,
          'conversation_session_id': session.conversationSessionId,
        });

        _sendFrame({
          'type': 'init',
          'apikey': apikey,
          'model': model,
          'page': pageUrl,
          'conversation_id': session.conversationId,
          'conversation_session_id': session.conversationSessionId,
          'chat_only_mode': true,
        });

        return right(unit);
      } catch (error, stackTrace) {
        appLogger.w('connectSession failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString(), code: 'websocket-connect'));
      }
    });
  }

  @override
  TaskEither<OperationFailure, Unit> sendMessage({
    required String text,
    required String conversationSessionId,
  }) {
    return TaskEither(() async {
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
          'chat_only_mode': true,
        });
        return right(unit);
      } catch (error, stackTrace) {
        appLogger.w('sendMessage failed', error: error, stackTrace: stackTrace);
        return left(OperationFailure(error.toString(), code: 'send-message'));
      }
    });
  }

  @override
  TaskEither<OperationFailure, Unit> disconnectSession() {
    return TaskEither(() async {
      await _disconnectInternal();
      return right(unit);
    });
  }

  @override
  Stream<ChatInboundEvent> watchInboundEvents() => _inboundController.stream;

  void _sendFrame(Map<String, dynamic> frame) {
    _channel?.sink.add(jsonEncode(frame));
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

      final event = mapChatInboundFrame(decoded);
      if (event != null) {
        _inboundController.add(event);
      } else if (!_isHeartbeatFrame(decoded['type'])) {
        appLogger.d('chat frame ignored: $decoded');
      }
    } catch (error, stackTrace) {
      appLogger.w('chat frame parse failed', error: error, stackTrace: stackTrace);
    }
  }

  bool _isHeartbeatFrame(Object? type) {
    return type == 'ping' || type == 'pong';
  }

  Future<void> _disconnectInternal() async {
    await _subscription?.cancel();
    _subscription = null;
    await _channel?.sink.close();
    _channel = null;
  }
}

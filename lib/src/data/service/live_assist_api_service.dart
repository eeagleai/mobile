import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/core/logging/app_logger.dart';
import 'package:eeagle_ai/src/data/models/live_assist_send_response_model.dart';

/// Thin REST wrapper for the live-assist (owner ⇄ visitor chat) endpoints.
///
/// Bearer auth is added automatically by the shared [Dio]'s `AuthInterceptor`.
/// Errors propagate as [DioException]s for the repository to map.
class LiveAssistApiService {
  LiveAssistApiService(this._dio);

  final Dio _dio;

  Future<LiveAssistSendResponseModel> send({
    required String apikey,
    required String conversationId,
    required String message,
  }) async {
    // The endpoint may reply with a JSON object, a JSON string, or an empty
    // body. Read it untyped and parse defensively, falling back to the HTTP
    // status (200 → ok, 202 → queued).
    final payload = {
      'apikey': apikey,
      'conversation_id': conversationId,
      'message': message,
    };
    appLogger.d('live-assist send → ${ApiConfig.liveAssistSendPath} $payload');

    final response = await _dio.post<dynamic>(
      ApiConfig.liveAssistSendPath,
      data: payload,
    );
    print('response: ${response.statusCode}');

    appLogger.d(
      'live-assist send ← status=${response.statusCode} body=${response.data}',
    );

    final parsed = _parseBody(response.data);
    if (parsed != null) {
      return LiveAssistSendResponseModel.fromJson(parsed);
    }

    return LiveAssistSendResponseModel(
      status: response.statusCode == 202 ? 'queued' : 'ok',
    );
  }

  Map<String, dynamic>? _parseBody(Object? data) {
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is String && data.trim().isNotEmpty) {
      try {
        final decoded = jsonDecode(data);
        if (decoded is Map<String, dynamic>) {
          return decoded;
        }
      } catch (_) {
        // Not JSON — fall back to the HTTP status code.
      }
    }
    return null;
  }
}

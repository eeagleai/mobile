import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/data/service/live_assist_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

void main() {
  late _MockDio dio;
  late LiveAssistApiService service;

  setUp(() {
    dio = _MockDio();
    service = LiveAssistApiService(dio);
  });

  test('send posts conversation_id (not conversation_session_id)', () async {
    when(
      () => dio.post<dynamic>(
        ApiConfig.liveAssistSendPath,
        data: any(named: 'data'),
      ),
    ).thenAnswer(
      (_) async => Response<dynamic>(
        data: {'status': 'ok'},
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConfig.liveAssistSendPath),
      ),
    );

    await service.send(
      apikey: 'site-key',
      conversationId: 'conv-123',
      message: 'Hello visitor',
    );

    final captured = verify(
      () => dio.post<dynamic>(
        ApiConfig.liveAssistSendPath,
        data: captureAny(named: 'data'),
      ),
    ).captured.single as Map<String, dynamic>;

    expect(captured['conversation_id'], 'conv-123');
    expect(captured.containsKey('conversation_session_id'), isFalse);
    expect(captured['apikey'], 'site-key');
    expect(captured['message'], 'Hello visitor');
  });
}

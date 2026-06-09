import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/data/repository/chat_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

void main() {
  late _MockDio dio;
  late ChatRepositoryImpl repository;

  setUp(() {
    dio = _MockDio();
    repository = ChatRepositoryImpl(dio);
  });

  test('maps chat token response to ChatSession entity', () async {
    when(
      () => dio.post<Map<String, dynamic>>(
        ApiConfig.chatTokenPath,
        data: any(named: 'data'),
      ),
    ).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: {
          'token': 'chat-jwt',
          'ws_url': 'wss://chat.eeagle.ai/ws',
          'conversation_id': 'conv-1',
          'conversation_session_id': 'sess-1',
          'route_key': '/',
          'config': {
            'pageCaptureEnabled': true,
            'maxPageContentLength': 120000,
            'liveEditEnabled': true,
            'canLiveEdit': true,
            'remaining': 9,
          },
        },
        requestOptions: RequestOptions(path: ApiConfig.chatTokenPath),
      ),
    );

    final result = await repository
        .mintChatToken(
          apikey: 'site-key',
          pageUrl: 'https://demo.eeagle.ai/',
        )
        .run();

    expect(result.isRight(), isTrue);
    result.match((_) => fail('expected success'), (session) {
      expect(session.token, 'chat-jwt');
      expect(session.wsUrl, 'wss://chat.eeagle.ai/ws');
      expect(session.conversationId, 'conv-1');
      expect(session.conversationSessionId, 'sess-1');
      expect(session.config.remaining, 9);
    });
  });

  test('maps dio failures when minting chat token', () async {
    when(
      () => dio.post<Map<String, dynamic>>(
        ApiConfig.chatTokenPath,
        data: any(named: 'data'),
      ),
    ).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: ApiConfig.chatTokenPath),
        response: Response<Map<String, dynamic>>(
          statusCode: 500,
          requestOptions: RequestOptions(path: ApiConfig.chatTokenPath),
        ),
        type: DioExceptionType.badResponse,
      ),
    );

    final result = await repository
        .mintChatToken(
          apikey: 'site-key',
          pageUrl: 'https://demo.eeagle.ai/',
        )
        .run();

    expect(result.isLeft(), isTrue);
  });
}

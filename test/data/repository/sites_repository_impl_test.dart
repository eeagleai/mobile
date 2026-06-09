import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/data/repository/sites_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

void main() {
  late _MockDio dio;
  late SitesRepositoryImpl repository;

  setUp(() {
    dio = _MockDio();
    repository = SitesRepositoryImpl(dio);
  });

  test('maps sites response items to domain entities', () async {
    when(
      () => dio.get<Map<String, dynamic>>(ApiConfig.sitesPath),
    ).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: {
          'items': [
            {
              'apikey': 'site-key-1',
              'site_id': 'site-1',
              'name': 'Example Site',
              'host': 'example.com',
              'subscription_status': 'active',
              'quota': {'remaining': 9},
            },
          ],
        },
        requestOptions: RequestOptions(path: ApiConfig.sitesPath),
      ),
    );

    final result = await repository.getSites().run();

    expect(result.isRight(), isTrue);
    result.match((_) => fail('expected success'), (sites) {
      expect(sites, hasLength(1));
      expect(sites.first.apikey, 'site-key-1');
      expect(sites.first.name, 'Example Site');
      expect(sites.first.host, 'example.com');
      expect(sites.first.quotaRemaining, 9);
    });
  });

  test('maps dio failures', () async {
    when(
      () => dio.get<Map<String, dynamic>>(ApiConfig.sitesPath),
    ).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: ApiConfig.sitesPath),
        response: Response<Map<String, dynamic>>(
          statusCode: 500,
          requestOptions: RequestOptions(path: ApiConfig.sitesPath),
        ),
        type: DioExceptionType.badResponse,
      ),
    );

    final result = await repository.getSites().run();

    expect(result.isLeft(), isTrue);
  });
}

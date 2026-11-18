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
    when(() => dio.get<Map<String, dynamic>>(ApiConfig.sitesPath)).thenAnswer(
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
    when(() => dio.get<Map<String, dynamic>>(ApiConfig.sitesPath)).thenThrow(
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

  test('maps site revision history', () async {
    final path = ApiConfig.siteRevisionsPath('site/key');
    when(() => dio.get<Map<String, dynamic>>(path)).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: {
          'items': [
            {
              'id': 'revision-1',
              'apikey': 'site/key',
              'sha256': 'sha-1',
              'bytes': 18432,
              'kind': 'frontend',
              'user_summary': 'Improve the homepage CTA',
              'created_at_iso': '2026-07-14T10:15:00.000Z',
              'change_id': 'change-1',
              'quota_consumed': true,
            },
            {
              'id': 'revision-2',
              'apikey': 'site/key',
              'sha256': 'sha-2',
              'kind': 'backend',
              'created_at_iso': '2026-07-13T09:00:00.000Z',
            },
          ],
        },
        requestOptions: RequestOptions(path: path),
      ),
    );

    final result = await repository.getSiteRevisions('site/key').run();

    expect(result.isRight(), isTrue);
    result.match((_) => fail('expected success'), (revisions) {
      expect(revisions, hasLength(2));
      expect(revisions.first.id, 'revision-1');
      expect(revisions.first.userSummary, 'Improve the homepage CTA');
      expect(revisions.first.quotaConsumed, isTrue);
      expect(revisions.last.isBackend, isTrue);
    });
    verify(() => dio.get<Map<String, dynamic>>(path)).called(1);
  });

  test('maps rollback result and updated quota', () async {
    final path = ApiConfig.siteRollbackPath('site/key', 'revision/1');
    when(() => dio.post<Map<String, dynamic>>(path)).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: {
          'status': 'ok',
          'rolled_back_to': 'revision/1',
          'sha256': 'sha-1',
          'kind': 'frontend',
          'quota_refunded': true,
          'quota': {'remaining': 9},
          'reload': {'dte': true},
        },
        requestOptions: RequestOptions(path: path),
      ),
    );

    final result = await repository
        .rollbackSiteRevision(
          siteApiKey: 'site/key',
          revisionIdOrSha: 'revision/1',
        )
        .run();

    expect(result.isRight(), isTrue);
    result.match((_) => fail('expected success'), (rollback) {
      expect(rollback.rolledBackTo, 'revision/1');
      expect(rollback.kind, 'frontend');
      expect(rollback.quotaRefunded, isTrue);
      expect(rollback.quotaRemaining, 9);
      expect(rollback.reloadSucceeded, isTrue);
    });
    verify(() => dio.post<Map<String, dynamic>>(path)).called(1);
  });

  const rollbackErrors = <int, String>{
    402: 'change credits',
    403: 'permission',
    404: 'no longer available',
    422: 'cannot be restored safely',
    423: 'locked',
  };

  for (final entry in rollbackErrors.entries) {
    test('maps rollback ${entry.key} to a clear message', () async {
      final path = ApiConfig.siteRollbackPath('site-key', 'revision-1');
      when(() => dio.post<Map<String, dynamic>>(path)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: path),
          response: Response<Map<String, dynamic>>(
            statusCode: entry.key,
            data: entry.key == 423
                ? {'error': 'account_locked', 'message': 'Account is locked.'}
                : {'error': 'rollback_error'},
            requestOptions: RequestOptions(path: path),
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      final result = await repository
          .rollbackSiteRevision(
            siteApiKey: 'site-key',
            revisionIdOrSha: 'revision-1',
          )
          .run();

      result.match(
        (failure) =>
            expect(failure.message.toLowerCase(), contains(entry.value)),
        (_) => fail('expected failure'),
      );
    });
  }
}

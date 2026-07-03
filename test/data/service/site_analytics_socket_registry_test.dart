import 'package:eeagle_ai/src/data/service/analytics_socket_service.dart';
import 'package:eeagle_ai/src/data/service/site_analytics_socket_registry.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stream_info.dart';
import 'package:flutter_test/flutter_test.dart';

const _streamInfo = AnalyticsStreamInfo(
  apikey: 'site-key',
  token: 'jwt',
  wsUrl: 'wss://example.test/ws',
);

class _TestAnalyticsSocketService extends AnalyticsSocketService {
  int connectCount = 0;
  AnalyticsStreamInfo? lastInfo;
  bool disposeCalled = false;

  @override
  void connect(AnalyticsStreamInfo info) {
    connectCount++;
    lastInfo = info;
  }

  @override
  void dispose() {
    disposeCalled = true;
    super.dispose();
  }
}

void main() {
  late _TestAnalyticsSocketService service;
  late SiteAnalyticsSocketRegistry registry;

  setUp(() {
    service = _TestAnalyticsSocketService();
    registry = SiteAnalyticsSocketRegistry(
      serviceFactory: () => service,
    );
  });

  test('acquire connects once and increments ref count', () async {
    var mintCalls = 0;
    await registry.acquire('site-key', () async {
      mintCalls++;
      return _streamInfo;
    });

    expect(mintCalls, 1);
    expect(service.connectCount, 1);
    expect(service.lastInfo, _streamInfo);
    expect(registry.refCountFor('site-key'), 1);
  });

  test('second acquire reuses socket without reminting', () async {
    var mintCalls = 0;
    Future<AnalyticsStreamInfo> mint() async {
      mintCalls++;
      return _streamInfo;
    }

    await registry.acquire('site-key', mint);
    await registry.acquire('site-key', mint);

    expect(mintCalls, 1);
    expect(service.connectCount, 1);
    expect(registry.refCountFor('site-key'), 2);
  });

  test('release disposes when ref count reaches zero', () async {
    await registry.acquire('site-key', () async => _streamInfo);
    await registry.acquire('site-key', () async => _streamInfo);

    registry.release('site-key');
    expect(registry.refCountFor('site-key'), 1);
    expect(service.disposeCalled, isFalse);

    registry.release('site-key');
    expect(registry.refCountFor('site-key'), 0);
    expect(service.disposeCalled, isTrue);
    expect(registry.hasActiveLease('site-key'), isFalse);
  });

  test('watch exposes message stream without acquire', () {
    expect(registry.watch('site-key'), isA<Stream<AnalyticsSocketMessage>>());
    expect(registry.refCountFor('site-key'), 0);
  });

  test('reconnect remints when lease is active', () async {
    var mintCalls = 0;
    await registry.acquire('site-key', () async {
      mintCalls++;
      return _streamInfo;
    });

    await registry.reconnect('site-key', () async {
      mintCalls++;
      return _streamInfo;
    });

    expect(mintCalls, 2);
    expect(service.connectCount, 2);
  });

  test('connectionStatusFor reflects lease and connection state', () async {
    expect(
      registry.connectionStatusFor('site-key'),
      AnalyticsConnectionStatus.offline,
    );

    await registry.acquire('site-key', () async => _streamInfo);
    expect(
      registry.connectionStatusFor('site-key'),
      AnalyticsConnectionStatus.reconnecting,
    );
  });

  test('releaseAll clears active leases', () async {
    await registry.acquire('site-key', () async => _streamInfo);
    await registry.acquire('other-key', () async => _streamInfo);

    registry.releaseAll();

    expect(registry.activeApikeys, isEmpty);
    expect(service.disposeCalled, isTrue);
  });
}

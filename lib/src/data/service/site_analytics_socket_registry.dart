import 'package:eeagle_ai/src/data/service/analytics_socket_service.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/analytics_stream_info.dart';
import 'package:flutter/foundation.dart';

class _SiteSocketLease {
  _SiteSocketLease(this.service);

  final AnalyticsSocketService service;
  int refCount = 0;
}

/// One shared [AnalyticsSocketService] per site [apikey], ref-counted.
class SiteAnalyticsSocketRegistry {
  SiteAnalyticsSocketRegistry({
    AnalyticsSocketService Function()? serviceFactory,
  }) : _serviceFactory = serviceFactory ?? AnalyticsSocketService.new;

  final AnalyticsSocketService Function() _serviceFactory;
  final Map<String, _SiteSocketLease> _leases = {};

  Stream<AnalyticsSocketMessage> watch(String apikey) {
    final lease = _leases.putIfAbsent(
      apikey,
      () => _SiteSocketLease(_serviceFactory()),
    );
    return lease.service.messages;
  }

  bool hasOpenConnection(String apikey) {
    final lease = _leases[apikey];
    return lease != null && lease.service.hasOpenConnection;
  }

  AnalyticsConnectionStatus connectionStatusFor(String apikey) {
    if (hasOpenConnection(apikey)) {
      return AnalyticsConnectionStatus.live;
    }
    final lease = _leases[apikey];
    if (lease != null && lease.refCount > 0) {
      return AnalyticsConnectionStatus.reconnecting;
    }
    return AnalyticsConnectionStatus.offline;
  }

  Future<void> acquire(
    String apikey,
    Future<AnalyticsStreamInfo> Function() mintToken,
  ) async {
    final lease = _leases.putIfAbsent(
      apikey,
      () => _SiteSocketLease(_serviceFactory()),
    );

    lease.refCount += 1;
    if (lease.refCount == 1) {
      final info = await mintToken();
      lease.service.connect(info);
    }
  }

  void release(String apikey) {
    final lease = _leases[apikey];
    if (lease == null) {
      return;
    }

    lease.refCount -= 1;
    if (lease.refCount <= 0) {
      lease.refCount = 0;
      lease.service.dispose();
      _leases.remove(apikey);
    }
  }

  Future<void> reconnect(
    String apikey,
    Future<AnalyticsStreamInfo> Function() mintToken,
  ) async {
    final lease = _leases[apikey];
    if (lease == null || lease.refCount <= 0) {
      return;
    }

    final info = await mintToken();
    lease.service.connect(info);
  }

  void releaseAll() {
    for (final apikey in _leases.keys.toList()) {
      while (hasActiveLease(apikey)) {
        release(apikey);
      }
    }
  }

  Iterable<String> get activeApikeys =>
      _leases.entries.where((e) => e.value.refCount > 0).map((e) => e.key);

  @visibleForTesting
  int refCountFor(String apikey) => _leases[apikey]?.refCount ?? 0;

  @visibleForTesting
  bool hasActiveLease(String apikey) =>
      (_leases[apikey]?.refCount ?? 0) > 0;
}


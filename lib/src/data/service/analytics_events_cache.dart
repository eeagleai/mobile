import 'dart:async';

import 'package:eeagle_ai/src/domain/model/analytics_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_event_classifier.dart';

/// In-memory ring buffer of non-chat analytics events per site.
class AnalyticsEventsCache {
  AnalyticsEventsCache({this.maxEventsPerSite = 200});

  final int maxEventsPerSite;
  final Map<String, List<AnalyticsEvent>> _eventsByApikey = {};
  final Map<String, StreamController<List<AnalyticsEvent>>> _controllers = {};

  Stream<List<AnalyticsEvent>> watch(String apikey) {
    final controller = _controllers.putIfAbsent(
      apikey,
      () => StreamController<List<AnalyticsEvent>>.broadcast(),
    );
    controller.add(List.unmodifiable(_eventsByApikey[apikey] ?? const []));
    return controller.stream;
  }

  List<AnalyticsEvent> snapshot(String apikey) =>
      List.unmodifiable(_eventsByApikey[apikey] ?? const []);

  void append(String apikey, AnalyticsEvent event) {
    if (!isAnalyticsOnlyEvent(event)) {
      return;
    }

    final current = [...?_eventsByApikey[apikey]];
    current.insert(0, event);
    if (current.length > maxEventsPerSite) {
      current.removeRange(maxEventsPerSite, current.length);
    }
    _eventsByApikey[apikey] = current;
    _controllers[apikey]?.add(List.unmodifiable(current));
  }

  void mergeRestSnapshot(String apikey, List<AnalyticsEvent> restEvents) {
    final nonChat = restEvents.where(isAnalyticsOnlyEvent).toList();
    final socketLive = _eventsByApikey[apikey] ?? const <AnalyticsEvent>[];
    final merged = _dedupeAndSort([...socketLive, ...nonChat]);
    _eventsByApikey[apikey] = merged;
    _controllers[apikey]?.add(List.unmodifiable(merged));
  }

  void clear() {
    _eventsByApikey.clear();
    for (final controller in _controllers.values) {
      controller.add(const []);
    }
  }

  List<AnalyticsEvent> _dedupeAndSort(List<AnalyticsEvent> events) {
    final seen = <String>{};
    final unique = <AnalyticsEvent>[];
    for (final event in events) {
      final key = _eventKey(event);
      if (seen.add(key)) {
        unique.add(event);
      }
    }
    unique.sort((a, b) {
      final aTime = a.createdAt;
      final bTime = b.createdAt;
      if (aTime == null && bTime == null) {
        return 0;
      }
      if (aTime == null) {
        return 1;
      }
      if (bTime == null) {
        return -1;
      }
      return bTime.compareTo(aTime);
    });
    if (unique.length > maxEventsPerSite) {
      return unique.sublist(0, maxEventsPerSite);
    }
    return unique;
  }

  String _eventKey(AnalyticsEvent event) {
    return [
      event.eventType,
      event.conversationId,
      event.visitId,
      event.pageUrl,
      event.createdAt?.toIso8601String(),
      event.message,
    ].join('|');
  }
}


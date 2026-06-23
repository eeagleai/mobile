/// Lightweight, dependency-free formatting for analytics timestamps.
class AnalyticsTimeFormat {
  AnalyticsTimeFormat._();

  /// Short relative label, e.g. "just now", "5m ago", "3h ago", "2d ago".
  /// Falls back to an absolute date for anything older than a week.
  static String relative(DateTime? time, {DateTime? now}) {
    if (time == null) {
      return '—';
    }

    final reference = now ?? DateTime.now();
    final local = time.toLocal();
    final diff = reference.difference(local);

    if (diff.isNegative) {
      return 'just now';
    }
    if (diff.inSeconds < 45) {
      return 'just now';
    }
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    }
    if (diff.inDays < 7) {
      return '${diff.inDays}d ago';
    }
    return absolute(local);
  }

  /// Absolute `YYYY-MM-DD HH:MM` in local time.
  static String absolute(DateTime? time) {
    if (time == null) {
      return '—';
    }
    final local = time.toLocal();
    final y = local.year.toString().padLeft(4, '0');
    final mo = local.month.toString().padLeft(2, '0');
    final d = local.day.toString().padLeft(2, '0');
    final h = local.hour.toString().padLeft(2, '0');
    final mi = local.minute.toString().padLeft(2, '0');
    return '$y-$mo-$d $h:$mi';
  }
}

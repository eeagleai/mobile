class SiteRollbackResult {
  const SiteRollbackResult({
    required this.rolledBackTo,
    required this.kind,
    required this.quotaRefunded,
    required this.reloadSucceeded,
    this.sha256,
    this.quotaRemaining,
  });

  final String rolledBackTo;
  final String kind;
  final bool quotaRefunded;
  final bool reloadSucceeded;
  final String? sha256;
  final int? quotaRemaining;
}

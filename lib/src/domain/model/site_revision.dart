class SiteRevision {
  const SiteRevision({
    required this.id,
    required this.sha256,
    required this.kind,
    required this.createdAt,
    this.userSummary,
    this.changeId,
    this.bytes,
    this.quotaConsumed = false,
  });

  final String id;
  final String sha256;
  final String kind;
  final DateTime createdAt;
  final String? userSummary;
  final String? changeId;
  final int? bytes;
  final bool quotaConsumed;

  bool get isBackend => kind.toLowerCase() == 'backend';
}

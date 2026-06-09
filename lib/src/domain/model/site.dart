class Site {
  const Site({
    required this.apikey,
    required this.siteId,
    required this.name,
    required this.host,
    this.subscriptionStatus,
    this.quotaRemaining,
  });

  final String apikey;
  final String siteId;
  final String name;
  final String host;
  final String? subscriptionStatus;
  final int? quotaRemaining;
}

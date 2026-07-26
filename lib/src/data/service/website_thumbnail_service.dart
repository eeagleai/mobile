class WebsiteThumbnailService {
  WebsiteThumbnailService._();

  static String thumbnailUrl(String host) {
    final trimmedHost = host.trim();
    final websiteUrl =
        trimmedHost.startsWith('http://') || trimmedHost.startsWith('https://')
        ? trimmedHost
        : 'https://$trimmedHost';

    return 'https://image.thum.io/get/'
        'width/240/crop/720/noanimate/maxAge/24/$websiteUrl';
  }
}

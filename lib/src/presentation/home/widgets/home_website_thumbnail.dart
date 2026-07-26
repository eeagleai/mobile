import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:flutter/material.dart';

class HomeWebsiteThumbnail extends StatelessWidget {
  const HomeWebsiteThumbnail({
    super.key,
    required this.site,
    this.size = 56,
    this.borderRadius = 10,
  });

  final Site site;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = site.thumbnailUrl;

    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF1D2B45),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: thumbnailUrl == null || thumbnailUrl.isEmpty
          ? const _WebsiteThumbnailFallback()
          : Image.network(
              thumbnailUrl,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.medium,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded || frame != null) {
                  return child;
                }
                return const _WebsiteThumbnailFallback(showLoader: true);
              },
              errorBuilder: (_, _, _) => const _WebsiteThumbnailFallback(),
            ),
    );
  }
}

class _WebsiteThumbnailFallback extends StatelessWidget {
  const _WebsiteThumbnailFallback({this.showLoader = false});

  final bool showLoader;

  @override
  Widget build(BuildContext context) {
    if (showLoader) {
      return const Center(
        child: SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Color(0xFF5C91FF),
          ),
        ),
      );
    }

    return const Icon(Icons.language_rounded, color: Color(0xFF5C91FF));
  }
}

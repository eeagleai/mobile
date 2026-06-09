import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeSiteListTileShimmer extends StatelessWidget {
  const HomeSiteListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.chipBorder, width: 0.5),
      ),
      child: Shimmer.fromColors(
        baseColor: colors.chipBorder.withValues(alpha: 0.35),
        highlightColor: colors.foregroundSecondary.withValues(alpha: 0.25),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ShimmerBox(width: 160, height: 14, radius: 6),
                  const SizedBox(height: 10),
                  _ShimmerBox(width: 120, height: 12, radius: 6),
                  const SizedBox(height: 10),
                  _ShimmerBox(width: 100, height: 10, radius: 6),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _ShimmerBox(width: 20, height: 20, radius: 10),
          ],
        ),
      ),
    );
  }
}

class HomeSitesShimmerList extends StatelessWidget {
  const HomeSitesShimmerList({
    super.key,
    this.itemCount = 5,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      itemCount: itemCount,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => const HomeSiteListTileShimmer(),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  const _ShimmerBox({
    required this.width,
    required this.height,
    required this.radius,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

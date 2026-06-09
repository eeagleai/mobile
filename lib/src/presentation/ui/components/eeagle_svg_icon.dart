import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class EeagleSvgIcon extends StatelessWidget {
  const EeagleSvgIcon({
    super.key,
    required this.icon,
    this.size = 24,
    this.width,
    this.height,
  });

  final SvgGenImage icon;
  final double size;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final resolvedWidth = width ?? size;
    final resolvedHeight = height ?? size;

    return SizedBox(
      width: resolvedWidth,
      height: resolvedHeight,
      child: icon.svg(
        width: resolvedWidth,
        height: resolvedHeight,
        fit: BoxFit.contain,
      ),
    );
  }
}

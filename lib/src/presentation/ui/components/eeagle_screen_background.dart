import 'dart:ui';

import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:flutter/material.dart';

class EeagleScreenBackground extends StatelessWidget {
  const EeagleScreenBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      color: colors.screenBackground,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -145,
            left: width * 0.25,
            child: _GlowBlob(color: const Color(0xFF0050FF), size: 270),
          ),
          Positioned(
            top: -280,
            left: width * 0.5 + 63,
            child: _GlowBlob(color: const Color(0xFF2563EB), size: 208),
          ),
          Positioned(
            top: -90,
            left: -83,
            child: _GlowBlob(color: const Color(0xFF3B82F6), size: 219),
          ),
          Positioned(
            top: -269,
            left: -13,
            child: _GlowBlob(color: const Color(0xFF2563EB), size: 219),
          ),
        ],
      ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  const _GlowBlob({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 65, sigmaY: 65),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}

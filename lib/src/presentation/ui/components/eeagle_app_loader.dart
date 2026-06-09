import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EeagleAppLoader extends StatelessWidget {
  const EeagleAppLoader({
    super.key,
    this.size = 72,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final loaderColor =
        color ?? EeagleTheme.of(context).colors.palette.primary.shade500;

    return LoadingAnimationWidget.dotsTriangle(
      color: loaderColor,
      size: size,
    );
  }
}

class EeagleAppLoadingView extends StatelessWidget {
  const EeagleAppLoadingView({
    super.key,
    this.size = 96,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EeagleAppLoader(
        size: size,
        color: color,
      ),
    );
  }
}

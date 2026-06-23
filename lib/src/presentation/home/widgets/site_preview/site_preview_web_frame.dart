import 'package:eeagle_ai/src/presentation/ui/components/eeagle_app_loader.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final Set<Factory<OneSequenceGestureRecognizer>> sitePreviewWebViewRecognizers =
    {
  Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer()),
};

class SitePreviewWebFrame extends StatelessWidget {
  const SitePreviewWebFrame({
    super.key,
    required this.controller,
    required this.isLoading,
  });

  final WebViewController controller;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.palette.natural.shade900,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colors.chipBorder, width: 0.5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              WebViewWidget(
                controller: controller,
                gestureRecognizers: sitePreviewWebViewRecognizers,
              ),
              if (isLoading)
                ColoredBox(
                  color: colors.palette.natural.shade900,
                  child: Center(
                    child: EeagleAppLoader(
                      color: colors.palette.primary.shade400,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

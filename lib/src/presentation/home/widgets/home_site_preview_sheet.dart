import 'package:eeagle_ai/src/core/util/page_url_util.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_app_loader.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const _sheetHeaderHeight = 88.0;

final Set<Factory<OneSequenceGestureRecognizer>> _webViewGestureRecognizers = {
  Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer()),
};

Future<void> showHomeSitePreviewSheet(
  BuildContext context, {
  required Site site,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    useSafeArea: true,
    enableDrag: false,
    builder: (sheetContext) => Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: DraggableScrollableSheet(
        initialChildSize: 0.92,
        minChildSize: 0.35,
        maxChildSize: 0.92,
        snap: true,
        snapSizes: const [0.35, 0.92],
        expand: false,
        builder: (context, scrollController) {
          return _HomeSitePreviewSheet(
            site: site,
            scrollController: scrollController,
          );
        },
      ),
    ),
  );
}

class _HomeSitePreviewSheet extends StatefulWidget {
  const _HomeSitePreviewSheet({
    required this.site,
    required this.scrollController,
  });

  final Site site;
  final ScrollController scrollController;

  @override
  State<_HomeSitePreviewSheet> createState() => _HomeSitePreviewSheetState();
}

class _HomeSitePreviewSheetState extends State<_HomeSitePreviewSheet> {
  late final WebViewController _webViewController;
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    final pageUrl = normalizePageUrl(widget.site.host);

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            if (!mounted) {
              return;
            }
            setState(() => _isLoading = true);
          },
          onPageFinished: (_) {
            if (!mounted) {
              return;
            }
            setState(() => _isLoading = false);
          },
          onWebResourceError: (_) {
            if (!mounted) {
              return;
            }
            setState(() => _isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(pageUrl));
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return LayoutBuilder(
      builder: (context, constraints) {
        final webViewHeight = constraints.maxHeight - _sheetHeaderHeight;

        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.inputSurface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: colors.chipBorder, width: 0.5),
          ),
          child: Column(
            children: [
              SizedBox(
                height: _sheetHeaderHeight,
                child: SingleChildScrollView(
                  controller: widget.scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: 36,
                        height: 4,
                        decoration: BoxDecoration(
                          color: colors.foregroundSecondary
                              .withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  EeagleText(
                                    widget.site.name,
                                    style: EeagleTextStyles.titleMedium,
                                    textColor: colors.titleNatural,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  EeagleText(
                                    widget.site.host,
                                    style: EeagleTextStyles.bodySmall,
                                    textColor: colors.foregroundSecondary,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Icon(
                                Icons.close,
                                color: colors.foregroundSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: webViewHeight,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      WebViewWidget(
                        controller: _webViewController,
                        gestureRecognizers: _webViewGestureRecognizers,
                      ),
                      if (_isLoading)
                        ColoredBox(
                          color: colors.inputSurface,
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
            ],
          ),
        );
      },
    );
  }
}

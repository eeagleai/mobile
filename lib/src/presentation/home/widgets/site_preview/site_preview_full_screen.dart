import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_web_frame.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_url_display.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SitePreviewFullScreen extends StatefulWidget {
  const SitePreviewFullScreen({
    super.key,
    required this.initialUrl,
  });

  final String initialUrl;

  @override
  State<SitePreviewFullScreen> createState() => _SitePreviewFullScreenState();
}

class _SitePreviewFullScreenState extends State<SitePreviewFullScreen> {
  late final WebViewController _webViewController;
  var _isLoading = true;
  late String _currentUrl;

  @override
  void initState() {
    super.initState();
    _currentUrl = previewSheetDisplayUrl(widget.initialUrl);

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
          onPageFinished: (url) async {
            if (!mounted) {
              return;
            }
            setState(() {
              _isLoading = false;
              _currentUrl = url;
            });
          },
          onWebResourceError: (_) {
            if (!mounted) {
              return;
            }
            setState(() => _isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(_currentUrl));
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final displayTitle = previewSheetDisplayTitle(_currentUrl);

    return Scaffold(
      backgroundColor: colors.screenBackground,
      appBar: AppBar(
        backgroundColor: colors.screenBackground,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close_rounded, color: colors.foregroundPrimary),
        ),
        title: EeagleText(
          displayTitle,
          style: EeagleTextStyles.titleMedium,
          textColor: colors.titleNatural,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () => _webViewController.reload(),
            icon: Icon(Icons.refresh_rounded, color: colors.foregroundPrimary),
          ),
        ],
      ),
      body: SitePreviewWebFrame(
        controller: _webViewController,
        isLoading: _isLoading,
      ),
    );
  }
}

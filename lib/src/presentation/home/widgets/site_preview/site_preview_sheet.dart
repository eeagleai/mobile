import 'package:eeagle_ai/src/core/util/page_url_util.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_action_bar.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_footer.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_full_screen.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_header.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_layout.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_url_display.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_web_frame.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<void> showSitePreviewSheet(
  BuildContext context, {
  required Site site,
  String? previewUrl,
}) {
  final pageUrl = previewUrl ?? normalizePageUrl(site.host);

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
        minChildSize: 0.92,
        maxChildSize: 0.92,
        expand: false,
        builder: (context, scrollController) {
          return SitePreviewSheet(
            initialUrl: pageUrl,
          );
        },
      ),
    ),
  );
}

Future<void> showHomeSitePreviewSheet(
  BuildContext context, {
  required Site site,
}) {
  return showSitePreviewSheet(context, site: site);
}

String previewSheetSubtitle(String pageUrl) {
  final uri = Uri.tryParse(pageUrl);
  if (uri == null) {
    return pageUrl;
  }

  final path = uri.path;
  if (path.isEmpty || path == '/') {
    return uri.host;
  }

  return path;
}

class SitePreviewSheet extends StatefulWidget {
  const SitePreviewSheet({
    super.key,
    required this.initialUrl,
  });

  final String initialUrl;

  @override
  State<SitePreviewSheet> createState() => _SitePreviewSheetState();
}

class _SitePreviewSheetState extends State<SitePreviewSheet> {
  late final WebViewController _webViewController;
  late String _currentUrl;

  var _isLoading = true;
  var _canGoBack = false;
  var _canGoForward = false;

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
          onPageFinished: (_) async {
            await _refreshNavigationState();
          },
          onWebResourceError: (_) async {
            if (!mounted) {
              return;
            }
            setState(() => _isLoading = false);
            await _refreshNavigationState();
          },
        ),
      )
      ..loadRequest(Uri.parse(_currentUrl));
  }

  Future<void> _refreshNavigationState() async {
    if (!mounted) {
      return;
    }

    final canGoBack = await _webViewController.canGoBack();
    final canGoForward = await _webViewController.canGoForward();
    final currentUrl = await _webViewController.currentUrl();

    if (!mounted) {
      return;
    }

    setState(() {
      _canGoBack = canGoBack;
      _canGoForward = canGoForward;
      _isLoading = false;
      if (currentUrl != null && currentUrl.isNotEmpty) {
        _currentUrl = currentUrl;
      }
    });
  }

  Future<void> _goBack() async {
    if (!_canGoBack) {
      return;
    }
    await _webViewController.goBack();
    await _refreshNavigationState();
  }

  Future<void> _goForward() async {
    if (!_canGoForward) {
      return;
    }
    await _webViewController.goForward();
    await _refreshNavigationState();
  }

  Future<void> _reload() async {
    await _webViewController.reload();
  }

  Future<void> _copyLink() async {
    await Clipboard.setData(ClipboardData(text: _currentUrl));
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Link copied')),
      );
  }

  Future<void> _shareLink() async {
    await Share.share(_currentUrl);
  }

  Future<void> _openInBrowser() async {
    final uri = Uri.tryParse(_currentUrl);
    if (uri == null || !uri.hasScheme) {
      _showBrowserError();
      return;
    }

    var launched = false;
    try {
      launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      // Some iOS configurations reject externalApplication; fall back.
      if (!launched) {
        launched = await launchUrl(uri);
      }
    } on PlatformException catch (_) {
      launched = false;
    }

    if (!launched) {
      _showBrowserError();
    }
  }

  void _showBrowserError() {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Could not open link in browser')),
      );
  }

  void _openFullScreen() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => SitePreviewFullScreen(initialUrl: _currentUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final displayTitle = previewSheetDisplayTitle(_currentUrl);
    final displayUrl = previewSheetFormattedDisplayUrl(_currentUrl);
    final isSecure = previewSheetIsSecureUrl(_currentUrl);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.inputSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.chipBorder, width: 0.5),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: colors.foregroundSecondary.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: sitePreviewHandleToHeaderGap),
          SitePreviewHeader(
            displayTitle: displayTitle,
            displayUrl: displayUrl,
            isSecure: isSecure,
            canGoBack: _canGoBack,
            canGoForward: _canGoForward,
            onBack: _goBack,
            onForward: _goForward,
            onRefresh: _reload,
            onClose: () => Navigator.of(context).pop(),
          ),
          const SizedBox(height: sitePreviewHeaderToActionsGap),
          SitePreviewActionBar(
            onOpenFullScreen: _openFullScreen,
            onOpenInBrowser: _openInBrowser,
            onCopyLink: _copyLink,
            onReload: _reload,
            onShare: _shareLink,
          ),
          Expanded(
            child: SitePreviewWebFrame(
              controller: _webViewController,
              isLoading: _isLoading,
            ),
          ),
          SitePreviewFooter(onExpand: _openFullScreen),
        ],
      ),
    );
  }
}

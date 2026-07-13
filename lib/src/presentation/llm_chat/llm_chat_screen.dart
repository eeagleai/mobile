import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/model/site_preview_action.dart';
import 'package:eeagle_ai/src/core/util/page_url_util.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/home_site_preview_sheet.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_session_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_conversation_body.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_page_url_picker_dialog.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_live_preview.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_prompt_input_bar.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_top_app_bar.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LlmChatScreen extends StatelessWidget {
  const LlmChatScreen({super.key, required this.site});

  final Site site;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              di<LlmChatPromptBloc>()
                ..add(const LlmChatPromptEvent.initialized()),
        ),
        BlocProvider(
          create: (_) =>
              di<LlmChatSessionBloc>()
                ..add(LlmChatSessionEvent.started(site: site)),
        ),
      ],
      child: _LlmChatView(site: site),
    );
  }
}

class _LlmChatView extends StatefulWidget {
  const _LlmChatView({required this.site});

  final Site site;

  @override
  State<_LlmChatView> createState() => _LlmChatViewState();
}

class _LlmChatViewState extends State<_LlmChatView> {
  bool _isPreviewMode = false;
  WebViewController? _previewController;
  late String _previewUrl;
  bool _isPreviewLoading = false;

  Site get site => widget.site;

  @override
  void initState() {
    super.initState();
    _previewUrl = normalizePageUrl(site.host);
  }

  void _togglePreviewMode() {
    if (!_isPreviewMode) {
      _ensurePreviewController();
    }
    setState(() => _isPreviewMode = !_isPreviewMode);
  }

  void _ensurePreviewController() {
    if (_previewController != null) return;
    _isPreviewLoading = true;
    _previewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            if (!mounted) return;
            setState(() {
              _previewUrl = url;
              _isPreviewLoading = true;
            });
          },
          onPageFinished: (url) {
            if (!mounted) return;
            setState(() {
              _previewUrl = url;
              _isPreviewLoading = false;
            });
          },
          onWebResourceError: (_) {
            if (mounted) setState(() => _isPreviewLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(_previewUrl));
  }

  Future<void> _showInlineUrl(String url) async {
    _ensurePreviewController();
    _previewUrl = url;
    await _previewController!.loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LlmChatPromptBloc, LlmChatPromptState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage &&
              current.errorMessage != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          },
        ),
        BlocListener<LlmChatSessionBloc, LlmChatSessionState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage &&
              current.errorMessage != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          },
        ),
        BlocListener<LlmChatSessionBloc, LlmChatSessionState>(
          listenWhen: (previous, current) =>
              previous.previewAction != current.previewAction &&
              current.previewAction != null,
          listener: (context, state) async {
            final previewAction = state.previewAction;
            if (previewAction == null) {
              return;
            }

            final sessionBloc = context.read<LlmChatSessionBloc>();

            switch (previewAction) {
              case SitePreviewActionOpen(:final url):
                if (_isPreviewMode) {
                  await _showInlineUrl(url);
                } else {
                  await showSitePreviewSheet(
                    context,
                    site: site,
                    previewUrl: url,
                  );
                }
              case SitePreviewActionChoose(:final urls):
                final selectedUrl = await showLlmChatPageUrlPickerDialog(
                  context,
                  urls: urls,
                );
                if (selectedUrl != null && context.mounted) {
                  if (_isPreviewMode) {
                    await _showInlineUrl(selectedUrl);
                  } else {
                    await showSitePreviewSheet(
                      context,
                      site: site,
                      previewUrl: selectedUrl,
                    );
                  }
                }
            }

            sessionBloc.add(const LlmChatSessionEvent.previewActionConsumed());
          },
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const EeagleScreenBackground(),
            SafeArea(
              child: Column(
                children: [
                  BlocBuilder<LlmChatSessionBloc, LlmChatSessionState>(
                    buildWhen: (previous, current) =>
                        previous.quotaRemaining != current.quotaRemaining,
                    builder: (context, sessionState) {
                      return LlmChatTopAppBar(
                        site: site,
                        quotaRemaining:
                            sessionState.quotaRemaining ?? site.quotaRemaining,
                        onBackTap: () => Navigator.of(context).maybePop(),
                        onPreviewTap: _togglePreviewMode,
                        isPreviewMode: _isPreviewMode,
                      );
                    },
                  ),
                  Expanded(
                    child: _previewController == null
                        ? LlmChatConversationBody(site: site)
                        : IndexedStack(
                            index: _isPreviewMode ? 1 : 0,
                            children: [
                              LlmChatConversationBody(site: site),
                              LlmChatLivePreview(
                                controller: _previewController!,
                                currentUrl: _previewUrl,
                                isLoading: _isPreviewLoading,
                                onReload: () => _previewController!.reload(),
                              ),
                            ],
                          ),
                  ),
                  LlmChatPromptInputBar(
                    attachmentsEnabled: false,
                    onSend: (text, _) {
                      context.read<LlmChatSessionBloc>().add(
                        LlmChatSessionEvent.messageSent(text: text),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

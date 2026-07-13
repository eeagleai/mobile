import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_full_screen.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_web_frame.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/site_preview/site_preview_url_display.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_session_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_processing_indicator.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LlmChatLivePreview extends StatelessWidget {
  const LlmChatLivePreview({
    super.key,
    required this.controller,
    required this.currentUrl,
    required this.isLoading,
    required this.onReload,
  });

  final WebViewController controller;
  final String currentUrl;
  final bool isLoading;
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: colors.success,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: EeagleText(
                  previewSheetFormattedDisplayUrl(currentUrl),
                  style: EeagleTextStyles.bodySmall,
                  textColor: colors.foregroundSecondary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                tooltip: 'Refresh preview',
                onPressed: onReload,
                icon: const Icon(Icons.refresh_rounded, size: 20),
                color: colors.foregroundPrimary,
              ),
              IconButton(
                tooltip: 'Open full screen',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) =>
                        SitePreviewFullScreen(initialUrl: currentUrl),
                  ),
                ),
                icon: const Icon(Icons.open_in_full_rounded, size: 19),
                color: colors.foregroundPrimary,
              ),
            ],
          ),
        ),
        Expanded(
          child: SitePreviewWebFrame(
            controller: controller,
            isLoading: isLoading,
          ),
        ),
        BlocBuilder<LlmChatSessionBloc, LlmChatSessionState>(
          buildWhen: (previous, current) =>
              previous.connectionPhase != current.connectionPhase,
          builder: (context, state) =>
              shouldShowProcessingIndicator(state.connectionPhase)
              ? const LlmChatProcessingIndicator()
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

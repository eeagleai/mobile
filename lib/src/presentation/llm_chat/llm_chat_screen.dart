import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/model/site_preview_action.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/home_site_preview_sheet.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_session_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_conversation_body.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_page_url_picker_dialog.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_prompt_input_bar.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_top_app_bar.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LlmChatScreen extends StatelessWidget {
  const LlmChatScreen({
    super.key,
    required this.site,
  });

  final Site site;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di<LlmChatPromptBloc>()
            ..add(const LlmChatPromptEvent.initialized()),
        ),
        BlocProvider(
          create: (_) => di<LlmChatSessionBloc>()
            ..add(LlmChatSessionEvent.started(site: site)),
        ),
      ],
      child: _LlmChatView(site: site),
    );
  }
}

class _LlmChatView extends StatelessWidget {
  const _LlmChatView({required this.site});

  final Site site;

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
              ..showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
          },
        ),
        BlocListener<LlmChatSessionBloc, LlmChatSessionState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage &&
              current.errorMessage != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
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
                await showSitePreviewSheet(
                  context,
                  site: site,
                  previewUrl: url,
                );
              case SitePreviewActionChoose(:final urls):
                final selectedUrl = await showLlmChatPageUrlPickerDialog(
                  context,
                  urls: urls,
                );
                if (selectedUrl != null && context.mounted) {
                  await showSitePreviewSheet(
                    context,
                    site: site,
                    previewUrl: selectedUrl,
                  );
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
                        quotaRemaining: sessionState.quotaRemaining ??
                            site.quotaRemaining,
                        onBackTap: () => Navigator.of(context).maybePop(),
                      );
                    },
                  ),
                  Expanded(child: LlmChatConversationBody(site: site)),
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

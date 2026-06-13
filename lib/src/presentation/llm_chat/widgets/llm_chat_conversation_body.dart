import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/home_site_preview_sheet.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_session_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_intro_view.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_message_list.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_processing_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LlmChatConversationBody extends StatelessWidget {
  const LlmChatConversationBody({
    super.key,
    required this.site,
  });

  final Site site;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LlmChatSessionBloc, LlmChatSessionState>(
      buildWhen: (previous, current) =>
          previous.messages != current.messages ||
          previous.connectionPhase != current.connectionPhase,
      builder: (context, state) {
        if (state.messages.isEmpty) {
          return LlmChatIntroView(site: site);
        }

        return Column(
          children: [
            Expanded(
              child: LlmChatMessageList(
                messages: state.messages,
                onPageLinkTap: (previewUrl) {
                  showSitePreviewSheet(
                    context,
                    site: site,
                    previewUrl: previewUrl,
                  );
                },
              ),
            ),
            if (shouldShowProcessingIndicator(state.connectionPhase))
              const LlmChatProcessingIndicator(),
          ],
        );
      },
    );
  }
}

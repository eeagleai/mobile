import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/presentation/live_conversation/bloc/live_conversation_bloc.dart';
import 'package:eeagle_ai/src/presentation/live_conversation/widgets/live_chat_message_bubble.dart';
import 'package:eeagle_ai/src/presentation/live_conversation/widgets/live_conversation_composer.dart';
import 'package:eeagle_ai/src/presentation/live_conversation/widgets/live_conversation_header_card.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_screen_background.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Arguments for [LiveConversationScreen], passed via the named route.
///
/// `accessToken` is intentionally not threaded here: the shared Dio
/// `AuthInterceptor` already attaches the bearer token to every request.
class LiveConversationScreenArgs {
  const LiveConversationScreenArgs({
    required this.siteApiKey,
    required this.conversationId,
    this.pageUrl,
    this.visitorLocation,
    this.createdAt,
    this.seedMessage,
  });

  final String siteApiKey;
  final String conversationId;
  final String? pageUrl;
  final String? visitorLocation;
  final DateTime? createdAt;

  /// Optional first message to show (e.g. the visitor message that was tapped).
  final String? seedMessage;
}

class LiveConversationScreen extends StatelessWidget {
  const LiveConversationScreen({super.key, required this.args});

  final LiveConversationScreenArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<LiveConversationBloc>()
        ..add(
          LiveConversationEvent.started(
            apikey: args.siteApiKey,
            conversationId: args.conversationId,
            seedMessage: args.seedMessage,
            seedCreatedAt: args.createdAt,
          ),
        ),
      child: _LiveConversationView(args: args),
    );
  }
}

class _LiveConversationView extends StatelessWidget {
  const _LiveConversationView({required this.args});

  final LiveConversationScreenArgs args;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const EeagleScreenBackground(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                  child: Row(
                    children: [
                      IconButton(
                        tooltip: 'Back',
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: colors.titleNatural,
                        ),
                      ),
                      Expanded(
                        child: EeagleText(
                          'Live chat',
                          style: EeagleTextStyles.headlineSmall,
                          textColor: colors.titleNatural,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<LiveConversationBloc, LiveConversationState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) => LiveConversationHeaderCard(
                    status: state.status,
                    pageUrl: args.pageUrl,
                    visitorLocation: args.visitorLocation,
                    createdAt: args.createdAt,
                  ),
                ),
                Expanded(
                  child: BlocBuilder<LiveConversationBloc,
                      LiveConversationState>(
                    buildWhen: (previous, current) =>
                        previous.messages != current.messages,
                    builder: (context, state) => _MessageList(state: state),
                  ),
                ),
                LiveConversationComposer(
                  onSend: (text) => context
                      .read<LiveConversationBloc>()
                      .add(LiveConversationEvent.messageSent(text)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageList extends StatefulWidget {
  const _MessageList({required this.state});

  final LiveConversationState state;

  @override
  State<_MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<_MessageList> {
  final ScrollController _controller = ScrollController();

  @override
  void didUpdateWidget(_MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.messages.length != oldWidget.state.messages.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }

  void _scrollToBottom() {
    if (!_controller.hasClients) {
      return;
    }
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final messages = widget.state.messages;

    if (messages.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: EeagleText(
            'No messages yet — say hello 👋',
            style: EeagleTextStyles.bodyLarge,
            textColor: colors.bodyText,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.separated(
      controller: _controller,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      itemCount: messages.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final message = messages[index];
        return LiveChatMessageBubble(
          message: message,
          onRetry: () => context
              .read<LiveConversationBloc>()
              .add(LiveConversationEvent.messageRetried(message.id)),
        );
      },
    );
  }
}

import 'package:eeagle_ai/src/domain/model/chat_message.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_message_bubble.dart';
import 'package:flutter/material.dart';

class LlmChatMessageList extends StatefulWidget {
  const LlmChatMessageList({
    super.key,
    required this.messages,
  });

  final List<ChatMessage> messages;

  @override
  State<LlmChatMessageList> createState() => _LlmChatMessageListState();
}

class _LlmChatMessageListState extends State<LlmChatMessageList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant LlmChatMessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages.length != oldWidget.messages.length ||
        (widget.messages.isNotEmpty &&
            oldWidget.messages.isNotEmpty &&
            widget.messages.last.content != oldWidget.messages.last.content)) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) {
        return;
      }

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      itemCount: widget.messages.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return LlmChatMessageBubble(message: widget.messages[index]);
      },
    );
  }
}

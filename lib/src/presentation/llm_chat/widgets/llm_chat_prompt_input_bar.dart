import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/domain/model/prompt_attachment.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_attachment_menu.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_prompt_attachments_row.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_recording_indicator.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_svg_icon.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_colors.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef PromptSendCallback = void Function(
  String text,
  List<PromptAttachment> attachments,
);

class LlmChatPromptInputBar extends StatefulWidget {
  const LlmChatPromptInputBar({
    super.key,
    this.onSend,
    this.attachmentsEnabled = true,
  });

  final PromptSendCallback? onSend;
  final bool attachmentsEnabled;

  @override
  State<LlmChatPromptInputBar> createState() => _LlmChatPromptInputBarState();
}

class _LlmChatPromptInputBarState extends State<LlmChatPromptInputBar> {
  static const _minBarHeight = 50.0;

  late final TextEditingController _controller;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollFieldToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) {
        return;
      }

      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void _syncControllerText(String text) {
    if (_controller.text == text) {
      return;
    }

    _controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
    _scrollFieldToEnd();
  }

  void _submit(BuildContext context, LlmChatPromptState state) {
    if (!LlmChatPromptBloc.canSend(
      promptText: state.promptText,
      attachments: state.attachments,
    )) {
      return;
    }

    widget.onSend?.call(state.promptText.trim(), state.attachments);
    context.read<LlmChatPromptBloc>().add(const LlmChatPromptEvent.sendRequested());
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final fieldStyle = EeagleTextStyles.bodyMedium.copyWith(
      color: colors.foregroundPrimary,
      height: 1.25,
    );

    return BlocListener<LlmChatPromptBloc, LlmChatPromptState>(
      listenWhen: (previous, current) =>
          previous.promptText != current.promptText,
      listener: (context, state) {
        _syncControllerText(state.promptText);
      },
      child: BlocBuilder<LlmChatPromptBloc, LlmChatPromptState>(
        buildWhen: (previous, current) =>
            previous.isListening != current.isListening ||
            previous.isInitializing != current.isInitializing ||
            previous.promptText != current.promptText ||
            previous.attachments != current.attachments ||
            (previous.soundLevel - current.soundLevel).abs() >= 0.02,
        builder: (context, state) {
          final isListening = state.isListening;
          final soundLevel = state.soundLevel;
          final accent = colors.palette.primary.shade500;
          final maxFieldHeight = MediaQuery.sizeOf(context).height * 0.35;

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  child: isListening
                      ? Padding(
                          key: const ValueKey('listening-banner'),
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Center(
                            child: LlmChatListeningBanner(soundLevel: soundLevel),
                          ),
                        )
                      : const SizedBox.shrink(
                          key: ValueKey('listening-banner-hidden'),
                        ),
                ),
                if (widget.attachmentsEnabled)
                  LlmChatPromptAttachmentsRow(attachments: state.attachments),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        constraints: const BoxConstraints(
                          minHeight: _minBarHeight,
                        ),
                        decoration: BoxDecoration(
                          color: colors.inputSurface,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isListening ? accent : colors.chipBorder,
                            width: isListening ? 1.5 : 1,
                          ),
                          boxShadow: isListening
                              ? [
                                  BoxShadow(
                                    color: accent.withValues(alpha: 0.28),
                                    blurRadius: 14,
                                    spreadRadius: 1,
                                  ),
                                ]
                              : null,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: _CompactPromptField(
                          controller: _controller,
                          scrollController: _scrollController,
                          fieldStyle: fieldStyle,
                          maxFieldHeight: maxFieldHeight,
                          minBarHeight: _minBarHeight,
                          hintText: isListening
                              ? 'Speak now...'
                              : 'Just say it—we\'ll bring your idea to life.',
                          hintColor: isListening
                              ? accent.withValues(alpha: 0.85)
                              : colors.foregroundSecondary,
                          accent: accent,
                          isListening: isListening,
                          soundLevel: soundLevel,
                          isInitializing: state.isInitializing,
                          attachmentsEnabled: widget.attachmentsEnabled,
                          onPlusTap: widget.attachmentsEnabled
                              ? () => showLlmChatAttachmentMenu(context)
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    _SendButton(
                      onTap: () => _submit(context, state),
                      colors: colors,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CompactPromptField extends StatelessWidget {
  const _CompactPromptField({
    required this.controller,
    required this.scrollController,
    required this.fieldStyle,
    required this.maxFieldHeight,
    required this.minBarHeight,
    required this.hintText,
    required this.hintColor,
    required this.accent,
    required this.isListening,
    required this.soundLevel,
    required this.isInitializing,
    this.attachmentsEnabled = true,
    this.onPlusTap,
  });

  final TextEditingController controller;
  final ScrollController scrollController;
  final TextStyle fieldStyle;
  final double maxFieldHeight;
  final double minBarHeight;
  final String hintText;
  final Color hintColor;
  final Color accent;
  final bool isListening;
  final double soundLevel;
  final bool isInitializing;
  final bool attachmentsEnabled;
  final VoidCallback? onPlusTap;

  static const _verticalPadding = 12.0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minBarHeight,
        maxHeight: maxFieldHeight,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, _verticalPadding, 10, _verticalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (attachmentsEnabled && onPlusTap != null) ...[
              _InputBarIconButton(
                onTap: onPlusTap!,
                child: EeagleSvgIcon(
                  icon: Assets.icons.home.icPlus,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: TextField(
                controller: controller,
                scrollController: scrollController,
                style: fieldStyle,
                cursorColor: accent,
                cursorHeight: 18,
                minLines: 1,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  isCollapsed: true,
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: fieldStyle.copyWith(color: hintColor),
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (text) {
                  context.read<LlmChatPromptBloc>().add(
                        LlmChatPromptEvent.textChanged(text),
                      );
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!scrollController.hasClients) {
                      return;
                    }
                    scrollController.jumpTo(
                      scrollController.position.maxScrollExtent,
                    );
                  });
                },
              ),
            ),
            const SizedBox(width: 8),
            LlmChatRecordingMicButton(
              isListening: isListening,
              soundLevel: soundLevel,
              enabled: !isInitializing,
              size: 28,
              onTap: () => context.read<LlmChatPromptBloc>().add(
                    const LlmChatPromptEvent.micToggled(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({
    required this.onTap,
    required this.colors,
  });

  final VoidCallback onTap;
  final EeagleColors colors;

  static const _size = 50.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_size),
        child: Ink(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
            color: colors.palette.primary.shade700,
            borderRadius: BorderRadius.circular(_size),
            border: Border.all(
              color: colors.chipBorder,
              width: 1,
            ),
          ),
          child: Center(
            child: EeagleSvgIcon(
              icon: Assets.icons.home.icSend,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class _InputBarIconButton extends StatelessWidget {
  const _InputBarIconButton({
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Center(child: child),
        ),
      ),
    );
  }
}

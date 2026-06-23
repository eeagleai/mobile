import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

/// Message input row + circular send button for the live conversation.
class LiveConversationComposer extends StatefulWidget {
  const LiveConversationComposer({super.key, required this.onSend});

  final ValueChanged<String> onSend;

  @override
  State<LiveConversationComposer> createState() =>
      _LiveConversationComposerState();
}

class _LiveConversationComposerState extends State<LiveConversationComposer> {
  final TextEditingController _controller = TextEditingController();
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final canSend = _controller.text.trim().isNotEmpty;
    if (canSend != _canSend) {
      setState(() => _canSend = canSend);
    }
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      return;
    }
    widget.onSend(text);
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.removeListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors.inputFieldSurface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: colors.chipBorder),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: TextField(
                  controller: _controller,
                  minLines: 1,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  cursorColor: colors.brandPrimaryAccent,
                  style: EeagleTextStyles.bodyMedium.copyWith(
                    color: colors.titleNatural,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Message the visitor…',
                    hintStyle: EeagleTextStyles.bodyMedium.copyWith(
                      color: colors.bodyText,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _canSend ? _send : null,
              borderRadius: BorderRadius.circular(50),
              child: Ink(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: _canSend
                      ? colors.palette.primary.shade700
                      : colors.inputSurface,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: colors.chipBorder, width: 1),
                ),
                child: Icon(
                  Icons.send_rounded,
                  size: 20,
                  color: _canSend ? colors.onPrimary : colors.foregroundDisabled,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

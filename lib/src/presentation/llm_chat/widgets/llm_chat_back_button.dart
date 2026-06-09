import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_glass_surface.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_svg_icon.dart';
import 'package:flutter/material.dart';

class LlmChatBackButton extends StatelessWidget {
  const LlmChatBackButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  static const _iconWidth = 9.0;
  static const _iconHeight = 17.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: LlmChatGlassSurface(
          child: EeagleSvgIcon(
            icon: Assets.icons.home.icBackArrow,
            width: _iconWidth,
            height: _iconHeight,
          ),
        ),
      ),
    );
  }
}

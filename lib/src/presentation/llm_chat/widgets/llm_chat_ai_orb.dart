import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LlmChatAiOrb extends StatelessWidget {
  const LlmChatAiOrb({super.key});

  static const double size = 200;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: Assets.images.home.aiOrb.image(
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}

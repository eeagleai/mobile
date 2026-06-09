import 'package:eeagle_ai/gen/assets.gen.dart';

class LlmChatReadyPromptData {
  const LlmChatReadyPromptData({
    required this.label,
    required this.prompt,
    required this.icon,
  });

  final String label;
  final String prompt;
  final SvgGenImage icon;
}

final llmChatReadyPrompts = [
  LlmChatReadyPromptData(
    label: 'Landing page',
    prompt:
        'Build a modern landing page for my product with a hero section, features, testimonials, and a call-to-action.',
    icon: Assets.icons.home.icCanvas,
  ),
  LlmChatReadyPromptData(
    label: 'Portfolio',
    prompt:
        'Create a personal portfolio website to showcase my projects, skills, and contact information.',
    icon: Assets.icons.home.icGenerateImages,
  ),
  LlmChatReadyPromptData(
    label: 'Online store',
    prompt:
        'Design an e-commerce website with product listings, product details, cart, and checkout.',
    icon: Assets.icons.home.icIntegration,
  ),
  LlmChatReadyPromptData(
    label: 'SaaS website',
    prompt:
        'Build a SaaS marketing website with pricing, features, FAQ, and a signup section.',
    icon: Assets.icons.home.icCode,
  ),
  LlmChatReadyPromptData(
    label: 'Blog',
    prompt:
        'Create a blog website with a homepage, article pages, categories, and a clean reading layout.',
    icon: Assets.icons.home.icResearch,
  ),
];

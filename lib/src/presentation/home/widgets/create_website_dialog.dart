import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/create_website_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/models/llm_chat_ready_prompt_data.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_service_chip.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_primary_button.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _websitePrompts = [
  LlmChatReadyPromptData(
    label: 'Business website',
    prompt:
        'Create a modern website for my business with a strong home page, services, about, and contact sections.',
    icon: Assets.icons.home.icCanvas,
  ),
  LlmChatReadyPromptData(
    label: 'Online store',
    prompt:
        'Create a polished online store with featured products, product pages, trust sections, and an easy checkout journey.',
    icon: Assets.icons.home.icIntegration,
  ),
];

class CreateWebsiteDialog extends StatefulWidget {
  const CreateWebsiteDialog({super.key, this.initialPrompt = ''});

  final String initialPrompt;

  @override
  State<CreateWebsiteDialog> createState() => _CreateWebsiteDialogState();
}

class _CreateWebsiteDialogState extends State<CreateWebsiteDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialPrompt);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectPrompt(LlmChatReadyPromptData prompt) {
    _controller.text = prompt.prompt;
    _controller.selection = TextSelection.collapsed(
      offset: prompt.prompt.length,
    );
    context.read<CreateWebsiteBloc>().add(
      CreateWebsiteEvent.promptChanged(prompt.prompt),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: colors.inputFieldSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: BlocBuilder<CreateWebsiteBloc, CreateWebsiteState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: state.isComplete
                ? _SuccessView(siteUrl: state.build?.siteUrl)
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: EeagleText(
                              'Create a website',
                              style: EeagleTextStyles.headlineLarge,
                              textColor: colors.titleNatural,
                            ),
                          ),
                          IconButton(
                            tooltip: 'Close',
                            onPressed: state.isBuilding
                                ? null
                                : () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                            color: colors.bodyText,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      EeagleText(
                        state.isBuilding
                            ? (state.build?.message ??
                                  'Starting your website...')
                            : 'Tell us what you want. A few clear details are enough.',
                        style: EeagleTextStyles.bodyMedium,
                        textColor: colors.bodyText,
                      ),
                      const SizedBox(height: 18),
                      TextField(
                        controller: _controller,
                        enabled: !state.isBuilding,
                        minLines: 4,
                        maxLines: 7,
                        onChanged: (value) => context
                            .read<CreateWebsiteBloc>()
                            .add(CreateWebsiteEvent.promptChanged(value)),
                        style: EeagleTextStyles.bodyMedium.copyWith(
                          color: colors.titleNatural,
                        ),
                        decoration: InputDecoration(
                          hintText:
                              'Example: Create a clean website for my dental clinic...',
                          hintStyle: EeagleTextStyles.bodyMedium.copyWith(
                            color: colors.bodyText,
                          ),
                          filled: true,
                          fillColor: colors.background,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: colors.chipBorder),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: colors.chipBorder),
                          ),
                        ),
                      ),
                      if (!state.isBuilding) ...[
                        const SizedBox(height: 14),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (final prompt in _websitePrompts)
                              LlmChatServiceChip(
                                label: prompt.label,
                                icon: prompt.icon,
                                onTap: () => _selectPrompt(prompt),
                              ),
                          ],
                        ),
                      ],
                      if (state.errorMessage != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          state.errorMessage!,
                          style: EeagleTextStyles.bodyMedium.copyWith(
                            color: colors.error,
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      EeaglePrimaryButton(
                        label: state.isBuilding
                            ? 'Building Your Website'
                            : 'Build My Website',
                        isLoading: state.isBuilding,
                        onTap: () => context.read<CreateWebsiteBloc>().add(
                          const CreateWebsiteEvent.submitted(),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView({this.siteUrl});
  final String? siteUrl;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.auto_awesome, size: 48, color: colors.brandPrimaryAccent),
        const SizedBox(height: 16),
        EeagleText(
          'Your website is ready',
          style: EeagleTextStyles.headlineLarge,
          textColor: colors.titleNatural,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        EeagleText(
          siteUrl ?? 'Your new website was created successfully.',
          style: EeagleTextStyles.bodyMedium,
          textColor: colors.bodyText,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        EeaglePrimaryButton(
          label: 'View My Websites',
          onTap: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}

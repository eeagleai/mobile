import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_svg_icon.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> showLlmChatAttachmentMenu(BuildContext context) {
  final bloc = context.read<LlmChatPromptBloc>();

  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (sheetContext) => BlocProvider.value(
      value: bloc,
      child: const _LlmChatAttachmentMenuSheet(),
    ),
  );
}

class _LlmChatAttachmentMenuSheet extends StatelessWidget {
  const _LlmChatAttachmentMenuSheet();

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.inputSurface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: colors.chipBorder, width: 0.5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.foregroundSecondary.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const SizedBox(height: 8),
              _AttachmentMenuOption(
                icon: Assets.icons.home.icGenerateImages,
                title: 'Attach media',
                subtitle: 'Photos and videos from your library',
                onTap: () {
                  final bloc = context.read<LlmChatPromptBloc>();
                  Navigator.of(context).pop();
                  bloc.add(const LlmChatPromptEvent.pickMediaRequested());
                },
              ),
              Divider(
                height: 1,
                thickness: 0.5,
                color: colors.chipBorder,
                indent: 16,
                endIndent: 16,
              ),
              _AttachmentMenuOption(
                iconWidget: Icon(
                  Icons.insert_drive_file_outlined,
                  size: 22,
                  color: colors.palette.primary.shade400,
                ),
                title: 'Attach files',
                subtitle: 'PDF, Word, text, and more',
                onTap: () {
                  final bloc = context.read<LlmChatPromptBloc>();
                  Navigator.of(context).pop();
                  bloc.add(const LlmChatPromptEvent.pickFilesRequested());
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _AttachmentMenuOption extends StatelessWidget {
  const _AttachmentMenuOption({
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.icon,
    this.iconWidget,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final SvgGenImage? icon;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.palette.primary.shade900.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: iconWidget ??
                      EeagleSvgIcon(
                        icon: icon!,
                        size: 22,
                      ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EeagleText(
                      title,
                      style: EeagleTextStyles.bodyMedium,
                      textColor: colors.foregroundPrimary,
                    ),
                    const SizedBox(height: 2),
                    EeagleText(
                      subtitle,
                      style: EeagleTextStyles.bodySmall,
                      textColor: colors.foregroundSecondary,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

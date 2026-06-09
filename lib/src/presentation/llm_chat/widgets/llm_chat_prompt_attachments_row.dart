import 'dart:io';

import 'package:eeagle_ai/src/domain/model/prompt_attachment.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_colors.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LlmChatPromptAttachmentsRow extends StatelessWidget {
  const LlmChatPromptAttachmentsRow({
    super.key,
    required this.attachments,
  });

  final List<PromptAttachment> attachments;

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 72,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: attachments.length,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final attachment = attachments[index];
            return _AttachmentChip(attachment: attachment);
          },
        ),
      ),
    );
  }
}

class _AttachmentChip extends StatelessWidget {
  const _AttachmentChip({required this.attachment});

  final PromptAttachment attachment;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Container(
      width: attachment.isImage ? 120 : 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.chipBorder, width: 0.5),
      ),
      child: Row(
        children: [
          _AttachmentPreview(attachment: attachment),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EeagleText(
                  attachment.name,
                  style: EeagleTextStyles.bodySmall,
                  textColor: colors.chipLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (attachment.sizeBytes != null) ...[
                  const SizedBox(height: 2),
                  EeagleText(
                    _formatSize(attachment.sizeBytes!),
                    style: EeagleTextStyles.bodyExtraSmall,
                    textColor: colors.foregroundSecondary,
                    maxLines: 1,
                  ),
                ],
              ],
            ),
          ),
          InkWell(
            onTap: () => context.read<LlmChatPromptBloc>().add(
                  LlmChatPromptEvent.attachmentRemoved(attachment.id),
                ),
            borderRadius: BorderRadius.circular(100),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Icon(
                Icons.close,
                size: 16,
                color: colors.foregroundSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    }

    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }

    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

class _AttachmentPreview extends StatelessWidget {
  const _AttachmentPreview({required this.attachment});

  final PromptAttachment attachment;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    if (attachment.isImage) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          File(attachment.path),
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _FileIcon(colors: colors, attachment: attachment),
        ),
      );
    }

    if (attachment.isVideo) {
      return _VideoIcon(colors: colors);
    }

    return _FileIcon(colors: colors, attachment: attachment);
  }
}

class _FileIcon extends StatelessWidget {
  const _FileIcon({
    required this.colors,
    required this.attachment,
  });

  final EeagleColors colors;
  final PromptAttachment attachment;

  @override
  Widget build(BuildContext context) {
    final isPdf = attachment.extension.toLowerCase() == 'pdf';

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: colors.palette.primary.shade900.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        isPdf ? Icons.picture_as_pdf_outlined : Icons.insert_drive_file_outlined,
        size: 20,
        color: colors.palette.primary.shade400,
      ),
    );
  }
}

class _VideoIcon extends StatelessWidget {
  const _VideoIcon({required this.colors});

  final EeagleColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: colors.palette.primary.shade900.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.play_circle_outline,
        size: 22,
        color: colors.palette.primary.shade400,
      ),
    );
  }
}

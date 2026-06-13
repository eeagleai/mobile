import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

Future<String?> showLlmChatPageUrlPickerDialog(
  BuildContext context, {
  required List<String> urls,
}) {
  return showDialog<String>(
    context: context,
    builder: (dialogContext) => _LlmChatPageUrlPickerDialog(urls: urls),
  );
}

class _LlmChatPageUrlPickerDialog extends StatelessWidget {
  const _LlmChatPageUrlPickerDialog({required this.urls});

  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.inputSurface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colors.chipBorder, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EeagleText(
                'Preview page',
                style: EeagleTextStyles.titleMedium,
                textColor: colors.titleNatural,
              ),
              const SizedBox(height: 8),
              EeagleText(
                'Choose which updated page to preview.',
                style: EeagleTextStyles.bodySmall,
                textColor: colors.foregroundSecondary,
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: urls.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final url = urls[index];
                    final label = _pageUrlLabel(url);

                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(url),
                        borderRadius: BorderRadius.circular(16),
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: colors.chipBorder,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.open_in_new,
                                size: 18,
                                color: colors.palette.primary.shade400,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    EeagleText(
                                      label,
                                      style: EeagleTextStyles.bodyMedium,
                                      textColor: colors.foregroundPrimary,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 2),
                                    EeagleText(
                                      url,
                                      style: EeagleTextStyles.bodySmall,
                                      textColor: colors.foregroundSecondary,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: EeagleText(
                    'Cancel',
                    style: EeagleTextStyles.bodyMedium,
                    textColor: colors.foregroundSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _pageUrlLabel(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return url;
    }

    final path = uri.path;
    if (path.isEmpty || path == '/') {
      return uri.host;
    }

    return path;
  }
}

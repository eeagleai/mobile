import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_svg_icon.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

/// Figma **Input Field** — dark surface, 12px radius, leading icon, optional suffix.
class EeagleTextField extends StatelessWidget {
  const EeagleTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.autofillHints,
    this.focusNode,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final String? hintText;
  final SvgGenImage? prefixIcon;
  final SvgGenImage? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    final textStyle = EeagleTextStyles.bodyMedium.copyWith(
      color: colors.titleNatural,
    );
    final hintStyle = textStyle.copyWith(color: colors.bodyText);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.inputFieldSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.chipBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (prefixIcon != null) ...[
              EeagleSvgIcon(icon: prefixIcon!, size: 24),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                enabled: enabled,
                obscureText: obscureText,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                autofillHints: autofillHints,
                style: textStyle,
                cursorColor: colors.brandPrimaryAccent,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: hintStyle,
                  contentPadding: EdgeInsets.zero,
                ),
                onSubmitted: onSubmitted,
              ),
            ),
            if (suffixIcon != null) ...[
              const SizedBox(width: 16),
              GestureDetector(
                onTap: onSuffixTap,
                behavior: HitTestBehavior.opaque,
                child: EeagleSvgIcon(icon: suffixIcon!, size: 24),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class EeagleText extends StatelessWidget {
  const EeagleText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.softWrap = true,
    this.textHeightBehavior,
    this.maxLines,
    this.overflow,
    this.textColor,
    this.fontSize,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool softWrap;
  final Color? textColor;
  final TextHeightBehavior? textHeightBehavior;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final resolved = (style ?? EeagleTextStyles.defaultStyle).copyWith(
      color: textColor,
      fontSize: fontSize,
    );

    return Text(
      text,
      style: resolved,
      softWrap: softWrap,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      textHeightBehavior: textHeightBehavior,
    );
  }
}

import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography scale (Space Grotesk), from Eeagle design system.
class EeagleTextStyles {
  EeagleTextStyles._();

  static const String fontFamily = 'Space Grotesk';

  /// Default app text style — Space Grotesk, body medium.
  static TextStyle get defaultStyle => bodyMedium;

  static TextTheme materialTextTheme(EeagleColors colors) {
    return GoogleFonts.spaceGroteskTextTheme(
      TextTheme(
        displayLarge: displayLarge.copyWith(color: colors.foregroundPrimary),
        displayMedium: displayMedium.copyWith(color: colors.foregroundPrimary),
        displaySmall: displaySmall.copyWith(color: colors.foregroundPrimary),
        headlineLarge: headlineLarge.copyWith(color: colors.foregroundPrimary),
        headlineMedium: headlineMedium.copyWith(
          color: colors.foregroundPrimary,
        ),
        headlineSmall: headlineSmall.copyWith(color: colors.foregroundPrimary),
        titleLarge: titleLarge.copyWith(color: colors.foregroundPrimary),
        titleMedium: titleMedium.copyWith(color: colors.foregroundPrimary),
        titleSmall: titleSmall.copyWith(color: colors.foregroundPrimary),
        bodyLarge: bodyLarge.copyWith(color: colors.foregroundPrimary),
        bodyMedium: bodyMedium.copyWith(color: colors.foregroundPrimary),
        bodySmall: bodySmall.copyWith(color: colors.foregroundSecondary),
        labelLarge: labelLarge.copyWith(color: colors.foregroundPrimary),
        labelSmall: labelSmall.copyWith(color: colors.foregroundSecondary),
      ),
    );
  }

  static TextStyle _base({
    required double fontSize,
    required double lineHeight,
    required FontWeight fontWeight,
    required double letterSpacing,
  }) {
    return GoogleFonts.spaceGrotesk(
      fontSize: fontSize,
      height: lineHeight / fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  static final TextStyle displayLarge = _base(
    fontSize: 57,
    lineHeight: 64.13,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.25,
  );

  static final TextStyle displayMedium = _base(
    fontSize: 45,
    lineHeight: 52.13,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final TextStyle displaySmall = _base(
    fontSize: 36,
    lineHeight: 44.13,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final TextStyle headlineLarge = _base(
    fontSize: 32,
    lineHeight: 40.13,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final TextStyle headlineMedium = _base(
    fontSize: 28,
    lineHeight: 36.13,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final TextStyle headlineSmall = _base(
    fontSize: 24,
    lineHeight: 32.13,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final TextStyle headlineExtraSmall = _base(
    fontSize: 20,
    lineHeight: 28.13,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final TextStyle titleLarge = _base(
    fontSize: 22,
    lineHeight: 28.13,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final TextStyle titleMedium = _base(
    fontSize: 16,
    lineHeight: 24.13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static final TextStyle titleSmall = _base(
    fontSize: 14,
    lineHeight: 20.13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static final TextStyle bodyLarge = _base(
    fontSize: 16,
    lineHeight: 24.13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static final TextStyle bodyMedium = _base(
    fontSize: 14,
    lineHeight: 20.13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static final TextStyle bodySmall = _base(
    fontSize: 12,
    lineHeight: 16.13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  static final TextStyle bodyExtraSmall = _base(
    fontSize: 10,
    lineHeight: 14.13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static final TextStyle labelLarge = _base(
    fontSize: 14,
    lineHeight: 20.13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
  );

  static final TextStyle labelSmall = _base(
    fontSize: 11,
    lineHeight: 16.13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
}

import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_colors.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class EeagleThemeData {
  final EeagleColors colors;

  const EeagleThemeData({required this.colors});

  ThemeData toMaterialTheme() {
    final textTheme = EeagleTextStyles.materialTextTheme(colors);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: colors.brandPrimary,
        onPrimary: colors.onPrimary,
        primaryContainer: colors.palette.primary.shade900,
        onPrimaryContainer: colors.foregroundPrimary,
        secondary: colors.palette.primary.shade500,
        onSecondary: colors.onPrimary,
        surface: colors.surface,
        onSurface: colors.foregroundPrimary,
        onSurfaceVariant: colors.foregroundSecondary,
        surfaceContainerHighest: colors.surfaceAlt,
        outline: colors.border,
        outlineVariant: colors.divider,
        error: colors.error,
        onError: colors.onError,
      ),
      scaffoldBackgroundColor: colors.background,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: EeagleTextStyles.bodyMedium.copyWith(
          color: colors.foregroundSecondary,
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: colors.background,
        foregroundColor: colors.foregroundPrimary,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: EeagleTextStyles.titleLarge.copyWith(
          color: colors.foregroundPrimary,
        ),
      ),
      dividerColor: colors.divider,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.brandPrimary,
        foregroundColor: colors.onPrimary,
      ),
    );
  }
}

final appTheme = EeagleThemeData(colors: EeagleColors());

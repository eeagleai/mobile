import 'package:flutter/material.dart';

/// Figma: `Colors/Elementary/*`
class EeagleColorsElementary {
  /// Figma: `Colors/Elementary/Natural`
  final Color natural;

  /// Figma: `Colors/Elementary/Primary`
  final Color primary;

  /// Figma: `Colors/Elementary/On Surface (Natural)`
  final Color onSurfaceNatural;

  /// Figma: `Colors/Elementary/On Surface (Primary)`
  final Color onSurfacePrimary;

  const EeagleColorsElementary({
    this.natural = const Color(0xFF14181F),
    this.primary = const Color(0xFF3F8CFF),
    this.onSurfaceNatural = const Color(0xFF14181F),
    this.onSurfacePrimary = const Color(0xFF0D1E32),
  });
}

/// Figma: `Colors/Surface (Dim)/*`
class EeagleColorsSurfaceDim {
  final Color green;
  final Color natural;
  final Color primary;
  final Color red;
  final Color naturalAlt;
  final Color primaryAlt;
  final Color white;
  final Color success;

  const EeagleColorsSurfaceDim({
    this.green = const Color(0xFF34D399),
    this.natural = const Color(0xFF14181F),
    this.primary = const Color(0xFF1E293B),
    this.red = const Color(0xFFEF4444),
    this.naturalAlt = const Color(0xFF1F2937),
    this.primaryAlt = const Color(0xFF0F172A),
    this.white = const Color(0xFFFFFFFF),
    this.success = const Color(0xFF064E3B),
  });
}

/// Figma: `Colors/Texts/*`
class EeagleColorsTexts {
  final Color natural;
  final Color green;
  final Color white;
  final Color primary;
  final Color red;
  final Color onSurfaceNatural;
  final Color onSurfacePrimary;

  const EeagleColorsTexts({
    this.natural = const Color(0xFF94A3B8),
    this.green = const Color(0xFF10B981),
    this.white = const Color(0xFFFFFFFF),
    this.primary = const Color(0xFF3B82F6),
    this.red = const Color(0xFFEF4444),
    this.onSurfaceNatural = const Color(0xFF1F2937),
    this.onSurfacePrimary = const Color(0xFFF1F5F9),
  });
}

/// Figma scale: `Colors/Success/{50…900}`
class EeagleColorsSuccess {
  final Color shade50;
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;

  const EeagleColorsSuccess({
    this.shade50 = const Color(0xFFECFDF5),
    this.shade100 = const Color(0xFFD1FAE5),
    this.shade200 = const Color(0xFFA7F3D0),
    this.shade300 = const Color(0xFF6EE7B7),
    this.shade400 = const Color(0xFF34D399),
    this.shade500 = const Color(0xFF10B981),
    this.shade600 = const Color(0xFF059669),
    this.shade700 = const Color(0xFF047857),
    this.shade800 = const Color(0xFF065F46),
    this.shade900 = const Color(0xFF064E3B),
  });
}

/// Figma scale: `Colors/Error/{50…900}`
class EeagleColorsError {
  final Color shade50;
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;

  const EeagleColorsError({
    this.shade50 = const Color(0xFFFEF2F2),
    this.shade100 = const Color(0xFFFEE2E2),
    this.shade200 = const Color(0xFFFECACA),
    this.shade300 = const Color(0xFFFCA5A5),
    this.shade400 = const Color(0xFFF87171),
    this.shade500 = const Color(0xFFEF4444),
    this.shade600 = const Color(0xFFDC2626),
    this.shade700 = const Color(0xFFB91C1C),
    this.shade800 = const Color(0xFF991B1B),
    this.shade900 = const Color(0xFF7F1D1D),
  });
}

/// Figma scale: `Colors/Natural/{50…950}`
class EeagleColorsNatural {
  final Color shade50;
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;
  final Color shade950;

  const EeagleColorsNatural({
    this.shade50 = const Color(0xFFF8FAFC),
    this.shade100 = const Color(0xFFF1F5F9),
    this.shade200 = const Color(0xFFE2E8F0),
    this.shade300 = const Color(0xFFCBD5E1),
    this.shade400 = const Color(0xFF94A3B8),
    this.shade500 = const Color(0xFF64748B),
    this.shade600 = const Color(0xFF475569),
    this.shade700 = const Color(0xFF334155),
    this.shade800 = const Color(0xFF1E293B),
    this.shade900 = const Color(0xFF0F172A),
    this.shade950 = const Color(0xFF020617),
  });
}

/// Figma scale: `Colors/Primary/{50…950}`
class EeagleColorsPrimary {
  final Color shade50;
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;
  final Color shade950;

  const EeagleColorsPrimary({
    this.shade50 = const Color(0xFFEFF6FF),
    this.shade100 = const Color(0xFFDBEAFE),
    this.shade200 = const Color(0xFFBFDBFE),
    this.shade300 = const Color(0xFF93C5FD),
    this.shade400 = const Color(0xFF60A5FA),
    this.shade500 = const Color(0xFF3B82F6),
    this.shade600 = const Color(0xFF3F8CFF),
    this.shade700 = const Color(0xFF2563EB),
    this.shade800 = const Color(0xFF1D4ED8),
    this.shade900 = const Color(0xFF1E3A8A),
    this.shade950 = const Color(0xFF172554),
  });
}

/// Figma scale: `Colors/Warning/{50…950}`
class EeagleColorsWarning {
  final Color shade50;
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;
  final Color shade950;

  const EeagleColorsWarning({
    this.shade50 = const Color(0xFFFFFBEB),
    this.shade100 = const Color(0xFFFEF3C7),
    this.shade200 = const Color(0xFFFDE68A),
    this.shade300 = const Color(0xFFFCD34D),
    this.shade400 = const Color(0xFFFBBF24),
    this.shade500 = const Color(0xFFF59E0B),
    this.shade600 = const Color(0xFFD97706),
    this.shade700 = const Color(0xFFB45309),
    this.shade800 = const Color(0xFF92400E),
    this.shade900 = const Color(0xFF78350F),
    this.shade950 = const Color(0xFF451A03),
  });
}

class EeagleColorsPalette {
  final EeagleColorsElementary elementary;
  final EeagleColorsSurfaceDim surfaceDim;
  final EeagleColorsTexts texts;
  final EeagleColorsSuccess success;
  final EeagleColorsError error;
  final EeagleColorsNatural natural;
  final EeagleColorsPrimary primary;
  final EeagleColorsWarning warning;

  const EeagleColorsPalette({
    this.elementary = const EeagleColorsElementary(),
    this.surfaceDim = const EeagleColorsSurfaceDim(),
    this.texts = const EeagleColorsTexts(),
    this.success = const EeagleColorsSuccess(),
    this.error = const EeagleColorsError(),
    this.natural = const EeagleColorsNatural(),
    this.primary = const EeagleColorsPrimary(),
    this.warning = const EeagleColorsWarning(),
  });
}

/// Eeagle design-system colors (Figma **Colors** collection).
class EeagleColors {
  final EeagleColorsPalette palette;

  const EeagleColors({this.palette = const EeagleColorsPalette()});

  Color get brandPrimary => palette.elementary.primary;
  Color get background => palette.surfaceDim.primaryAlt;
  Color get surface => palette.surfaceDim.primary;
  Color get surfaceAlt => palette.surfaceDim.naturalAlt;
  Color get foregroundPrimary => palette.texts.onSurfacePrimary;
  Color get foregroundSecondary => palette.texts.natural;
  Color get foregroundDisabled => palette.natural.shade500;
  Color get divider => palette.natural.shade700;
  Color get border => palette.natural.shade700;
  Color get error => palette.error.shade500;
  Color get success => palette.success.shade500;
  Color get warning => palette.warning.shade500;
  Color get onPrimary => palette.texts.white;
  Color get onError => palette.texts.red;
  Color get onSuccess => palette.texts.green;
  Color get chipBorder => const Color(0xFF2F3A52);
  Color get inputSurface => palette.surfaceDim.naturalAlt;
  Color get screenBackground => const Color(0xFF10131B);
  Color get chipLabel => palette.natural.shade200;
  Color get glassBorder => Colors.white.withValues(alpha: 0.24);
  Color get glassFill => Colors.white.withValues(alpha: 0.12);
  Color get titleNatural => const Color(0xFFECF2FD);
  Color get bodyText => const Color(0xFF95A3C2);
  Color get inputFieldSurface => const Color(0xFF1F2736);
  Color get socialButtonFill => const Color(0xFFECF2FD);
  Color get orBadgeBackground => const Color(0xFF0D121E);
  Color get descriptionMuted => const Color(0xFFA1A8B3);
  Color get brandPrimaryAccent => const Color(0xFF2563EB);
}

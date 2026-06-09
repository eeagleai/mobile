import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme_data.dart';
import 'package:flutter/material.dart';

class EeagleTheme extends InheritedWidget {
  final EeagleThemeData data;

  const EeagleTheme({super.key, required this.data, required super.child});

  static EeagleThemeData of(BuildContext context) {
    final inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<EeagleTheme>();
    assert(inheritedTheme != null, 'No EeagleTheme found in context');
    return inheritedTheme!.data;
  }

  @override
  bool updateShouldNotify(covariant EeagleTheme oldWidget) {
    return data != oldWidget.data;
  }
}

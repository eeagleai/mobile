import 'package:eeagle_ai/src/presentation/navigation/routes/routes.dart';
import 'package:eeagle_ai/src/presentation/splash/splash_screen.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EeagleApp extends StatelessWidget {
  const EeagleApp({super.key});

  @override
  Widget build(BuildContext context) {
    GoogleFonts.config.allowRuntimeFetching = true;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eeagle AI',
      theme: appTheme.toMaterialTheme(),
      onGenerateRoute: AppRoutes.generateRoute,
      builder: (context, child) => EeagleTheme(
        data: appTheme,
        child: child ?? const SizedBox.shrink(),
      ),
      home: const SplashScreen(),
    );
  }
}

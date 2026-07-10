import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes_constants.dart';
import 'package:eeagle_ai/src/presentation/signup/signup_screen.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await di.reset();
    await configureDependencies();
  });

  testWidgets('Signup route opens Signup', (tester) async {
    await tester.pumpWidget(
      EeagleTheme(
        data: appTheme,
        child: MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: RoutesConstants.signup,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(SignupScreen), findsOneWidget);
    expect(find.text('Sign up with your email and password'), findsOneWidget);
  });

  testWidgets('Signup screen shows password confirmation and terms', (
    tester,
  ) async {
    await tester.pumpWidget(
      EeagleTheme(
        data: appTheme,
        child: const MaterialApp(home: SignupScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Sign up with your email and password'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.byType(Checkbox), findsOneWidget);
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_session_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/llm_chat_screen.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_back_button.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLlmChatSessionBloc extends MockBloc<LlmChatSessionEvent, LlmChatSessionState>
    implements LlmChatSessionBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const site = Site(
    apikey: 'test-api-key',
    siteId: 'site-1',
    name: 'Aurenix Demo',
    host: 'demo.eeagle.ai',
    quotaRemaining: 42,
  );

  late _MockLlmChatSessionBloc sessionBloc;

  setUp(() async {
    await di.reset();
    await configureDependencies();

    sessionBloc = _MockLlmChatSessionBloc();
    when(() => sessionBloc.state).thenReturn(const LlmChatSessionState());
    when(() => sessionBloc.stream).thenAnswer(
      (_) => Stream.value(const LlmChatSessionState()),
    );

    if (di.isRegistered<LlmChatSessionBloc>()) {
      await di.unregister<LlmChatSessionBloc>();
    }
    di.registerFactory<LlmChatSessionBloc>(() => sessionBloc);
  });

  testWidgets('shows site title, back button, and site-specific greeting', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      EeagleTheme(
        data: appTheme,
        child: const MaterialApp(
          home: LlmChatScreen(site: site),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Aurenix Demo'), findsOneWidget);
    expect(find.text('demo.eeagle.ai'), findsOneWidget);
    expect(find.text('42 changes remaining'), findsOneWidget);
    expect(find.byType(LlmChatBackButton), findsOneWidget);
    expect(
      find.textContaining('How can I help you with'),
      findsOneWidget,
    );
    expect(find.textContaining('Aurenix Demo today?'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsNothing);
  });
}

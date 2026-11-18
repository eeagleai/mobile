import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/model/site_revision.dart';
import 'package:eeagle_ai/src/domain/model/site_rollback_result.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_session_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/revision_history_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/llm_chat_screen.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/widgets/llm_chat_back_button.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLlmChatSessionBloc
    extends MockBloc<LlmChatSessionEvent, LlmChatSessionState>
    implements LlmChatSessionBloc {}

class _MockRevisionHistoryBloc
    extends MockBloc<RevisionHistoryEvent, RevisionHistoryState>
    implements RevisionHistoryBloc {}

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
  late _MockRevisionHistoryBloc revisionHistoryBloc;
  late StreamController<RevisionHistoryState> revisionStates;

  final revision = SiteRevision(
    id: 'revision-1',
    sha256: 'sha-1',
    kind: 'frontend',
    createdAt: DateTime.utc(2026, 7, 14, 10, 15),
    userSummary:
        'Improve the homepage call to action and make the message clearer',
  );

  setUp(() async {
    await di.reset();
    await configureDependencies();

    sessionBloc = _MockLlmChatSessionBloc();
    revisionHistoryBloc = _MockRevisionHistoryBloc();
    revisionStates = StreamController<RevisionHistoryState>.broadcast();
    when(() => sessionBloc.state).thenReturn(const LlmChatSessionState());
    when(
      () => sessionBloc.stream,
    ).thenAnswer((_) => Stream.value(const LlmChatSessionState()));
    when(() => revisionHistoryBloc.state).thenReturn(
      RevisionHistoryState(
        status: RevisionHistoryStatus.loaded,
        revisions: [revision],
      ),
    );
    when(
      () => revisionHistoryBloc.stream,
    ).thenAnswer((_) => revisionStates.stream);

    if (di.isRegistered<LlmChatSessionBloc>()) {
      await di.unregister<LlmChatSessionBloc>();
    }
    di.registerFactory<LlmChatSessionBloc>(() => sessionBloc);
    if (di.isRegistered<RevisionHistoryBloc>()) {
      await di.unregister<RevisionHistoryBloc>();
    }
    di.registerFactory<RevisionHistoryBloc>(() => revisionHistoryBloc);
  });

  tearDown(() async {
    await revisionStates.close();
  });

  testWidgets('shows site title, back button, and site-specific greeting', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      EeagleTheme(
        data: appTheme,
        child: const MaterialApp(home: LlmChatScreen(site: site)),
      ),
    );
    await tester.pump();

    expect(find.text('eeagle.ai'), findsOneWidget);
    expect(find.text('demo.eeagle.ai'), findsOneWidget);
    expect(find.textContaining('42 changes remaining'), findsOneWidget);
    expect(find.text('Preview'), findsOneWidget);
    expect(find.byType(LlmChatBackButton), findsOneWidget);
    expect(find.textContaining('How can I help you bring'), findsOneWidget);
    expect(find.textContaining('Aurenix Demo'), findsWidgets);
    expect(find.byIcon(Icons.add), findsNothing);
  });

  testWidgets('opens version history from the chat menu', (tester) async {
    await tester.pumpWidget(
      EeagleTheme(
        data: appTheme,
        child: const MaterialApp(home: LlmChatScreen(site: site)),
      ),
    );
    await tester.pump();

    await tester.tap(find.byTooltip('More options'));
    await tester.pumpAndSettle();
    expect(find.text('Version history'), findsOneWidget);

    await tester.tap(find.text('Version history'));
    await tester.pumpAndSettle();

    expect(
      find.text('Restore a previously saved website version.'),
      findsOneWidget,
    );
    expect(
      find.textContaining('Improve the homepage call to action'),
      findsOneWidget,
    );
    expect(find.text('Frontend'), findsOneWidget);

    await tester.tap(find.byTooltip('Restore version'));
    await tester.pumpAndSettle();

    expect(find.text('Restore this version?'), findsOneWidget);
    expect(find.text('Restore version'), findsOneWidget);
  });

  testWidgets('shows success after a restored version closes the sheet', (
    tester,
  ) async {
    await tester.pumpWidget(
      EeagleTheme(
        data: appTheme,
        child: const MaterialApp(home: LlmChatScreen(site: site)),
      ),
    );
    await tester.pump();

    await tester.tap(find.byTooltip('More options'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Version history'));
    await tester.pumpAndSettle();

    revisionStates.add(
      RevisionHistoryState(
        status: RevisionHistoryStatus.loaded,
        revisions: [revision],
        rollbackResult: const SiteRollbackResult(
          rolledBackTo: 'revision-1',
          kind: 'frontend',
          quotaRefunded: true,
          reloadSucceeded: true,
          quotaRemaining: 9,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Website version restored.'), findsOneWidget);
  });
}

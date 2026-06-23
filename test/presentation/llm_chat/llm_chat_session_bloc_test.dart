import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/chat_connection_phase.dart';
import 'package:eeagle_ai/src/domain/model/chat_inbound_event.dart';
import 'package:eeagle_ai/src/domain/model/chat_message.dart';
import 'package:eeagle_ai/src/domain/model/chat_session.dart';
import 'package:eeagle_ai/src/domain/model/chat_session_config.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/domain/model/clickable_page_link.dart';
import 'package:eeagle_ai/src/domain/model/site_preview_action.dart';
import 'package:eeagle_ai/src/domain/use_case/connect_chat_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/disconnect_chat_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/mint_chat_token_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/resolve_message_page_paths_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/send_chat_message_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_chat_inbound_events_use_case.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_session_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockMintChatTokenUseCase extends Mock implements MintChatTokenUseCase {}

class _MockConnectChatSessionUseCase extends Mock
    implements ConnectChatSessionUseCase {}

class _MockSendChatMessageUseCase extends Mock
    implements SendChatMessageUseCase {}

class _MockDisconnectChatSessionUseCase extends Mock
    implements DisconnectChatSessionUseCase {}

class _MockWatchChatInboundEventsUseCase extends Mock
    implements WatchChatInboundEventsUseCase {}

const _site = Site(
  apikey: 'site-key',
  siteId: 'site-1',
  name: 'Demo Site',
  host: 'demo.eeagle.ai',
);

const _session = ChatSession(
  token: 'chat-jwt',
  wsUrl: 'wss://chat.eeagle.ai/ws',
  conversationId: 'conv-1',
  conversationSessionId: 'sess-1',
  routeKey: '/',
  config: ChatSessionConfig(remaining: 9),
);

void main() {
  late _MockMintChatTokenUseCase mintChatToken;
  late _MockConnectChatSessionUseCase connectChatSession;
  late _MockSendChatMessageUseCase sendChatMessage;
  late _MockDisconnectChatSessionUseCase disconnectChatSession;
  late _MockWatchChatInboundEventsUseCase watchChatInboundEvents;
  late StreamController<ChatInboundEvent> inboundEvents;

  setUpAll(() {
    registerFallbackValue(_session);
  });

  setUp(() {
    mintChatToken = _MockMintChatTokenUseCase();
    connectChatSession = _MockConnectChatSessionUseCase();
    sendChatMessage = _MockSendChatMessageUseCase();
    disconnectChatSession = _MockDisconnectChatSessionUseCase();
    watchChatInboundEvents = _MockWatchChatInboundEventsUseCase();
    inboundEvents = StreamController<ChatInboundEvent>.broadcast();

    when(() => watchChatInboundEvents()).thenAnswer((_) => inboundEvents.stream);
    when(() => disconnectChatSession()).thenReturn(
      TaskEither(() async => right(unit)),
    );
  });

  tearDown(() async {
    await inboundEvents.close();
  });

  LlmChatSessionBloc createBloc() {
    return LlmChatSessionBloc(
      mintChatToken,
      connectChatSession,
      sendChatMessage,
      disconnectChatSession,
      watchChatInboundEvents,
      ResolveMessagePagePathsUseCase(),
    );
  }

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'connects on started and sets quota from session config',
    build: () {
      when(
        () => mintChatToken(
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
          newChat: any(named: 'newChat'),
        ),
      ).thenReturn(TaskEither(() async => right(_session)));
      when(
        () => connectChatSession(
          session: any(named: 'session'),
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
        ),
      ).thenReturn(TaskEither(() async => right(unit)));
      return createBloc();
    },
    act: (bloc) => bloc.add(const LlmChatSessionEvent.started(site: _site)),
    expect: () => [
      const LlmChatSessionState(connectionPhase: ChatConnectionPhase.connecting),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connected,
        quotaRemaining: 9,
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'appends assistant reply from inbound stream',
    build: () => createBloc(),
    seed: () => const LlmChatSessionState(
      connectionPhase: ChatConnectionPhase.connected,
      quotaRemaining: 9,
      messages: [
        ChatMessage(
          id: 'message-1',
          role: ChatMessageRole.user,
          content: 'Hello',
        ),
      ],
    ),
    act: (bloc) {
      bloc.add(
        const LlmChatSessionEvent.inboundEventReceived(
          ChatInboundEvent.message(
            role: ChatMessageRole.assistant,
            content: 'Hi there',
          ),
        ),
      );
    },
    expect: () => [
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connected,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Hello',
          ),
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content: 'Hi there',
            isStreaming: true,
          ),
        ],
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'surfaces mint token failures',
    build: () {
      when(
        () => mintChatToken(
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
          newChat: any(named: 'newChat'),
        ),
      ).thenReturn(
        TaskEither(
          () async => left(const OperationFailure('Token failed')),
        ),
      );
      return createBloc();
    },
    act: (bloc) => bloc.add(const LlmChatSessionEvent.started(site: _site)),
    expect: () => [
      const LlmChatSessionState(connectionPhase: ChatConnectionPhase.connecting),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.error,
        errorMessage: 'Token failed',
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'shows assistant error as a chat bubble',
    build: () => createBloc(),
    seed: () => const LlmChatSessionState(
      connectionPhase: ChatConnectionPhase.processing,
      messages: [
        ChatMessage(
          id: 'message-1',
          role: ChatMessageRole.user,
          content: 'Hello',
        ),
      ],
    ),
    act: (bloc) {
      bloc.add(
        const LlmChatSessionEvent.inboundEventReceived(
          ChatInboundEvent.error(
            error: 'assistant_error',
            detail: 'LLM HTTP 401 Unauthorized invalid_api_key',
          ),
        ),
      );
    },
    expect: () => [
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Hello',
          ),
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content:
                'AI is not configured for this site. Check the site LLM API key on Eeagle.',
          ),
        ],
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'adds clickable page links when assistant mentions paths in text',
    build: () {
      when(
        () => mintChatToken(
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
          newChat: any(named: 'newChat'),
        ),
      ).thenReturn(TaskEither(() async => right(_session)));
      when(
        () => connectChatSession(
          session: any(named: 'session'),
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
        ),
      ).thenReturn(TaskEither(() async => right(unit)));
      return createBloc();
    },
    act: (bloc) async {
      bloc.add(const LlmChatSessionEvent.started(site: _site));
      await bloc.stream.firstWhere(
        (state) => state.connectionPhase == ChatConnectionPhase.connected,
      );
      bloc
        ..add(
          const LlmChatSessionEvent.inboundEventReceived(
            ChatInboundEvent.message(
              role: ChatMessageRole.assistant,
              content: 'You have /flowers and /about pages.',
            ),
          ),
        )
        ..add(
          const LlmChatSessionEvent.inboundEventReceived(
            ChatInboundEvent.assistantFinished(),
          ),
        );
    },
    expect: () => [
      const LlmChatSessionState(connectionPhase: ChatConnectionPhase.connecting),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connected,
        quotaRemaining: 9,
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connected,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content: 'You have /flowers and /about pages.',
            isStreaming: true,
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content: 'You have /flowers and /about pages.',
            clickablePageLinks: [
              ClickablePageLink(
                path: '/flowers',
                url: 'https://demo.eeagle.ai/flowers',
              ),
              ClickablePageLink(
                path: '/about',
                url: 'https://demo.eeagle.ai/about',
              ),
            ],
          ),
        ],
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'emits open preview action when assistant finishes with one page url',
    build: () => createBloc(),
    seed: () => const LlmChatSessionState(
      connectionPhase: ChatConnectionPhase.processing,
      messages: [
        ChatMessage(
          id: 'message-1',
          role: ChatMessageRole.user,
          content: 'Create a flowers page',
        ),
      ],
    ),
    act: (bloc) {
      bloc
        ..add(
          const LlmChatSessionEvent.inboundEventReceived(
            ChatInboundEvent.message(
              role: ChatMessageRole.assistant,
              content: 'Created a flowers page.',
              pageUrls: ['https://demo.eeagle.ai/flowers'],
            ),
          ),
        )
        ..add(
          const LlmChatSessionEvent.inboundEventReceived(
            ChatInboundEvent.assistantFinished(),
          ),
        );
    },
    expect: () => [
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.processing,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Create a flowers page',
          ),
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content: 'Created a flowers page.',
            isStreaming: true,
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Create a flowers page',
          ),
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content: 'Created a flowers page.',
          ),
        ],
        previewAction: SitePreviewAction.open(
          url: 'https://demo.eeagle.ai/flowers',
        ),
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'resolves root page url to current site homepage',
    build: () {
      when(
        () => mintChatToken(
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
          newChat: any(named: 'newChat'),
        ),
      ).thenReturn(TaskEither(() async => right(_session)));
      when(
        () => connectChatSession(
          session: any(named: 'session'),
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
        ),
      ).thenReturn(TaskEither(() async => right(unit)));
      return createBloc();
    },
    seed: () => const LlmChatSessionState(
      connectionPhase: ChatConnectionPhase.processing,
      messages: [
        ChatMessage(
          id: 'message-1',
          role: ChatMessageRole.user,
          content: 'Update homepage',
        ),
      ],
    ),
    act: (bloc) async {
      bloc.add(const LlmChatSessionEvent.started(site: _site));
      await bloc.stream.firstWhere(
        (state) => state.connectionPhase == ChatConnectionPhase.connected,
      );
      bloc
        ..add(
          const LlmChatSessionEvent.inboundEventReceived(
            ChatInboundEvent.message(
              role: ChatMessageRole.assistant,
              content: 'Updated the homepage.',
              pageUrls: ['/'],
            ),
          ),
        )
        ..add(
          const LlmChatSessionEvent.inboundEventReceived(
            ChatInboundEvent.assistantFinished(),
          ),
        );
    },
    expect: () => [
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connecting,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Update homepage',
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connected,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Update homepage',
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connected,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Update homepage',
          ),
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content: 'Updated the homepage.',
            isStreaming: true,
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Update homepage',
          ),
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content: 'Updated the homepage.',
          ),
        ],
        previewAction: SitePreviewAction.open(
          url: 'https://demo.eeagle.ai/',
        ),
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'emits choose preview action when assistant finishes with multiple page urls',
    build: () => createBloc(),
    seed: () => const LlmChatSessionState(
      connectionPhase: ChatConnectionPhase.processing,
      messages: [
        ChatMessage(
          id: 'message-1',
          role: ChatMessageRole.user,
          content: 'Update pages',
        ),
      ],
    ),
    act: (bloc) {
      bloc
        ..add(
          const LlmChatSessionEvent.inboundEventReceived(
            ChatInboundEvent.message(
              role: ChatMessageRole.assistant,
              content: 'Updated multiple pages.',
              pageUrls: [
                'https://demo.eeagle.ai/flowers',
                'https://demo.eeagle.ai/about',
              ],
            ),
          ),
        )
        ..add(
          const LlmChatSessionEvent.inboundEventReceived(
            ChatInboundEvent.assistantFinished(),
          ),
        );
    },
    expect: () => [
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.processing,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Update pages',
          ),
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content: 'Updated multiple pages.',
            isStreaming: true,
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Update pages',
          ),
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content: 'Updated multiple pages.',
          ),
        ],
        previewAction: SitePreviewAction.choose(
          urls: [
            'https://demo.eeagle.ai/flowers',
            'https://demo.eeagle.ai/about',
          ],
        ),
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'clears preview action when consumed',
    build: () => createBloc(),
    seed: () => const LlmChatSessionState(
      connectionPhase: ChatConnectionPhase.idle,
      previewAction: SitePreviewAction.open(url: 'https://demo.eeagle.ai/flowers'),
    ),
    act: (bloc) {
      bloc.add(const LlmChatSessionEvent.previewActionConsumed());
    },
    expect: () => [
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'handles connection lost silently without assistant bubble',
    build: () => createBloc(),
    seed: () => const LlmChatSessionState(
      connectionPhase: ChatConnectionPhase.connected,
      quotaRemaining: 9,
      messages: [
        ChatMessage(
          id: 'message-1',
          role: ChatMessageRole.user,
          content: 'List all pages',
        ),
        ChatMessage(
          id: 'message-1',
          role: ChatMessageRole.assistant,
          content: 'Here are your pages: /flowers, /about',
        ),
      ],
    ),
    act: (bloc) {
      bloc.add(
        const LlmChatSessionEvent.inboundEventReceived(
          ChatInboundEvent.connectionLost(),
        ),
      );
    },
    expect: () => [
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'List all pages',
          ),
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content: 'Here are your pages: /flowers, /about',
          ),
        ],
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'reconnects and sends when socket was lost before next message',
    build: () {
      when(
        () => mintChatToken(
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
          newChat: any(named: 'newChat'),
        ),
      ).thenReturn(TaskEither(() async => right(_session)));
      when(
        () => connectChatSession(
          session: any(named: 'session'),
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
        ),
      ).thenReturn(TaskEither(() async => right(unit)));
      when(
        () => sendChatMessage(
          text: any(named: 'text'),
          conversationSessionId: any(named: 'conversationSessionId'),
        ),
      ).thenReturn(TaskEither(() async => right(unit)));
      return createBloc();
    },
    act: (bloc) async {
      bloc.add(const LlmChatSessionEvent.started(site: _site));
      await bloc.stream.firstWhere(
        (state) => state.connectionPhase == ChatConnectionPhase.connected,
      );
      bloc.add(
        const LlmChatSessionEvent.inboundEventReceived(
          ChatInboundEvent.connectionLost(),
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.connectionPhase == ChatConnectionPhase.idle,
      );
      bloc.add(const LlmChatSessionEvent.messageSent(text: 'hi'));
    },
    expect: () => [
      const LlmChatSessionState(connectionPhase: ChatConnectionPhase.connecting),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connected,
        quotaRemaining: 9,
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        quotaRemaining: 9,
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'hi',
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connected,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'hi',
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.processing,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'hi',
          ),
        ],
      ),
    ],
    verify: (_) {
      verify(
        () => mintChatToken(
          apikey: _site.apikey,
          pageUrl: 'https://demo.eeagle.ai/',
          model: any(named: 'model'),
          newChat: false,
        ),
      ).called(1);
      verify(
        () => sendChatMessage(
          text: 'hi',
          conversationSessionId: _session.conversationSessionId,
        ),
      ).called(1);
    },
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'returns to idle when send fails after reconnect',
    build: () {
      when(
        () => mintChatToken(
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
          newChat: any(named: 'newChat'),
        ),
      ).thenReturn(TaskEither(() async => right(_session)));
      when(
        () => connectChatSession(
          session: any(named: 'session'),
          apikey: any(named: 'apikey'),
          pageUrl: any(named: 'pageUrl'),
          model: any(named: 'model'),
        ),
      ).thenReturn(TaskEither(() async => right(unit)));
      when(
        () => sendChatMessage(
          text: any(named: 'text'),
          conversationSessionId: any(named: 'conversationSessionId'),
        ),
      ).thenReturn(
        TaskEither(
          () async => left(
            const OperationFailure(
              'Chat is not connected.',
              code: 'not-connected',
            ),
          ),
        ),
      );
      return createBloc();
    },
    act: (bloc) async {
      bloc.add(const LlmChatSessionEvent.started(site: _site));
      await bloc.stream.firstWhere(
        (state) => state.connectionPhase == ChatConnectionPhase.connected,
      );
      bloc.add(
        const LlmChatSessionEvent.inboundEventReceived(
          ChatInboundEvent.connectionLost(),
        ),
      );
      await bloc.stream.firstWhere(
        (state) => state.connectionPhase == ChatConnectionPhase.idle,
      );
      bloc.add(const LlmChatSessionEvent.messageSent(text: 'hi'));
    },
    expect: () => [
      const LlmChatSessionState(connectionPhase: ChatConnectionPhase.connecting),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connected,
        quotaRemaining: 9,
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        quotaRemaining: 9,
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'hi',
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.connected,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'hi',
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.processing,
        quotaRemaining: 9,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'hi',
          ),
        ],
      ),
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        quotaRemaining: 9,
        errorMessage: 'Chat is not connected.',
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'hi',
          ),
        ],
      ),
    ],
  );

  blocTest<LlmChatSessionBloc, LlmChatSessionState>(
    'adds fallback assistant message when turn finishes without a reply',
    build: () => createBloc(),
    seed: () => const LlmChatSessionState(
      connectionPhase: ChatConnectionPhase.processing,
      messages: [
        ChatMessage(
          id: 'message-1',
          role: ChatMessageRole.user,
          content: 'Hello',
        ),
      ],
    ),
    act: (bloc) {
      bloc.add(
        const LlmChatSessionEvent.inboundEventReceived(
          ChatInboundEvent.assistantFinished(),
        ),
      );
    },
    expect: () => [
      const LlmChatSessionState(
        connectionPhase: ChatConnectionPhase.idle,
        messages: [
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.user,
            content: 'Hello',
          ),
          ChatMessage(
            id: 'message-1',
            role: ChatMessageRole.assistant,
            content:
                'No response received. Check that AI is configured for this site.',
          ),
        ],
      ),
    ],
  );
}

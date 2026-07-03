import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/analytics_connection_status.dart';
import 'package:eeagle_ai/src/domain/model/live_assist_send_status.dart';
import 'package:eeagle_ai/src/domain/model/live_chat_message.dart';
import 'package:eeagle_ai/src/domain/use_case/mark_conversation_read_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/save_owner_message_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/send_live_assist_message_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_conversation_messages_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_socket_connection_status_use_case.dart';
import 'package:eeagle_ai/src/presentation/live_conversation/bloc/live_conversation_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockSendLiveAssistMessageUseCase extends Mock
    implements SendLiveAssistMessageUseCase {}

class _MockWatchConversationMessagesUseCase extends Mock
    implements WatchConversationMessagesUseCase {}

class _MockSaveOwnerMessageUseCase extends Mock
    implements SaveOwnerMessageUseCase {}

class _MockUpdateOwnerMessageStatusUseCase extends Mock
    implements UpdateOwnerMessageStatusUseCase {}

class _MockMarkConversationReadUseCase extends Mock
    implements MarkConversationReadUseCase {}

class _MockWatchSocketConnectionStatusUseCase extends Mock
    implements WatchSocketConnectionStatusUseCase {}

const _apikey = 'site-key';
const _conversationId = 'conv-1';

final _visitorMessage = LiveChatMessage(
  id: 'msg-1',
  sender: LiveChatSender.visitor,
  text: 'Hello',
  status: LiveChatMessageStatus.sent,
  createdAt: DateTime(2025, 1, 1),
);

void main() {
  late _MockSendLiveAssistMessageUseCase sendMessage;
  late _MockWatchConversationMessagesUseCase watchMessages;
  late _MockSaveOwnerMessageUseCase saveOwnerMessage;
  late _MockUpdateOwnerMessageStatusUseCase updateOwnerMessageStatus;
  late _MockMarkConversationReadUseCase markConversationRead;
  late _MockWatchSocketConnectionStatusUseCase watchConnectionStatus;
  late StreamController<List<LiveChatMessage>> messagesController;
  late LiveConversationBloc bloc;

  setUpAll(() {
    registerFallbackValue(LiveChatMessageStatus.sending);
    registerFallbackValue(DateTime(2025));
  });

  setUp(() {
    sendMessage = _MockSendLiveAssistMessageUseCase();
    watchMessages = _MockWatchConversationMessagesUseCase();
    saveOwnerMessage = _MockSaveOwnerMessageUseCase();
    updateOwnerMessageStatus = _MockUpdateOwnerMessageStatusUseCase();
    markConversationRead = _MockMarkConversationReadUseCase();
    watchConnectionStatus = _MockWatchSocketConnectionStatusUseCase();
    messagesController = StreamController.broadcast();

    when(() => watchMessages(_conversationId))
        .thenAnswer((_) => messagesController.stream);
    when(() => markConversationRead(_conversationId)).thenAnswer((_) async {});
    when(() => watchConnectionStatus(_apikey))
        .thenReturn(AnalyticsConnectionStatus.live);
    when(
      () => saveOwnerMessage(
        siteApiKey: any(named: 'siteApiKey'),
        conversationId: any(named: 'conversationId'),
        localId: any(named: 'localId'),
        text: any(named: 'text'),
        createdAt: any(named: 'createdAt'),
      ),
    ).thenAnswer((_) async => 'local-0');
    when(
      () => updateOwnerMessageStatus(
        localId: any(named: 'localId'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async {});

    bloc = LiveConversationBloc(
      sendMessage,
      watchMessages,
      saveOwnerMessage,
      updateOwnerMessageStatus,
      markConversationRead,
      watchConnectionStatus,
    );
  });

  tearDown(() async {
    await messagesController.close();
    await bloc.close();
  });

  blocTest<LiveConversationBloc, LiveConversationState>(
    'started marks conversation read and watches local messages',
    build: () => bloc,
    act: (bloc) async {
      bloc.add(
        const LiveConversationEvent.started(
          apikey: _apikey,
          conversationId: _conversationId,
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 20));
      messagesController.add([_visitorMessage]);
    },
    verify: (bloc) {
      expect(bloc.state.messages, [_visitorMessage]);
      verify(() => markConversationRead(_conversationId)).called(1);
      verify(() => watchMessages(_conversationId)).called(1);
      verify(() => watchConnectionStatus(_apikey)).called(greaterThan(0));
    },
  );

  blocTest<LiveConversationBloc, LiveConversationState>(
    'messageSent saves locally then posts to API',
    build: () {
      when(
        () => sendMessage(
          apikey: _apikey,
          conversationId: _conversationId,
          message: 'Hi there',
        ),
      ).thenReturn(
        TaskEither(() async => right(LiveAssistSendStatus.ok)),
      );
      return bloc;
    },
    act: (bloc) async {
      bloc.add(
        const LiveConversationEvent.started(
          apikey: _apikey,
          conversationId: _conversationId,
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 10));
      bloc.add(const LiveConversationEvent.messageSent(text: 'Hi there'));
      await Future<void>.delayed(const Duration(milliseconds: 50));
    },
    verify: (_) {
      verify(
        () => saveOwnerMessage(
          siteApiKey: _apikey,
          conversationId: _conversationId,
          localId: any(named: 'localId'),
          text: 'Hi there',
          createdAt: any(named: 'createdAt'),
        ),
      ).called(1);
      verify(
        () => sendMessage(
          apikey: _apikey,
          conversationId: _conversationId,
          message: 'Hi there',
        ),
      ).called(1);
      verify(
        () => updateOwnerMessageStatus(
          localId: any(named: 'localId'),
          status: LiveChatMessageStatus.sent,
        ),
      ).called(1);
    },
  );

  blocTest<LiveConversationBloc, LiveConversationState>(
    'messageSent marks failed when API returns failure',
    build: () {
      when(
        () => sendMessage(
          apikey: _apikey,
          conversationId: _conversationId,
          message: 'Hi there',
        ),
      ).thenReturn(
        TaskEither(
          () async => left(const OperationFailure('Network error')),
        ),
      );
      return bloc;
    },
    act: (bloc) async {
      bloc.add(
        const LiveConversationEvent.started(
          apikey: _apikey,
          conversationId: _conversationId,
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 10));
      bloc.add(const LiveConversationEvent.messageSent(text: 'Hi there'));
      await Future<void>.delayed(const Duration(milliseconds: 50));
    },
    verify: (_) {
      verify(
        () => updateOwnerMessageStatus(
          localId: any(named: 'localId'),
          status: LiveChatMessageStatus.failed,
        ),
      ).called(1);
    },
  );
}

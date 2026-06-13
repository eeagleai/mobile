import 'package:bloc_test/bloc_test.dart';
import 'package:eeagle_ai/src/data/service/attachment_picker_service.dart';
import 'package:eeagle_ai/src/data/service/speech_to_text_service.dart';
import 'package:eeagle_ai/src/domain/model/prompt_attachment.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSpeechToTextService extends Mock implements SpeechToTextService {}

class _MockAttachmentPickerService extends Mock
    implements AttachmentPickerService {}

const _sampleAttachment = PromptAttachment(
  id: 'attachment-1',
  name: 'photo.png',
  path: '/tmp/photo.png',
  extension: 'png',
  sizeBytes: 1024,
);

const _secondAttachment = PromptAttachment(
  id: 'attachment-2',
  name: 'notes.pdf',
  path: '/tmp/notes.pdf',
  extension: 'pdf',
  sizeBytes: 2048,
);

void main() {
  late _MockSpeechToTextService speechToText;
  late _MockAttachmentPickerService attachmentPicker;
  late LlmChatPromptBloc bloc;

  setUp(() {
    speechToText = _MockSpeechToTextService();
    attachmentPicker = _MockAttachmentPickerService();
    when(() => speechToText.isListening).thenReturn(false);
    when(() => speechToText.stopListening()).thenAnswer((_) async {});
    when(() => speechToText.endSession()).thenAnswer((_) async {});
    when(() => speechToText.detach()).thenReturn(null);
    when(() => speechToText.dispose()).thenAnswer((_) async {});
    when(() => attachmentPicker.pickMedia()).thenAnswer((_) async => const []);
    when(() => attachmentPicker.pickFiles()).thenAnswer((_) async => const []);
    bloc = LlmChatPromptBloc(
      speechToText,
      attachmentPicker,
      deferSpeechInitialization: false,
    );
  });

  tearDown(() => bloc.close());

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'defers speech initialization on macOS until mic is toggled',
    build: () {
      when(
        () => speechToText.initialize(
          onError: any(named: 'onError'),
          onStatus: any(named: 'onStatus'),
        ),
      ).thenAnswer((_) async => true);
      when(
        () => speechToText.startListening(
          onResult: any(named: 'onResult'),
          onSoundLevel: any(named: 'onSoundLevel'),
        ),
      ).thenAnswer((_) async => true);
      return LlmChatPromptBloc(
        speechToText,
        attachmentPicker,
        deferSpeechInitialization: true,
      );
    },
    act: (bloc) async {
      bloc.add(const LlmChatPromptEvent.initialized());
      await Future<void>.delayed(Duration.zero);
      bloc.add(const LlmChatPromptEvent.micToggled());
    },
    expect: () => [
      const LlmChatPromptState(),
      const LlmChatPromptState(isInitializing: true),
      const LlmChatPromptState(isSpeechAvailable: true),
      const LlmChatPromptState(
        isSpeechAvailable: true,
        isListening: true,
        soundLevel: 0,
      ),
    ],
    verify: (_) {
      verify(
        () => speechToText.initialize(
          onError: any(named: 'onError'),
          onStatus: any(named: 'onStatus'),
        ),
      ).called(1);
    },
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'marks speech available after initialization',
    build: () {
      when(
        () => speechToText.initialize(
          onError: any(named: 'onError'),
          onStatus: any(named: 'onStatus'),
        ),
      ).thenAnswer((_) async => true);
      return bloc;
    },
    act: (bloc) => bloc.add(const LlmChatPromptEvent.initialized()),
    expect: () => [
      const LlmChatPromptState(isInitializing: true),
      const LlmChatPromptState(isSpeechAvailable: true),
    ],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'updates prompt text from speech results',
    build: () => bloc,
    act: (bloc) => bloc.add(
      const LlmChatPromptEvent.speechResultReceived(
        words: 'Hello world',
        isFinal: true,
      ),
    ),
    expect: () => [
      const LlmChatPromptState(promptText: 'Hello world', isListening: false),
    ],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'starts listening when mic is toggled',
    build: () {
      when(() => speechToText.endSession()).thenAnswer((_) async {});
      when(
        () => speechToText.startListening(
          onResult: any(named: 'onResult'),
          onSoundLevel: any(named: 'onSoundLevel'),
        ),
      ).thenAnswer((_) async => true);
      return bloc;
    },
    seed: () => const LlmChatPromptState(isSpeechAvailable: true),
    act: (bloc) => bloc.add(const LlmChatPromptEvent.micToggled()),
    expect: () => [
      const LlmChatPromptState(
        isSpeechAvailable: true,
        isListening: true,
        soundLevel: 0,
      ),
    ],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'clears prompt text and attachments on send',
    build: () => bloc,
    seed: () => const LlmChatPromptState(
      promptText: 'Send me',
      attachments: [_sampleAttachment],
    ),
    act: (bloc) => bloc.add(const LlmChatPromptEvent.sendRequested()),
    expect: () => [
      const LlmChatPromptState(
        promptText: '',
        attachments: [],
        isListening: false,
      ),
    ],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'does not send when prompt and attachments are empty',
    build: () => bloc,
    act: (bloc) => bloc.add(const LlmChatPromptEvent.sendRequested()),
    expect: () => <LlmChatPromptState>[],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'adds picked media attachments to state',
    build: () {
      when(() => attachmentPicker.pickMedia()).thenAnswer(
        (_) async => [_sampleAttachment, _secondAttachment],
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const LlmChatPromptEvent.pickMediaRequested()),
    expect: () => [
      const LlmChatPromptState(
        attachments: [_sampleAttachment, _secondAttachment],
      ),
    ],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'pickFilesRequested calls pickFiles not pickMedia',
    build: () {
      when(() => attachmentPicker.pickFiles()).thenAnswer(
        (_) async => [_secondAttachment],
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const LlmChatPromptEvent.pickFilesRequested()),
    expect: () => [
      const LlmChatPromptState(attachments: [_secondAttachment]),
    ],
    verify: (_) {
      verify(() => attachmentPicker.pickFiles()).called(1);
      verifyNever(() => attachmentPicker.pickMedia());
    },
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'caps attachments at five and reports skipped files',
    build: () {
      final attachments = List.generate(
        3,
        (index) => PromptAttachment(
          id: 'picked-$index',
          name: 'file-$index.txt',
          path: '/tmp/file-$index.txt',
          extension: 'txt',
        ),
      );
      when(() => attachmentPicker.pickFiles())
          .thenAnswer((_) async => attachments);
      return bloc;
    },
    seed: () => const LlmChatPromptState(
      attachments: [
        _sampleAttachment,
        _secondAttachment,
        PromptAttachment(
          id: 'attachment-3',
          name: 'a.txt',
          path: '/tmp/a.txt',
          extension: 'txt',
        ),
      ],
    ),
    act: (bloc) => bloc.add(const LlmChatPromptEvent.pickFilesRequested()),
    expect: () => [
      LlmChatPromptState(
        attachments: const [
          _sampleAttachment,
          _secondAttachment,
          PromptAttachment(
            id: 'attachment-3',
            name: 'a.txt',
            path: '/tmp/a.txt',
            extension: 'txt',
          ),
          PromptAttachment(
            id: 'picked-0',
            name: 'file-0.txt',
            path: '/tmp/file-0.txt',
            extension: 'txt',
          ),
          PromptAttachment(
            id: 'picked-1',
            name: 'file-1.txt',
            path: '/tmp/file-1.txt',
            extension: 'txt',
          ),
        ],
        errorMessage: 'Only 5 attachments allowed. Extra files were skipped.',
      ),
    ],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'shows message when attachment limit is already reached',
    build: () => bloc,
    seed: () => LlmChatPromptState(
      attachments: List.generate(
        LlmChatPromptBloc.maxAttachments,
        (index) => PromptAttachment(
          id: 'existing-$index',
          name: 'file-$index.txt',
          path: '/tmp/file-$index.txt',
          extension: 'txt',
        ),
      ),
    ),
    act: (bloc) => bloc.add(const LlmChatPromptEvent.pickMediaRequested()),
    expect: () => [
      LlmChatPromptState(
        attachments: List.generate(
          LlmChatPromptBloc.maxAttachments,
          (index) => PromptAttachment(
            id: 'existing-$index',
            name: 'file-$index.txt',
            path: '/tmp/file-$index.txt',
            extension: 'txt',
          ),
        ),
        errorMessage: 'You can attach up to 5 files.',
      ),
    ],
    verify: (_) {
      verifyNever(() => attachmentPicker.pickMedia());
      verifyNever(() => attachmentPicker.pickFiles());
    },
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'removes attachment by id',
    build: () => bloc,
    seed: () => const LlmChatPromptState(
      attachments: [_sampleAttachment, _secondAttachment],
    ),
    act: (bloc) =>
        bloc.add(const LlmChatPromptEvent.attachmentRemoved('attachment-1')),
    expect: () => [
      const LlmChatPromptState(attachments: [_secondAttachment]),
    ],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'updates sound level while listening',
    build: () => bloc,
    seed: () => const LlmChatPromptState(isListening: true),
    act: (bloc) => bloc.add(const LlmChatPromptEvent.soundLevelChanged(0.8)),
    expect: () => [
      const LlmChatPromptState(isListening: true, soundLevel: 0.8),
    ],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'ignores sound level updates when not listening',
    build: () => bloc,
    act: (bloc) => bloc.add(const LlmChatPromptEvent.soundLevelChanged(0.8)),
    expect: () => <LlmChatPromptState>[],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'resets sound level when listening ends',
    build: () => bloc,
    seed: () => const LlmChatPromptState(isListening: true, soundLevel: 0.7),
    act: (bloc) =>
        bloc.add(const LlmChatPromptEvent.speechStatusChanged('done')),
    expect: () => [
      const LlmChatPromptState(isListening: false, soundLevel: 0),
    ],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'ignores benign speech errors like error_no_match',
    build: () => bloc,
    seed: () => const LlmChatPromptState(isListening: true, soundLevel: 0.4),
    act: (bloc) => bloc.add(
      const LlmChatPromptEvent.speechErrorReceived('error_no_match'),
    ),
    expect: () => [
      const LlmChatPromptState(isListening: false, soundLevel: 0),
    ],
  );

  blocTest<LlmChatPromptBloc, LlmChatPromptState>(
    'surfaces non-benign speech errors',
    build: () => bloc,
    seed: () => const LlmChatPromptState(isListening: true),
    act: (bloc) => bloc.add(
      const LlmChatPromptEvent.speechErrorReceived('error_audio'),
    ),
    expect: () => [
      const LlmChatPromptState(
        isListening: false,
        soundLevel: 0,
        errorMessage: 'error_audio',
      ),
    ],
  );

  group('canSend', () {
    test('returns true when prompt text is non-empty', () {
      expect(
        LlmChatPromptBloc.canSend(
          promptText: 'Build me a site',
          attachments: const [],
        ),
        isTrue,
      );
    });

    test('returns true when attachments exist without text', () {
      expect(
        LlmChatPromptBloc.canSend(
          promptText: '   ',
          attachments: const [_sampleAttachment],
        ),
        isTrue,
      );
    });

    test('returns false when prompt and attachments are empty', () {
      expect(
        LlmChatPromptBloc.canSend(
          promptText: '   ',
          attachments: const [],
        ),
        isFalse,
      );
    });
  });
}

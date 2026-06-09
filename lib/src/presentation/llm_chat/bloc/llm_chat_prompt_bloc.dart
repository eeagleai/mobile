import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:eeagle_ai/src/data/service/attachment_picker_service.dart';
import 'package:eeagle_ai/src/data/service/speech_to_text_service.dart';
import 'package:eeagle_ai/src/domain/model/prompt_attachment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'llm_chat_prompt_event.dart';
part 'llm_chat_prompt_state.dart';
part 'llm_chat_prompt_bloc.freezed.dart';

class LlmChatPromptBloc extends Bloc<LlmChatPromptEvent, LlmChatPromptState> {
  LlmChatPromptBloc(this._speechToText, this._attachmentPicker)
      : super(const LlmChatPromptState()) {
    on<_Initialized>(_onInitialized);
    on<_MicToggled>(_onMicToggled, transformer: droppable());
    on<_TextChanged>(_onTextChanged);
    on<_SpeechResultReceived>(_onSpeechResultReceived);
    on<_SpeechStatusChanged>(_onSpeechStatusChanged);
    on<_SpeechErrorReceived>(_onSpeechErrorReceived);
    on<_SendRequested>(_onSendRequested);
    on<_SoundLevelChanged>(_onSoundLevelChanged, transformer: sequential());
    on<_PickMediaRequested>(_onPickMediaRequested);
    on<_PickFilesRequested>(_onPickFilesRequested);
    on<_AttachmentRemoved>(_onAttachmentRemoved);
  }

  final SpeechToTextService _speechToText;
  final AttachmentPickerService _attachmentPicker;
  bool _micOperationInProgress = false;
  DateTime? _lastSoundLevelEmit;

  static const _soundLevelThrottle = Duration(milliseconds: 50);
  static const _soundLevelDeltaThreshold = 0.02;
  static const maxAttachments = 5;

  static bool canSend({
    required String promptText,
    required List<PromptAttachment> attachments,
  }) {
    return promptText.trim().isNotEmpty || attachments.isNotEmpty;
  }

  static bool isIgnorableSpeechError(String message) {
    const ignorable = {
      'error_no_match',
      'error_speech_timeout',
    };

    return ignorable.contains(message.trim().toLowerCase());
  }

  void _safeAdd(LlmChatPromptEvent event) {
    if (!isClosed) {
      add(event);
    }
  }

  double _smoothSoundLevel(double current, double incoming) {
    if (incoming > current) {
      return incoming;
    }

    return current * 0.85 + incoming * 0.15;
  }

  LlmChatPromptState _withListeningEnded(LlmChatPromptState base) {
    return base.copyWith(isListening: false, soundLevel: 0);
  }

  Future<void> _onInitialized(
    _Initialized event,
    Emitter<LlmChatPromptState> emit,
  ) async {
    emit(state.copyWith(isInitializing: true, errorMessage: null));

    final isAvailable = await _speechToText.initialize(
      onError: (message) =>
          _safeAdd(LlmChatPromptEvent.speechErrorReceived(message)),
      onStatus: (status) =>
          _safeAdd(LlmChatPromptEvent.speechStatusChanged(status)),
    );

    if (emit.isDone) {
      return;
    }

    emit(
      state.copyWith(
        isInitializing: false,
        isSpeechAvailable: isAvailable,
        errorMessage: isAvailable ? null : 'Speech recognition is unavailable',
      ),
    );
  }

  Future<void> _onMicToggled(
    _MicToggled event,
    Emitter<LlmChatPromptState> emit,
  ) async {
    if (_micOperationInProgress) {
      return;
    }

    _micOperationInProgress = true;
    try {
      if (state.isListening || _speechToText.isListening) {
        await _speechToText.endSession();
        if (!emit.isDone) {
          emit(_withListeningEnded(state.copyWith(errorMessage: null)));
        }
        return;
      }

      if (!state.isSpeechAvailable || state.isInitializing) {
        if (!emit.isDone) {
          emit(
            state.copyWith(
              errorMessage: state.isInitializing
                  ? 'Speech recognition is still starting'
                  : 'Speech recognition is unavailable on this device',
            ),
          );
        }
        return;
      }

      final started = await _speechToText.startListening(
        onResult: (words, isFinal) {
          _safeAdd(
            LlmChatPromptEvent.speechResultReceived(
              words: words,
              isFinal: isFinal,
            ),
          );
        },
        onSoundLevel: (level) =>
            _safeAdd(LlmChatPromptEvent.soundLevelChanged(level)),
      );

      if (emit.isDone) {
        return;
      }

      if (!started) {
        await _speechToText.endSession();
        emit(
          _withListeningEnded(
            state.copyWith(
              errorMessage:
                  'Could not start listening. Please wait a moment and try again.',
            ),
          ),
        );
        return;
      }

      _lastSoundLevelEmit = null;
      emit(state.copyWith(isListening: true, soundLevel: 0, errorMessage: null));
    } finally {
      _micOperationInProgress = false;
    }
  }

  void _onTextChanged(_TextChanged event, Emitter<LlmChatPromptState> emit) {
    emit(state.copyWith(promptText: event.text, errorMessage: null));
  }

  Future<void> _onPickMediaRequested(
    _PickMediaRequested event,
    Emitter<LlmChatPromptState> emit,
  ) async {
    await _pickAndMergeAttachments(
      emit,
      _attachmentPicker.pickMedia,
    );
  }

  Future<void> _onPickFilesRequested(
    _PickFilesRequested event,
    Emitter<LlmChatPromptState> emit,
  ) async {
    await _pickAndMergeAttachments(
      emit,
      _attachmentPicker.pickFiles,
    );
  }

  Future<void> _pickAndMergeAttachments(
    Emitter<LlmChatPromptState> emit,
    Future<List<PromptAttachment>> Function() pick,
  ) async {
    if (state.attachments.length >= maxAttachments) {
      emit(
        state.copyWith(
          errorMessage: 'You can attach up to $maxAttachments files.',
        ),
      );
      return;
    }

    final picked = await pick();
    if (picked.isEmpty || emit.isDone) {
      return;
    }

    final remainingSlots = maxAttachments - state.attachments.length;
    final accepted = picked.take(remainingSlots).toList();
    final updated = [...state.attachments, ...accepted];

    emit(
      state.copyWith(
        attachments: updated,
        errorMessage: picked.length > remainingSlots
            ? 'Only $maxAttachments attachments allowed. Extra files were skipped.'
            : null,
      ),
    );
  }

  void _onAttachmentRemoved(
    _AttachmentRemoved event,
    Emitter<LlmChatPromptState> emit,
  ) {
    emit(
      state.copyWith(
        attachments: state.attachments
            .where((attachment) => attachment.id != event.id)
            .toList(),
        errorMessage: null,
      ),
    );
  }

  void _onSoundLevelChanged(
    _SoundLevelChanged event,
    Emitter<LlmChatPromptState> emit,
  ) {
    if (!state.isListening) {
      return;
    }

    final smoothed = _smoothSoundLevel(state.soundLevel, event.level);
    final now = DateTime.now();
    final lastEmit = _lastSoundLevelEmit;

    if (lastEmit != null &&
        now.difference(lastEmit) < _soundLevelThrottle &&
        (smoothed - state.soundLevel).abs() < _soundLevelDeltaThreshold) {
      return;
    }

    _lastSoundLevelEmit = now;
    emit(state.copyWith(soundLevel: smoothed));
  }

  Future<void> _onSpeechResultReceived(
    _SpeechResultReceived event,
    Emitter<LlmChatPromptState> emit,
  ) async {
    final words = event.words.trim();
    if (words.isEmpty) {
      return;
    }

    emit(state.copyWith(promptText: words));

    if (event.isFinal) {
      await _speechToText.endSession();
      if (!emit.isDone) {
        emit(_withListeningEnded(state.copyWith(promptText: words)));
      }
    }
  }

  Future<void> _onSpeechStatusChanged(
    _SpeechStatusChanged event,
    Emitter<LlmChatPromptState> emit,
  ) async {
    if (event.status == 'done' || event.status == 'notListening') {
      await _speechToText.endSession();
      if (!emit.isDone) {
        emit(_withListeningEnded(state));
      }
    }
  }

  Future<void> _onSpeechErrorReceived(
    _SpeechErrorReceived event,
    Emitter<LlmChatPromptState> emit,
  ) async {
    await _speechToText.endSession();
    if (emit.isDone) {
      return;
    }

    if (isIgnorableSpeechError(event.message)) {
      emit(_withListeningEnded(state));
      return;
    }

    emit(
      _withListeningEnded(
        state.copyWith(errorMessage: event.message),
      ),
    );
  }

  Future<void> _onSendRequested(
    _SendRequested event,
    Emitter<LlmChatPromptState> emit,
  ) async {
    if (!canSend(
      promptText: state.promptText,
      attachments: state.attachments,
    )) {
      return;
    }

    await _speechToText.endSession();
    if (!emit.isDone) {
      emit(
        _withListeningEnded(
          state.copyWith(
            promptText: '',
            attachments: const [],
          ),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    _speechToText.detach();
    await _speechToText.dispose();
    return super.close();
  }
}

import 'package:speech_to_text/speech_to_text.dart';

typedef SpeechResultCallback = void Function(String words, bool isFinal);
typedef SpeechErrorCallback = void Function(String message);
typedef SpeechStatusCallback = void Function(String status);
typedef SpeechSoundLevelCallback = void Function(double level);

class SpeechToTextService {
  SpeechToTextService() : _speech = SpeechToText();

  final SpeechToText _speech;
  bool _sessionActive = false;
  bool _initialized = false;
  Future<void> _operationLock = Future<void>.value();

  SpeechErrorCallback? _onError;
  SpeechStatusCallback? _onStatus;

  bool get isListening => _speech.isListening;

  /// Maps raw platform sound levels to a 0.0–1.0 range.
  static double normalizeSoundLevel(double raw) {
    if (raw <= 0) {
      // iOS reports decibels (typically -50..-10).
      return ((raw + 50) / 40).clamp(0.0, 1.0);
    }

    // Android and other platforms use a positive scale (roughly 0..10).
    return (raw / 10).clamp(0.0, 1.0);
  }

  Future<bool> initialize({
    SpeechErrorCallback? onError,
    SpeechStatusCallback? onStatus,
  }) {
    _onError = onError;
    _onStatus = onStatus;

    if (_initialized) {
      return Future.value(true);
    }

    return _speech
        .initialize(
          onError: (error) => _onError?.call(error.errorMsg),
          onStatus: (status) => _onStatus?.call(status),
        )
        .then((available) {
          _initialized = available;
          return available;
        });
  }

  void detach() {
    _onError = null;
    _onStatus = null;
  }

  Future<void> endSession() {
    return _runExclusive(_endSessionImpl);
  }

  Future<bool> startListening({
    required SpeechResultCallback onResult,
    SpeechSoundLevelCallback? onSoundLevel,
  }) {
    return _runExclusive(() async {
      if (!_initialized) {
        return false;
      }

      await _endSessionImpl();

      try {
        await _speech.listen(
          onResult: (result) =>
              onResult(result.recognizedWords, result.finalResult),
          onSoundLevelChange: onSoundLevel == null
              ? null
              : (level) =>
                  onSoundLevel(normalizeSoundLevel(level)),
          listenOptions: SpeechListenOptions(
            listenFor: const Duration(seconds: 30),
            pauseFor: const Duration(seconds: 3),
            partialResults: true,
            cancelOnError: true,
          ),
        );
      } catch (_) {
        _sessionActive = false;
        return false;
      }

      final started = await _waitUntilListening();
      _sessionActive = started;
      return started;
    });
  }

  Future<void> stopListening() => endSession();

  Future<void> dispose() {
    return _runExclusive(() async {
      detach();
      await _endSessionImpl();
    });
  }

  Future<T> _runExclusive<T>(Future<T> Function() action) {
    final next = _operationLock.then((_) => action());
    _operationLock = next.then((_) {}, onError: (_) {});
    return next;
  }

  Future<void> _endSessionImpl() async {
    if (!_sessionActive && !_speech.isListening) {
      return;
    }

    try {
      if (_speech.isListening) {
        await _speech.stop();
      } else if (_sessionActive) {
        await _speech.cancel();
      }
    } catch (_) {
      // Native layer may already have ended the session.
    }

    _sessionActive = false;
    await _waitUntilNotListening();
  }

  Future<bool> _waitUntilListening() async {
    for (var attempt = 0; attempt < 30; attempt++) {
      if (_speech.isListening) {
        return true;
      }
      await Future<void>.delayed(const Duration(milliseconds: 50));
    }
    return false;
  }

  Future<void> _waitUntilNotListening() async {
    for (var attempt = 0; attempt < 30; attempt++) {
      if (!_speech.isListening) {
        return;
      }
      await Future<void>.delayed(const Duration(milliseconds: 50));
    }

    try {
      if (_speech.isListening) {
        await _speech.cancel();
      }
    } catch (_) {
      // Ignore cleanup failures on an already torn-down session.
    }
  }
}

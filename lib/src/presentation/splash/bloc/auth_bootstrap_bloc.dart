import 'dart:async';

import 'package:eeagle_ai/src/domain/use_case/restore_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/sync_fcm_token_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bootstrap_event.dart';
part 'auth_bootstrap_state.dart';
part 'auth_bootstrap_bloc.freezed.dart';

class AuthBootstrapBloc extends Bloc<AuthBootstrapEvent, AuthBootstrapState> {
  AuthBootstrapBloc(this._restoreSessionUseCase, this._syncFcmTokenUseCase)
    : super(const AuthBootstrapState()) {
    on<_Started>(_onStarted);
  }

  final RestoreSessionUseCase _restoreSessionUseCase;
  final SyncFcmTokenUseCase _syncFcmTokenUseCase;

  Future<void> _onStarted(
    _Started event,
    Emitter<AuthBootstrapState> emit,
  ) async {
    emit(state.copyWith(isChecking: true, isAuthenticated: false));

    final result = await _restoreSessionUseCase().run();
    if (isClosed) {
      return;
    }

    result.match(
      (_) => emit(state.copyWith(isChecking: false, isAuthenticated: false)),
      (_) {
        unawaited(_syncFcmTokenUseCase());
        emit(state.copyWith(isChecking: false, isAuthenticated: true));
      },
    );
  }
}

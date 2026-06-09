import 'package:eeagle_ai/src/domain/use_case/restore_session_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bootstrap_event.dart';
part 'auth_bootstrap_state.dart';
part 'auth_bootstrap_bloc.freezed.dart';

class AuthBootstrapBloc extends Bloc<AuthBootstrapEvent, AuthBootstrapState> {
  AuthBootstrapBloc(this._restoreSessionUseCase)
      : super(const AuthBootstrapState()) {
    on<_Started>(_onStarted);
  }

  final RestoreSessionUseCase _restoreSessionUseCase;

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
      (_) => emit(
        state.copyWith(
          isChecking: false,
          isAuthenticated: false,
        ),
      ),
      (_) => emit(
        state.copyWith(
          isChecking: false,
          isAuthenticated: true,
        ),
      ),
    );
  }
}

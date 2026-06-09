import 'package:eeagle_ai/src/domain/use_case/logout_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._logoutUseCase) : super(const HomeState()) {
    on<_LogoutRequested>(_onLogoutRequested);
  }

  final LogoutUseCase _logoutUseCase;

  Future<void> _onLogoutRequested(
    _LogoutRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.isLoggingOut) {
      return;
    }

    emit(
      state.copyWith(
        isLoggingOut: true,
        errorMessage: null,
        logoutSucceeded: false,
      ),
    );

    final result = await _logoutUseCase().run();
    if (isClosed) {
      return;
    }

    result.match(
      (failure) => emit(
        state.copyWith(
          isLoggingOut: false,
          errorMessage: failure.message,
          logoutSucceeded: false,
        ),
      ),
      (_) => emit(
        state.copyWith(
          isLoggingOut: false,
          errorMessage: null,
          logoutSucceeded: true,
        ),
      ),
    );
  }
}

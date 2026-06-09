import 'package:eeagle_ai/src/domain/use_case/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUseCase) : super(const LoginState()) {
    on<_LoginSubmitted>(_onLoginSubmitted);
  }

  final LoginUseCase _loginUseCase;

  Future<void> _onLoginSubmitted(
    _LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final submissionAttempt = state.submissionAttempt + 1;
    final email = event.email.trim();
    final password = event.password;

    if (email.isEmpty || password.isEmpty) {
      emit(
        state.copyWith(
          submissionAttempt: submissionAttempt,
          errorMessage: 'Please enter your email and password.',
          loginSucceeded: false,
          isLoading: false,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        submissionAttempt: submissionAttempt,
        isLoading: true,
        errorMessage: null,
        loginSucceeded: false,
      ),
    );

    final result = await _loginUseCase(email: email, password: password).run();
    if (isClosed) {
      return;
    }

    result.match(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
          loginSucceeded: false,
        ),
      ),
      (_) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: null,
          loginSucceeded: true,
        ),
      ),
    );
  }
}

part of 'auth_bootstrap_bloc.dart';

@freezed
sealed class AuthBootstrapState with _$AuthBootstrapState {
  const factory AuthBootstrapState({
    @Default(true) bool isChecking,
    @Default(false) bool isAuthenticated,
  }) = _AuthBootstrapState;
}

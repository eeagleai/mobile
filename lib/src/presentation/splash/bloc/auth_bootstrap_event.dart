part of 'auth_bootstrap_bloc.dart';

@freezed
sealed class AuthBootstrapEvent with _$AuthBootstrapEvent {
  const factory AuthBootstrapEvent.started() = _Started;
}

part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoggingOut,
    @Default(false) bool logoutSucceeded,
    String? errorMessage,
  }) = _HomeState;
}

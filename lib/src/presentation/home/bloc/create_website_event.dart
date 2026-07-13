part of 'create_website_bloc.dart';

@freezed
sealed class CreateWebsiteEvent with _$CreateWebsiteEvent {
  const factory CreateWebsiteEvent.promptChanged(String value) = _PromptChanged;
  const factory CreateWebsiteEvent.submitted() = _Submitted;
  const factory CreateWebsiteEvent.pollRequested() = _PollRequested;
}

import 'dart:async';

import 'package:eeagle_ai/src/domain/repository/sites_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_website_event.dart';
part 'create_website_state.dart';
part 'create_website_bloc.freezed.dart';

class CreateWebsiteBloc extends Bloc<CreateWebsiteEvent, CreateWebsiteState> {
  CreateWebsiteBloc(this._repository) : super(const CreateWebsiteState()) {
    on<_PromptChanged>(
      (event, emit) =>
          emit(state.copyWith(prompt: event.value, errorMessage: null)),
    );
    on<_Submitted>(_onSubmitted);
    on<_PollRequested>(_onPollRequested);
  }

  final SitesRepository _repository;
  Timer? _timer;

  Future<void> _onSubmitted(
    _Submitted event,
    Emitter<CreateWebsiteState> emit,
  ) async {
    if (state.prompt.trim().isEmpty) {
      emit(
        state.copyWith(
          errorMessage: 'Describe the website you want to create.',
        ),
      );
      return;
    }
    emit(state.copyWith(isBuilding: true, errorMessage: null));
    final result = await _repository.createWebsite(state.prompt).run();
    result.match(
      (failure) => emit(
        state.copyWith(isBuilding: false, errorMessage: failure.message),
      ),
      (build) {
        emit(
          state.copyWith(
            build: build,
            isBuilding: !build.complete,
            isComplete: build.complete,
          ),
        );
        if (!build.complete && !build.failed) {
          _schedulePoll();
        }
      },
    );
  }

  Future<void> _onPollRequested(
    _PollRequested event,
    Emitter<CreateWebsiteState> emit,
  ) async {
    final build = state.build;
    if (build == null || state.isComplete) return;
    final result = await _repository.getWebsiteBuildStatus(build).run();
    result.match(
      (failure) => emit(
        state.copyWith(isBuilding: false, errorMessage: failure.message),
      ),
      (next) {
        if (next.failed) {
          emit(
            state.copyWith(
              build: next,
              isBuilding: false,
              errorMessage: next.message,
            ),
          );
        } else if (next.complete) {
          emit(
            state.copyWith(build: next, isBuilding: false, isComplete: true),
          );
        } else {
          emit(state.copyWith(build: next));
          _schedulePoll();
        }
      },
    );
  }

  void _schedulePoll() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 4), () {
      if (!isClosed) add(const CreateWebsiteEvent.pollRequested());
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

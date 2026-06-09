import 'package:eeagle_ai/src/domain/use_case/get_sites_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';

part 'sites_event.dart';
part 'sites_state.dart';
part 'sites_bloc.freezed.dart';

class SitesBloc extends Bloc<SitesEvent, SitesState> {
  SitesBloc(this._getSitesUseCase) : super(const SitesState()) {
    on<_Started>(_onStarted);
    on<_RefreshRequested>(_onRefreshRequested);
  }

  final GetSitesUseCase _getSitesUseCase;

  Future<void> _onStarted(_Started event, Emitter<SitesState> emit) async {
    if (state.sites.isNotEmpty) {
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));
    await _fetchSites(emit, isRefresh: false);
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<SitesState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true, errorMessage: null));
    await _fetchSites(emit, isRefresh: true);
  }

  Future<void> _fetchSites(
    Emitter<SitesState> emit, {
    required bool isRefresh,
  }) async {
    final result = await _getSitesUseCase().run();
    if (isClosed) {
      return;
    }

    result.match(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          isRefreshing: false,
          errorMessage: failure.message,
        ),
      ),
      (sites) => emit(
        state.copyWith(
          isLoading: false,
          isRefreshing: false,
          sites: sites,
          errorMessage: null,
        ),
      ),
    );
  }
}

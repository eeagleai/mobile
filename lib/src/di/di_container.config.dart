// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/service/analytics_api_service.dart' as _i873;
import '../data/service/attachment_picker_service.dart' as _i471;
import '../data/service/auth_session_store.dart' as _i1053;
import '../data/service/live_assist_api_service.dart' as _i78;
import '../data/service/speech_to_text_service.dart' as _i795;
import '../data/service/token_storage_service.dart' as _i721;
import '../domain/repository/analytics_repository.dart' as _i495;
import '../domain/repository/auth_repository.dart' as _i306;
import '../domain/repository/counter_repository.dart' as _i497;
import '../domain/repository/live_assist_repository.dart' as _i78;
import '../domain/repository/sites_repository.dart' as _i440;
import '../domain/use_case/get_analytics_events_use_case.dart' as _i767;
import '../domain/use_case/get_analytics_stats_use_case.dart' as _i667;
import '../domain/use_case/get_analytics_stream_token_use_case.dart' as _i463;
import '../domain/use_case/get_sites_use_case.dart' as _i178;
import '../domain/use_case/increment_counter_use_case.dart' as _i252;
import '../domain/use_case/login_use_case.dart' as _i772;
import '../domain/use_case/logout_use_case.dart' as _i235;
import '../domain/use_case/resolve_message_page_paths_use_case.dart' as _i673;
import '../domain/use_case/restore_session_use_case.dart' as _i8;
import '../domain/use_case/send_live_assist_message_use_case.dart' as _i913;
import '../presentation/analytics/bloc/analytics_bloc.dart' as _i1046;
import '../presentation/home/bloc/home_analytics_bloc.dart' as _i106;
import '../presentation/home/bloc/home_bloc.dart' as _i355;
import '../presentation/home/bloc/sites_bloc.dart' as _i797;
import '../presentation/live_conversation/bloc/live_conversation_bloc.dart'
    as _i1038;
import '../presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart' as _i590;
import '../presentation/llm_chat/bloc/llm_chat_session_bloc.dart' as _i937;
import '../presentation/login/bloc/login_bloc.dart' as _i331;
import '../presentation/splash/bloc/auth_bootstrap_bloc.dart' as _i998;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i673.ResolveMessagePagePathsUseCase>(
      () => registerModule.resolveMessagePagePathsUseCase(),
    );
    gh.factory<_i795.SpeechToTextService>(
      () => registerModule.speechToTextService(),
    );
    gh.factory<_i471.AttachmentPickerService>(
      () => registerModule.attachmentPickerService(),
    );
    gh.lazySingleton<_i721.TokenStorageService>(
      () => registerModule.tokenStorageService(),
    );
    gh.lazySingleton<_i1053.AuthSessionStore>(
      () => registerModule.authSessionStore(),
    );
    gh.factory<_i590.LlmChatPromptBloc>(
      () => registerModule.llmChatPromptBloc(
        gh<_i795.SpeechToTextService>(),
        gh<_i471.AttachmentPickerService>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(
        gh<_i1053.AuthSessionStore>(),
        gh<_i721.TokenStorageService>(),
      ),
    );
    gh.factory<_i937.LlmChatSessionBloc>(
      () => registerModule.llmChatSessionBloc(
        gh<_i361.Dio>(),
        gh<_i673.ResolveMessagePagePathsUseCase>(),
      ),
    );
    gh.lazySingleton<_i306.AuthRepository>(
      () => registerModule.authRepository(
        gh<_i361.Dio>(),
        gh<_i721.TokenStorageService>(),
        gh<_i1053.AuthSessionStore>(),
      ),
    );
    gh.lazySingleton<_i497.CounterRepository>(
      () => registerModule.counterRepository(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i440.SitesRepository>(
      () => registerModule.sitesRepository(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i873.AnalyticsApiService>(
      () => registerModule.analyticsApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i78.LiveAssistApiService>(
      () => registerModule.liveAssistApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i78.LiveAssistRepository>(
      () =>
          registerModule.liveAssistRepository(gh<_i78.LiveAssistApiService>()),
    );
    gh.factory<_i772.LoginUseCase>(
      () => registerModule.loginUseCase(gh<_i306.AuthRepository>()),
    );
    gh.factory<_i8.RestoreSessionUseCase>(
      () => registerModule.restoreSessionUseCase(gh<_i306.AuthRepository>()),
    );
    gh.factory<_i235.LogoutUseCase>(
      () => registerModule.logoutUseCase(gh<_i306.AuthRepository>()),
    );
    gh.factory<_i998.AuthBootstrapBloc>(
      () => registerModule.authBootstrapBloc(gh<_i8.RestoreSessionUseCase>()),
    );
    gh.factory<_i355.HomeBloc>(
      () => registerModule.homeBloc(gh<_i235.LogoutUseCase>()),
    );
    gh.factory<_i178.GetSitesUseCase>(
      () => registerModule.getSitesUseCase(gh<_i440.SitesRepository>()),
    );
    gh.factory<_i252.GetCounterUseCase>(
      () => registerModule.getCounterUseCase(gh<_i497.CounterRepository>()),
    );
    gh.factory<_i252.IncrementCounterUseCase>(
      () =>
          registerModule.incrementCounterUseCase(gh<_i497.CounterRepository>()),
    );
    gh.factory<_i913.SendLiveAssistMessageUseCase>(
      () => registerModule.sendLiveAssistMessageUseCase(
        gh<_i78.LiveAssistRepository>(),
      ),
    );
    gh.factory<_i331.LoginBloc>(
      () => registerModule.loginBloc(gh<_i772.LoginUseCase>()),
    );
    gh.lazySingleton<_i495.AnalyticsRepository>(
      () => registerModule.analyticsRepository(gh<_i873.AnalyticsApiService>()),
    );
    gh.factory<_i667.GetAnalyticsStatsUseCase>(
      () => registerModule.getAnalyticsStatsUseCase(
        gh<_i495.AnalyticsRepository>(),
      ),
    );
    gh.factory<_i767.GetAnalyticsEventsUseCase>(
      () => registerModule.getAnalyticsEventsUseCase(
        gh<_i495.AnalyticsRepository>(),
      ),
    );
    gh.factory<_i463.GetAnalyticsStreamTokenUseCase>(
      () => registerModule.getAnalyticsStreamTokenUseCase(
        gh<_i495.AnalyticsRepository>(),
      ),
    );
    gh.factory<_i797.SitesBloc>(
      () => registerModule.sitesBloc(gh<_i178.GetSitesUseCase>()),
    );
    gh.factory<_i106.HomeAnalyticsBloc>(
      () => registerModule.homeAnalyticsBloc(
        gh<_i667.GetAnalyticsStatsUseCase>(),
        gh<_i463.GetAnalyticsStreamTokenUseCase>(),
      ),
    );
    gh.factory<_i1038.LiveConversationBloc>(
      () => registerModule.liveConversationBloc(
        gh<_i913.SendLiveAssistMessageUseCase>(),
        gh<_i463.GetAnalyticsStreamTokenUseCase>(),
      ),
    );
    gh.factory<_i1046.AnalyticsBloc>(
      () => registerModule.analyticsBloc(
        gh<_i667.GetAnalyticsStatsUseCase>(),
        gh<_i767.GetAnalyticsEventsUseCase>(),
        gh<_i463.GetAnalyticsStreamTokenUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}

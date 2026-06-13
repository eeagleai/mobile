import 'package:dio/dio.dart';
import 'package:eeagle_ai/src/core/network/dio_client.dart';
import 'package:eeagle_ai/src/data/repository/auth_repository_impl.dart';
import 'package:eeagle_ai/src/data/repository/chat_repository_impl.dart';
import 'package:eeagle_ai/src/data/repository/counter_repository_impl.dart';
import 'package:eeagle_ai/src/data/repository/sites_repository_impl.dart';
import 'package:eeagle_ai/src/data/service/attachment_picker_service.dart';
import 'package:eeagle_ai/src/data/service/auth_session_store.dart';
import 'package:eeagle_ai/src/data/service/speech_to_text_service.dart';
import 'package:eeagle_ai/src/data/service/token_storage_service.dart';
import 'package:eeagle_ai/src/domain/repository/auth_repository.dart';
import 'package:eeagle_ai/src/domain/repository/counter_repository.dart';
import 'package:eeagle_ai/src/domain/repository/sites_repository.dart';
import 'package:eeagle_ai/src/domain/use_case/connect_chat_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/disconnect_chat_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/get_sites_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/increment_counter_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/login_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/logout_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/mint_chat_token_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/resolve_message_page_paths_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/restore_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/send_chat_message_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_chat_inbound_events_use_case.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_session_bloc.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/home_bloc.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/sites_bloc.dart';
import 'package:eeagle_ai/src/presentation/login/bloc/login_bloc.dart';
import 'package:eeagle_ai/src/presentation/splash/bloc/auth_bootstrap_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  TokenStorageService tokenStorageService() => TokenStorageService();

  @lazySingleton
  AuthSessionStore authSessionStore() => AuthSessionStore();

  @lazySingleton
  Dio dio(
    AuthSessionStore authSessionStore,
    TokenStorageService tokenStorageService,
  ) =>
      DioClient.create(
        sessionStore: authSessionStore,
        tokenStorage: tokenStorageService,
      );

  @lazySingleton
  CounterRepository counterRepository(Dio dio) => CounterRepositoryImpl(dio);

  @lazySingleton
  AuthRepository authRepository(
    Dio dio,
    TokenStorageService tokenStorageService,
    AuthSessionStore authSessionStore,
  ) =>
      AuthRepositoryImpl(dio, tokenStorageService, authSessionStore);

  @lazySingleton
  SitesRepository sitesRepository(Dio dio) => SitesRepositoryImpl(dio);

  @factoryMethod
  ResolveMessagePagePathsUseCase resolveMessagePagePathsUseCase() =>
      ResolveMessagePagePathsUseCase();

  @factoryMethod
  LlmChatSessionBloc llmChatSessionBloc(
    Dio dio,
    ResolveMessagePagePathsUseCase resolveMessagePagePathsUseCase,
  ) {
    final chatRepository = ChatRepositoryImpl(dio);

    return LlmChatSessionBloc(
      MintChatTokenUseCase(chatRepository),
      ConnectChatSessionUseCase(chatRepository),
      SendChatMessageUseCase(chatRepository),
      DisconnectChatSessionUseCase(chatRepository),
      WatchChatInboundEventsUseCase(chatRepository),
      resolveMessagePagePathsUseCase,
    );
  }

  @factoryMethod
  GetCounterUseCase getCounterUseCase(CounterRepository counterRepository) =>
      GetCounterUseCase(counterRepository);

  @factoryMethod
  IncrementCounterUseCase incrementCounterUseCase(
    CounterRepository counterRepository,
  ) =>
      IncrementCounterUseCase(counterRepository);

  @factoryMethod
  LoginUseCase loginUseCase(AuthRepository authRepository) =>
      LoginUseCase(authRepository);

  @factoryMethod
  LoginBloc loginBloc(LoginUseCase loginUseCase) => LoginBloc(loginUseCase);

  @factoryMethod
  RestoreSessionUseCase restoreSessionUseCase(AuthRepository authRepository) =>
      RestoreSessionUseCase(authRepository);

  @factoryMethod
  LogoutUseCase logoutUseCase(AuthRepository authRepository) =>
      LogoutUseCase(authRepository);

  @factoryMethod
  HomeBloc homeBloc(LogoutUseCase logoutUseCase) => HomeBloc(logoutUseCase);

  @factoryMethod
  GetSitesUseCase getSitesUseCase(SitesRepository sitesRepository) =>
      GetSitesUseCase(sitesRepository);

  @factoryMethod
  SpeechToTextService speechToTextService() => SpeechToTextService();

  @factoryMethod
  AuthBootstrapBloc authBootstrapBloc(
    RestoreSessionUseCase restoreSessionUseCase,
  ) =>
      AuthBootstrapBloc(restoreSessionUseCase);

  @factoryMethod
  SitesBloc sitesBloc(GetSitesUseCase getSitesUseCase) =>
      SitesBloc(getSitesUseCase);

  @factoryMethod
  AttachmentPickerService attachmentPickerService() =>
      AttachmentPickerService();

  @factoryMethod
  LlmChatPromptBloc llmChatPromptBloc(
    SpeechToTextService speechToTextService,
    AttachmentPickerService attachmentPickerService,
  ) =>
      LlmChatPromptBloc(speechToTextService, attachmentPickerService);
}

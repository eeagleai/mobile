import 'package:dio/dio.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:eeagle_ai/src/core/network/dio_client.dart';
import 'package:eeagle_ai/src/data/local/live_assist_database.dart';
import 'package:eeagle_ai/src/data/repository/analytics_repository_impl.dart';
import 'package:eeagle_ai/src/data/repository/auth_repository_impl.dart';
import 'package:eeagle_ai/src/data/repository/chat_repository_impl.dart';
import 'package:eeagle_ai/src/data/repository/counter_repository_impl.dart';
import 'package:eeagle_ai/src/data/repository/live_assist_local_repository_impl.dart';
import 'package:eeagle_ai/src/data/repository/live_assist_repository_impl.dart';
import 'package:eeagle_ai/src/data/repository/mobile_device_repository_impl.dart';
import 'package:eeagle_ai/src/data/repository/sites_repository_impl.dart';
import 'package:eeagle_ai/src/data/service/analytics_api_service.dart';
import 'package:eeagle_ai/src/data/service/analytics_events_cache.dart';
import 'package:eeagle_ai/src/data/service/attachment_picker_service.dart';
import 'package:eeagle_ai/src/data/service/auth_session_store.dart';
import 'package:eeagle_ai/src/data/service/device_installation_service.dart';
import 'package:eeagle_ai/src/data/service/firebase_messaging_service.dart';
import 'package:eeagle_ai/src/data/service/live_assist_api_service.dart';
import 'package:eeagle_ai/src/data/service/mobile_device_api_service.dart';
import 'package:eeagle_ai/src/data/service/site_analytics_socket_registry.dart';
import 'package:eeagle_ai/src/data/service/speech_to_text_service.dart';
import 'package:eeagle_ai/src/data/service/token_storage_service.dart';
import 'package:eeagle_ai/src/domain/repository/analytics_repository.dart';
import 'package:eeagle_ai/src/domain/repository/auth_repository.dart';
import 'package:eeagle_ai/src/domain/repository/counter_repository.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_local_repository.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_repository.dart';
import 'package:eeagle_ai/src/domain/repository/mobile_device_repository.dart';
import 'package:eeagle_ai/src/domain/repository/sites_repository.dart';
import 'package:eeagle_ai/src/domain/use_case/acquire_site_analytics_socket_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/clear_live_assist_local_data_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/connect_chat_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/disconnect_chat_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_events_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/get_analytics_stats_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/increment_counter_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/get_sites_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/has_open_site_analytics_socket_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/ingest_analytics_socket_frame_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/login_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/logout_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/mark_conversation_read_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/mint_chat_token_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/reconnect_site_analytics_socket_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/release_site_analytics_socket_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/resolve_message_page_paths_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/restore_session_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/save_owner_message_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/send_chat_message_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/send_live_assist_message_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/save_fcm_token_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/sync_fcm_token_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_chat_inbound_events_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_conversation_messages_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_site_analytics_events_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_site_analytics_socket_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_site_conversations_use_case.dart';
import 'package:eeagle_ai/src/domain/use_case/watch_socket_connection_status_use_case.dart';
import 'package:eeagle_ai/src/presentation/analytics/bloc/analytics_bloc.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/home_analytics_bloc.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/home_bloc.dart';
import 'package:eeagle_ai/src/presentation/home/bloc/sites_bloc.dart';
import 'package:eeagle_ai/src/presentation/live_conversation/bloc/live_conversation_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_prompt_bloc.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/bloc/llm_chat_session_bloc.dart';
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
  DeviceInstallationService deviceInstallationService() =>
      DeviceInstallationService();

  @lazySingleton
  Dio dio(
    AuthSessionStore authSessionStore,
    TokenStorageService tokenStorageService,
  ) => DioClient.create(
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
  ) => AuthRepositoryImpl(dio, tokenStorageService, authSessionStore);

  @lazySingleton
  SitesRepository sitesRepository(Dio dio) => SitesRepositoryImpl(dio);

  @lazySingleton
  MobileDeviceApiService mobileDeviceApiService(Dio dio) =>
      MobileDeviceApiService(dio);

  @lazySingleton
  MobileDeviceRepository mobileDeviceRepository(
    MobileDeviceApiService mobileDeviceApiService,
  ) => MobileDeviceRepositoryImpl(mobileDeviceApiService);

  @factoryMethod
  SaveFcmTokenUseCase saveFcmTokenUseCase(
    MobileDeviceRepository mobileDeviceRepository,
  ) => SaveFcmTokenUseCase(mobileDeviceRepository);

  @lazySingleton
  FirebaseMessagingService firebaseMessagingService(
    SaveFcmTokenUseCase saveFcmTokenUseCase,
    DeviceInstallationService deviceInstallationService,
  ) => FirebaseMessagingService(saveFcmTokenUseCase, deviceInstallationService);

  @factoryMethod
  SyncFcmTokenUseCase syncFcmTokenUseCase(
    FirebaseMessagingService firebaseMessagingService,
  ) => SyncFcmTokenUseCase(firebaseMessagingService);

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
  ) => IncrementCounterUseCase(counterRepository);

  @factoryMethod
  LoginUseCase loginUseCase(AuthRepository authRepository) =>
      LoginUseCase(authRepository);

  @factoryMethod
  LoginBloc loginBloc(
    LoginUseCase loginUseCase,
    SyncFcmTokenUseCase syncFcmTokenUseCase,
  ) => LoginBloc(loginUseCase, syncFcmTokenUseCase);

  @factoryMethod
  RestoreSessionUseCase restoreSessionUseCase(AuthRepository authRepository) =>
      RestoreSessionUseCase(authRepository);

  @factoryMethod
  LogoutUseCase logoutUseCase(AuthRepository authRepository) =>
      LogoutUseCase(authRepository);

  @factoryMethod
  HomeBloc homeBloc(
    LogoutUseCase logoutUseCase,
    ClearLiveAssistLocalDataUseCase clearLiveAssistLocalDataUseCase,
  ) => HomeBloc(logoutUseCase, clearLiveAssistLocalDataUseCase);

  @factoryMethod
  GetSitesUseCase getSitesUseCase(SitesRepository sitesRepository) =>
      GetSitesUseCase(sitesRepository);

  @factoryMethod
  SpeechToTextService speechToTextService() => SpeechToTextService();

  @factoryMethod
  AuthBootstrapBloc authBootstrapBloc(
    RestoreSessionUseCase restoreSessionUseCase,
    SyncFcmTokenUseCase syncFcmTokenUseCase,
  ) => AuthBootstrapBloc(restoreSessionUseCase, syncFcmTokenUseCase);

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
  ) => LlmChatPromptBloc(speechToTextService, attachmentPickerService);

  @lazySingleton
  SiteAnalyticsSocketRegistry siteAnalyticsSocketRegistry() =>
      SiteAnalyticsSocketRegistry();

  @lazySingleton
  AnalyticsEventsCache analyticsEventsCache() => AnalyticsEventsCache();

  @lazySingleton
  LiveAssistDatabase liveAssistDatabase() =>
      LiveAssistDatabase(driftDatabase(name: 'live_assist_db'));

  @lazySingleton
  LiveAssistLocalRepository liveAssistLocalRepository(
    LiveAssistDatabase liveAssistDatabase,
  ) => LiveAssistLocalRepositoryImpl(liveAssistDatabase);

  @factoryMethod
  IngestAnalyticsSocketFrameUseCase ingestAnalyticsSocketFrameUseCase(
    LiveAssistLocalRepository liveAssistLocalRepository,
    AnalyticsEventsCache analyticsEventsCache,
  ) => IngestAnalyticsSocketFrameUseCase(
    liveAssistLocalRepository,
    analyticsEventsCache,
  );

  @factoryMethod
  WatchSiteConversationsUseCase watchSiteConversationsUseCase(
    LiveAssistLocalRepository liveAssistLocalRepository,
  ) => WatchSiteConversationsUseCase(liveAssistLocalRepository);

  @factoryMethod
  WatchSiteAnalyticsEventsUseCase watchSiteAnalyticsEventsUseCase(
    AnalyticsEventsCache analyticsEventsCache,
    LiveAssistLocalRepository liveAssistLocalRepository,
  ) => WatchSiteAnalyticsEventsUseCase(
    analyticsEventsCache,
    liveAssistLocalRepository,
  );

  @factoryMethod
  MarkConversationReadUseCase markConversationReadUseCase(
    LiveAssistLocalRepository liveAssistLocalRepository,
  ) => MarkConversationReadUseCase(liveAssistLocalRepository);

  @factoryMethod
  WatchConversationMessagesUseCase watchConversationMessagesUseCase(
    LiveAssistLocalRepository liveAssistLocalRepository,
  ) => WatchConversationMessagesUseCase(liveAssistLocalRepository);

  @factoryMethod
  SaveOwnerMessageUseCase saveOwnerMessageUseCase(
    LiveAssistLocalRepository liveAssistLocalRepository,
  ) => SaveOwnerMessageUseCase(liveAssistLocalRepository);

  @factoryMethod
  UpdateOwnerMessageStatusUseCase updateOwnerMessageStatusUseCase(
    LiveAssistLocalRepository liveAssistLocalRepository,
  ) => UpdateOwnerMessageStatusUseCase(liveAssistLocalRepository);

  @factoryMethod
  ClearLiveAssistLocalDataUseCase clearLiveAssistLocalDataUseCase(
    LiveAssistLocalRepository liveAssistLocalRepository,
    AnalyticsEventsCache analyticsEventsCache,
    SiteAnalyticsSocketRegistry siteAnalyticsSocketRegistry,
  ) => ClearLiveAssistLocalDataUseCase(
    liveAssistLocalRepository,
    analyticsEventsCache,
    siteAnalyticsSocketRegistry,
  );

  @factoryMethod
  AcquireSiteAnalyticsSocketUseCase acquireSiteAnalyticsSocketUseCase(
    SiteAnalyticsSocketRegistry siteAnalyticsSocketRegistry,
    AnalyticsRepository analyticsRepository,
  ) => AcquireSiteAnalyticsSocketUseCase(
    siteAnalyticsSocketRegistry,
    analyticsRepository,
  );

  @factoryMethod
  ReleaseSiteAnalyticsSocketUseCase releaseSiteAnalyticsSocketUseCase(
    SiteAnalyticsSocketRegistry siteAnalyticsSocketRegistry,
  ) => ReleaseSiteAnalyticsSocketUseCase(siteAnalyticsSocketRegistry);

  @factoryMethod
  ReconnectSiteAnalyticsSocketUseCase reconnectSiteAnalyticsSocketUseCase(
    SiteAnalyticsSocketRegistry siteAnalyticsSocketRegistry,
    AnalyticsRepository analyticsRepository,
  ) => ReconnectSiteAnalyticsSocketUseCase(
    siteAnalyticsSocketRegistry,
    analyticsRepository,
  );

  @factoryMethod
  WatchSiteAnalyticsSocketUseCase watchSiteAnalyticsSocketUseCase(
    SiteAnalyticsSocketRegistry siteAnalyticsSocketRegistry,
  ) => WatchSiteAnalyticsSocketUseCase(siteAnalyticsSocketRegistry);

  @factoryMethod
  HasOpenSiteAnalyticsSocketUseCase hasOpenSiteAnalyticsSocketUseCase(
    SiteAnalyticsSocketRegistry siteAnalyticsSocketRegistry,
  ) => HasOpenSiteAnalyticsSocketUseCase(siteAnalyticsSocketRegistry);

  @factoryMethod
  WatchSocketConnectionStatusUseCase watchSocketConnectionStatusUseCase(
    SiteAnalyticsSocketRegistry siteAnalyticsSocketRegistry,
  ) => WatchSocketConnectionStatusUseCase(siteAnalyticsSocketRegistry);

  @lazySingleton
  AnalyticsApiService analyticsApiService(Dio dio) => AnalyticsApiService(dio);

  @lazySingleton
  AnalyticsRepository analyticsRepository(
    AnalyticsApiService analyticsApiService,
  ) => AnalyticsRepositoryImpl(analyticsApiService);

  @factoryMethod
  GetAnalyticsStatsUseCase getAnalyticsStatsUseCase(
    AnalyticsRepository analyticsRepository,
  ) => GetAnalyticsStatsUseCase(analyticsRepository);

  @factoryMethod
  GetAnalyticsEventsUseCase getAnalyticsEventsUseCase(
    AnalyticsRepository analyticsRepository,
  ) => GetAnalyticsEventsUseCase(analyticsRepository);

  @factoryMethod
  AnalyticsBloc analyticsBloc(
    GetAnalyticsStatsUseCase getAnalyticsStatsUseCase,
    GetAnalyticsEventsUseCase getAnalyticsEventsUseCase,
    WatchSiteConversationsUseCase watchSiteConversationsUseCase,
    WatchSiteAnalyticsEventsUseCase watchSiteAnalyticsEventsUseCase,
    WatchSocketConnectionStatusUseCase watchSocketConnectionStatusUseCase,
    MarkConversationReadUseCase markConversationReadUseCase,
  ) => AnalyticsBloc(
    getAnalyticsStatsUseCase,
    getAnalyticsEventsUseCase,
    watchSiteConversationsUseCase,
    watchSiteAnalyticsEventsUseCase,
    watchSocketConnectionStatusUseCase,
    markConversationReadUseCase,
  );

  @factoryMethod
  HomeAnalyticsBloc homeAnalyticsBloc(
    GetAnalyticsStatsUseCase getAnalyticsStatsUseCase,
    AcquireSiteAnalyticsSocketUseCase acquireSiteAnalyticsSocketUseCase,
    ReconnectSiteAnalyticsSocketUseCase reconnectSiteAnalyticsSocketUseCase,
    ReleaseSiteAnalyticsSocketUseCase releaseSiteAnalyticsSocketUseCase,
    WatchSiteAnalyticsSocketUseCase watchSiteAnalyticsSocketUseCase,
    HasOpenSiteAnalyticsSocketUseCase hasOpenSiteAnalyticsSocketUseCase,
    IngestAnalyticsSocketFrameUseCase ingestAnalyticsSocketFrameUseCase,
  ) => HomeAnalyticsBloc(
    getAnalyticsStatsUseCase,
    acquireSiteAnalyticsSocketUseCase,
    reconnectSiteAnalyticsSocketUseCase,
    releaseSiteAnalyticsSocketUseCase,
    watchSiteAnalyticsSocketUseCase,
    hasOpenSiteAnalyticsSocketUseCase,
    ingestAnalyticsSocketFrameUseCase,
  );

  @lazySingleton
  LiveAssistApiService liveAssistApiService(Dio dio) =>
      LiveAssistApiService(dio);

  @lazySingleton
  LiveAssistRepository liveAssistRepository(
    LiveAssistApiService liveAssistApiService,
  ) => LiveAssistRepositoryImpl(liveAssistApiService);

  @factoryMethod
  SendLiveAssistMessageUseCase sendLiveAssistMessageUseCase(
    LiveAssistRepository liveAssistRepository,
  ) => SendLiveAssistMessageUseCase(liveAssistRepository);

  @factoryMethod
  LiveConversationBloc liveConversationBloc(
    SendLiveAssistMessageUseCase sendLiveAssistMessageUseCase,
    WatchConversationMessagesUseCase watchConversationMessagesUseCase,
    SaveOwnerMessageUseCase saveOwnerMessageUseCase,
    UpdateOwnerMessageStatusUseCase updateOwnerMessageStatusUseCase,
    MarkConversationReadUseCase markConversationReadUseCase,
    WatchSocketConnectionStatusUseCase watchSocketConnectionStatusUseCase,
  ) => LiveConversationBloc(
    sendLiveAssistMessageUseCase,
    watchConversationMessagesUseCase,
    saveOwnerMessageUseCase,
    updateOwnerMessageStatusUseCase,
    markConversationReadUseCase,
    watchSocketConnectionStatusUseCase,
  );
}

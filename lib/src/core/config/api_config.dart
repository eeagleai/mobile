/// API configuration loaded from compile-time environment.
class ApiConfig {
  ApiConfig._();

  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://www.eeagle.ai',
  );

  static const String mobileAuthLoginPath = '/api/mobile/auth/login';
  static const String sitesPath = '/api/sites';
  static const String chatTokenPath = '/api/chat/token';
  static const String defaultChatModel = 'eeagle-default';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}

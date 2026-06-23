import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/analytics/analytics_screen.dart';
import 'package:eeagle_ai/src/presentation/live_conversation/live_conversation_screen.dart';
import 'package:eeagle_ai/src/presentation/home/home_screen.dart';
import 'package:eeagle_ai/src/presentation/llm_chat/llm_chat_screen.dart';
import 'package:eeagle_ai/src/presentation/login/login_screen.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes_constants.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.login:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case RoutesConstants.home:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case RoutesConstants.llmChat:
        final site = settings.arguments;
        if (site is! Site) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => const HomeScreen(),
          );
        }

        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => LlmChatScreen(site: site),
        );
      case RoutesConstants.analytics:
        final args = settings.arguments;
        if (args is! AnalyticsScreenArgs) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => const HomeScreen(),
          );
        }

        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => AnalyticsScreen(args: args),
        );
      case RoutesConstants.liveConversation:
        final args = settings.arguments;
        if (args is! LiveConversationScreenArgs) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => const HomeScreen(),
          );
        }

        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => LiveConversationScreen(args: args),
        );
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
    }
  }
}

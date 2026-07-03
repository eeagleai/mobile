import 'package:eeagle_ai/src/domain/entities/live_conversation_summary.dart';
import 'package:eeagle_ai/src/domain/repository/live_assist_local_repository.dart';

class WatchSiteConversationsUseCase {
  WatchSiteConversationsUseCase(this._repository);

  final LiveAssistLocalRepository _repository;

  Stream<List<LiveConversationSummary>> call(String siteApiKey) =>
      _repository.watchConversations(siteApiKey);
}

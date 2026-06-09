import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/chat_session.dart';
import 'package:eeagle_ai/src/domain/repository/chat_repository.dart';
import 'package:fpdart/fpdart.dart';

class ConnectChatSessionUseCase {
  ConnectChatSessionUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  TaskEither<OperationFailure, Unit> call({
    required ChatSession session,
    required String apikey,
    required String pageUrl,
    String model = ApiConfig.defaultChatModel,
  }) {
    return _chatRepository.connectSession(
      session: session,
      apikey: apikey,
      pageUrl: pageUrl,
      model: model,
    );
  }
}

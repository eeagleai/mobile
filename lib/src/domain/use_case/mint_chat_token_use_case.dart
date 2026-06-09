import 'package:eeagle_ai/src/core/config/api_config.dart';
import 'package:eeagle_ai/src/domain/failure/operation_failure.dart';
import 'package:eeagle_ai/src/domain/model/chat_session.dart';
import 'package:eeagle_ai/src/domain/repository/chat_repository.dart';
import 'package:fpdart/fpdart.dart';

class MintChatTokenUseCase {
  MintChatTokenUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  TaskEither<OperationFailure, ChatSession> call({
    required String apikey,
    required String pageUrl,
    String locale = 'en',
    String model = ApiConfig.defaultChatModel,
    bool newChat = true,
  }) {
    return _chatRepository.mintChatToken(
      apikey: apikey,
      pageUrl: pageUrl,
      locale: locale,
      model: model,
      newChat: newChat,
    );
  }
}

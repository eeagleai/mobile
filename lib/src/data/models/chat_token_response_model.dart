import 'package:eeagle_ai/src/data/models/chat_session_config_model.dart';
import 'package:eeagle_ai/src/domain/model/chat_session.dart';
import 'package:eeagle_ai/src/domain/model/chat_session_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_token_response_model.freezed.dart';
part 'chat_token_response_model.g.dart';

@freezed
abstract class ChatTokenResponseModel with _$ChatTokenResponseModel {
  const ChatTokenResponseModel._();

  const factory ChatTokenResponseModel({
    required String token,
    @JsonKey(name: 'ws_url') required String wsUrl,
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'conversation_session_id')
    required String conversationSessionId,
    @JsonKey(name: 'route_key') required String routeKey,
    required ChatSessionConfigModel config,
  }) = _ChatTokenResponseModel;

  factory ChatTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatTokenResponseModelFromJson(json);

  ChatSession toEntity() {
    return ChatSession(
      token: token,
      wsUrl: wsUrl,
      conversationId: conversationId,
      conversationSessionId: conversationSessionId,
      routeKey: routeKey,
      config: config.toEntity(),
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatTokenResponseModel _$ChatTokenResponseModelFromJson(
  Map<String, dynamic> json,
) => _ChatTokenResponseModel(
  token: json['token'] as String,
  wsUrl: json['ws_url'] as String,
  conversationId: json['conversation_id'] as String,
  conversationSessionId: json['conversation_session_id'] as String,
  routeKey: json['route_key'] as String,
  config: ChatSessionConfigModel.fromJson(
    json['config'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ChatTokenResponseModelToJson(
  _ChatTokenResponseModel instance,
) => <String, dynamic>{
  'token': instance.token,
  'ws_url': instance.wsUrl,
  'conversation_id': instance.conversationId,
  'conversation_session_id': instance.conversationSessionId,
  'route_key': instance.routeKey,
  'config': instance.config,
};

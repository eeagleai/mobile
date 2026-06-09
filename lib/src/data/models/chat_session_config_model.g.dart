// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatSessionConfigModel _$ChatSessionConfigModelFromJson(
  Map<String, dynamic> json,
) => _ChatSessionConfigModel(
  pageCaptureEnabled: json['pageCaptureEnabled'] as bool?,
  maxPageContentLength: (json['maxPageContentLength'] as num?)?.toInt(),
  liveEditEnabled: json['liveEditEnabled'] as bool?,
  canLiveEdit: json['canLiveEdit'] as bool?,
  remaining: (json['remaining'] as num?)?.toInt(),
);

Map<String, dynamic> _$ChatSessionConfigModelToJson(
  _ChatSessionConfigModel instance,
) => <String, dynamic>{
  'pageCaptureEnabled': instance.pageCaptureEnabled,
  'maxPageContentLength': instance.maxPageContentLength,
  'liveEditEnabled': instance.liveEditEnabled,
  'canLiveEdit': instance.canLiveEdit,
  'remaining': instance.remaining,
};

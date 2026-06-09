import 'package:eeagle_ai/src/domain/model/chat_session_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_session_config_model.freezed.dart';
part 'chat_session_config_model.g.dart';

@freezed
abstract class ChatSessionConfigModel with _$ChatSessionConfigModel {
  const ChatSessionConfigModel._();

  const factory ChatSessionConfigModel({
    @JsonKey(name: 'pageCaptureEnabled') bool? pageCaptureEnabled,
    @JsonKey(name: 'maxPageContentLength') int? maxPageContentLength,
    @JsonKey(name: 'liveEditEnabled') bool? liveEditEnabled,
    @JsonKey(name: 'canLiveEdit') bool? canLiveEdit,
    int? remaining,
  }) = _ChatSessionConfigModel;

  factory ChatSessionConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionConfigModelFromJson(json);

  ChatSessionConfig toEntity() {
    return ChatSessionConfig(
      pageCaptureEnabled: pageCaptureEnabled,
      maxPageContentLength: maxPageContentLength,
      liveEditEnabled: liveEditEnabled,
      canLiveEdit: canLiveEdit,
      remaining: remaining,
    );
  }
}

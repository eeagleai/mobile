import 'package:eeagle_ai/src/domain/model/live_assist_send_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_assist_send_response_model.freezed.dart';
part 'live_assist_send_response_model.g.dart';

@freezed
abstract class LiveAssistSendResponseModel with _$LiveAssistSendResponseModel {
  const LiveAssistSendResponseModel._();

  const factory LiveAssistSendResponseModel({
    String? status,
  }) = _LiveAssistSendResponseModel;

  factory LiveAssistSendResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LiveAssistSendResponseModelFromJson(json);

  LiveAssistSendStatus toStatus() {
    return status == 'queued'
        ? LiveAssistSendStatus.queued
        : LiveAssistSendStatus.ok;
  }
}

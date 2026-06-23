import 'package:eeagle_ai/src/domain/model/analytics_stream_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_stream_token_model.freezed.dart';
part 'analytics_stream_token_model.g.dart';

@freezed
abstract class AnalyticsStreamTokenModel with _$AnalyticsStreamTokenModel {
  const AnalyticsStreamTokenModel._();

  const factory AnalyticsStreamTokenModel({
    required String apikey,
    required String token,
    @JsonKey(name: 'ws_url') required String wsUrl,
  }) = _AnalyticsStreamTokenModel;

  factory AnalyticsStreamTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsStreamTokenModelFromJson(json);

  AnalyticsStreamInfo toEntity() {
    return AnalyticsStreamInfo(apikey: apikey, token: token, wsUrl: wsUrl);
  }
}

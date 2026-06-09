import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile_login_request_model.freezed.dart';
part 'mobile_login_request_model.g.dart';

@freezed
abstract class MobileLoginRequestModel with _$MobileLoginRequestModel {
  const factory MobileLoginRequestModel({
    required String email,
    required String password,
  }) = _MobileLoginRequestModel;

  factory MobileLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MobileLoginRequestModelFromJson(json);
}

import 'package:eeagle_ai/src/data/models/auth_user_model.dart';
import 'package:eeagle_ai/src/data/models/json_readers.dart';
import 'package:eeagle_ai/src/domain/model/auth_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile_login_response_model.freezed.dart';
part 'mobile_login_response_model.g.dart';

@freezed
abstract class MobileLoginResponseModel with _$MobileLoginResponseModel {
  const MobileLoginResponseModel._();

  const factory MobileLoginResponseModel({
    String? status,
    String? message,
    @JsonKey(name: 'access_token', fromJson: readNullableString)
    String? accessToken,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
    @JsonKey(name: 'expires_in') int? expiresIn,
    @JsonKey(name: 'access_token_expires_at', fromJson: readNullableString)
    String? accessTokenExpiresAt,
    AuthUserModel? user,
  }) = _MobileLoginResponseModel;

  factory MobileLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MobileLoginResponseModelFromJson(normalizeMobileLoginJson(json));

  AuthSession toEntity() {
    final token = accessToken;
    if (token == null || token.isEmpty) {
      throw const FormatException('Missing access token in login response.');
    }

    return AuthSession(
      accessToken: token,
      user: user?.toEntity() ??
          const AuthUserModel(id: '', email: '').toEntity(),
      expiresAt: _parseExpiresAt(accessTokenExpiresAt),
    );
  }

  DateTime? _parseExpiresAt(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    return DateTime.tryParse(value);
  }
}

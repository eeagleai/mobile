// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MobileLoginResponseModel _$MobileLoginResponseModelFromJson(
  Map<String, dynamic> json,
) => _MobileLoginResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  accessToken: readNullableString(json['access_token']),
  tokenType: json['token_type'] as String? ?? 'Bearer',
  expiresIn: (json['expires_in'] as num?)?.toInt(),
  accessTokenExpiresAt: readNullableString(json['access_token_expires_at']),
  user: json['user'] == null
      ? null
      : AuthUserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MobileLoginResponseModelToJson(
  _MobileLoginResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'expires_in': instance.expiresIn,
  'access_token_expires_at': instance.accessTokenExpiresAt,
  'user': instance.user,
};

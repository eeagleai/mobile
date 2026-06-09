// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserModel _$AuthUserModelFromJson(Map<String, dynamic> json) =>
    _AuthUserModel(
      id: json['id'] == null ? '' : readStringOrEmpty(json['id']),
      email: json['email'] == null ? '' : readStringOrEmpty(json['email']),
      emailVerified: json['email_verified'] as bool? ?? false,
      admin: json['admin'] as bool? ?? false,
    );

Map<String, dynamic> _$AuthUserModelToJson(_AuthUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'email_verified': instance.emailVerified,
      'admin': instance.admin,
    };

import 'package:eeagle_ai/src/domain/model/auth_user.dart';
import 'package:eeagle_ai/src/data/models/json_readers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

@freezed
abstract class AuthUserModel with _$AuthUserModel {
  const AuthUserModel._();

  const factory AuthUserModel({
    @JsonKey(fromJson: readStringOrEmpty) @Default('') String id,
    @JsonKey(fromJson: readStringOrEmpty) @Default('') String email,
    @JsonKey(name: 'email_verified') @Default(false) bool emailVerified,
    @Default(false) bool admin,
  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);

  AuthUser toEntity() {
    return AuthUser(
      id: id,
      email: email,
      emailVerified: emailVerified,
      admin: admin,
    );
  }
}

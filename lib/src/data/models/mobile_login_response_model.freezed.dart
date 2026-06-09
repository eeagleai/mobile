// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobile_login_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MobileLoginResponseModel {

 String? get status; String? get message;@JsonKey(name: 'access_token', fromJson: readNullableString) String? get accessToken;@JsonKey(name: 'token_type') String get tokenType;@JsonKey(name: 'expires_in') int? get expiresIn;@JsonKey(name: 'access_token_expires_at', fromJson: readNullableString) String? get accessTokenExpiresAt; AuthUserModel? get user;
/// Create a copy of MobileLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MobileLoginResponseModelCopyWith<MobileLoginResponseModel> get copyWith => _$MobileLoginResponseModelCopyWithImpl<MobileLoginResponseModel>(this as MobileLoginResponseModel, _$identity);

  /// Serializes this MobileLoginResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MobileLoginResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.accessTokenExpiresAt, accessTokenExpiresAt) || other.accessTokenExpiresAt == accessTokenExpiresAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,accessToken,tokenType,expiresIn,accessTokenExpiresAt,user);

@override
String toString() {
  return 'MobileLoginResponseModel(status: $status, message: $message, accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, accessTokenExpiresAt: $accessTokenExpiresAt, user: $user)';
}


}

/// @nodoc
abstract mixin class $MobileLoginResponseModelCopyWith<$Res>  {
  factory $MobileLoginResponseModelCopyWith(MobileLoginResponseModel value, $Res Function(MobileLoginResponseModel) _then) = _$MobileLoginResponseModelCopyWithImpl;
@useResult
$Res call({
 String? status, String? message,@JsonKey(name: 'access_token', fromJson: readNullableString) String? accessToken,@JsonKey(name: 'token_type') String tokenType,@JsonKey(name: 'expires_in') int? expiresIn,@JsonKey(name: 'access_token_expires_at', fromJson: readNullableString) String? accessTokenExpiresAt, AuthUserModel? user
});


$AuthUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$MobileLoginResponseModelCopyWithImpl<$Res>
    implements $MobileLoginResponseModelCopyWith<$Res> {
  _$MobileLoginResponseModelCopyWithImpl(this._self, this._then);

  final MobileLoginResponseModel _self;
  final $Res Function(MobileLoginResponseModel) _then;

/// Create a copy of MobileLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? accessToken = freezed,Object? tokenType = null,Object? expiresIn = freezed,Object? accessTokenExpiresAt = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,accessTokenExpiresAt: freezed == accessTokenExpiresAt ? _self.accessTokenExpiresAt : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,
  ));
}
/// Create a copy of MobileLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [MobileLoginResponseModel].
extension MobileLoginResponseModelPatterns on MobileLoginResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MobileLoginResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MobileLoginResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MobileLoginResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _MobileLoginResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MobileLoginResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _MobileLoginResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? status,  String? message, @JsonKey(name: 'access_token', fromJson: readNullableString)  String? accessToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'expires_in')  int? expiresIn, @JsonKey(name: 'access_token_expires_at', fromJson: readNullableString)  String? accessTokenExpiresAt,  AuthUserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MobileLoginResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.accessToken,_that.tokenType,_that.expiresIn,_that.accessTokenExpiresAt,_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? status,  String? message, @JsonKey(name: 'access_token', fromJson: readNullableString)  String? accessToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'expires_in')  int? expiresIn, @JsonKey(name: 'access_token_expires_at', fromJson: readNullableString)  String? accessTokenExpiresAt,  AuthUserModel? user)  $default,) {final _that = this;
switch (_that) {
case _MobileLoginResponseModel():
return $default(_that.status,_that.message,_that.accessToken,_that.tokenType,_that.expiresIn,_that.accessTokenExpiresAt,_that.user);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? status,  String? message, @JsonKey(name: 'access_token', fromJson: readNullableString)  String? accessToken, @JsonKey(name: 'token_type')  String tokenType, @JsonKey(name: 'expires_in')  int? expiresIn, @JsonKey(name: 'access_token_expires_at', fromJson: readNullableString)  String? accessTokenExpiresAt,  AuthUserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _MobileLoginResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.accessToken,_that.tokenType,_that.expiresIn,_that.accessTokenExpiresAt,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MobileLoginResponseModel extends MobileLoginResponseModel {
  const _MobileLoginResponseModel({this.status, this.message, @JsonKey(name: 'access_token', fromJson: readNullableString) this.accessToken, @JsonKey(name: 'token_type') this.tokenType = 'Bearer', @JsonKey(name: 'expires_in') this.expiresIn, @JsonKey(name: 'access_token_expires_at', fromJson: readNullableString) this.accessTokenExpiresAt, this.user}): super._();
  factory _MobileLoginResponseModel.fromJson(Map<String, dynamic> json) => _$MobileLoginResponseModelFromJson(json);

@override final  String? status;
@override final  String? message;
@override@JsonKey(name: 'access_token', fromJson: readNullableString) final  String? accessToken;
@override@JsonKey(name: 'token_type') final  String tokenType;
@override@JsonKey(name: 'expires_in') final  int? expiresIn;
@override@JsonKey(name: 'access_token_expires_at', fromJson: readNullableString) final  String? accessTokenExpiresAt;
@override final  AuthUserModel? user;

/// Create a copy of MobileLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MobileLoginResponseModelCopyWith<_MobileLoginResponseModel> get copyWith => __$MobileLoginResponseModelCopyWithImpl<_MobileLoginResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MobileLoginResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MobileLoginResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.accessTokenExpiresAt, accessTokenExpiresAt) || other.accessTokenExpiresAt == accessTokenExpiresAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,accessToken,tokenType,expiresIn,accessTokenExpiresAt,user);

@override
String toString() {
  return 'MobileLoginResponseModel(status: $status, message: $message, accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, accessTokenExpiresAt: $accessTokenExpiresAt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$MobileLoginResponseModelCopyWith<$Res> implements $MobileLoginResponseModelCopyWith<$Res> {
  factory _$MobileLoginResponseModelCopyWith(_MobileLoginResponseModel value, $Res Function(_MobileLoginResponseModel) _then) = __$MobileLoginResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? status, String? message,@JsonKey(name: 'access_token', fromJson: readNullableString) String? accessToken,@JsonKey(name: 'token_type') String tokenType,@JsonKey(name: 'expires_in') int? expiresIn,@JsonKey(name: 'access_token_expires_at', fromJson: readNullableString) String? accessTokenExpiresAt, AuthUserModel? user
});


@override $AuthUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$MobileLoginResponseModelCopyWithImpl<$Res>
    implements _$MobileLoginResponseModelCopyWith<$Res> {
  __$MobileLoginResponseModelCopyWithImpl(this._self, this._then);

  final _MobileLoginResponseModel _self;
  final $Res Function(_MobileLoginResponseModel) _then;

/// Create a copy of MobileLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? accessToken = freezed,Object? tokenType = null,Object? expiresIn = freezed,Object? accessTokenExpiresAt = freezed,Object? user = freezed,}) {
  return _then(_MobileLoginResponseModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,accessTokenExpiresAt: freezed == accessTokenExpiresAt ? _self.accessTokenExpiresAt : accessTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUserModel?,
  ));
}

/// Create a copy of MobileLoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AuthUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on

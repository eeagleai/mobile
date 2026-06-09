// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobile_login_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MobileLoginRequestModel {

 String get email; String get password;
/// Create a copy of MobileLoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MobileLoginRequestModelCopyWith<MobileLoginRequestModel> get copyWith => _$MobileLoginRequestModelCopyWithImpl<MobileLoginRequestModel>(this as MobileLoginRequestModel, _$identity);

  /// Serializes this MobileLoginRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MobileLoginRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'MobileLoginRequestModel(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $MobileLoginRequestModelCopyWith<$Res>  {
  factory $MobileLoginRequestModelCopyWith(MobileLoginRequestModel value, $Res Function(MobileLoginRequestModel) _then) = _$MobileLoginRequestModelCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$MobileLoginRequestModelCopyWithImpl<$Res>
    implements $MobileLoginRequestModelCopyWith<$Res> {
  _$MobileLoginRequestModelCopyWithImpl(this._self, this._then);

  final MobileLoginRequestModel _self;
  final $Res Function(MobileLoginRequestModel) _then;

/// Create a copy of MobileLoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MobileLoginRequestModel].
extension MobileLoginRequestModelPatterns on MobileLoginRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MobileLoginRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MobileLoginRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MobileLoginRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _MobileLoginRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MobileLoginRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _MobileLoginRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MobileLoginRequestModel() when $default != null:
return $default(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password)  $default,) {final _that = this;
switch (_that) {
case _MobileLoginRequestModel():
return $default(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password)?  $default,) {final _that = this;
switch (_that) {
case _MobileLoginRequestModel() when $default != null:
return $default(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MobileLoginRequestModel implements MobileLoginRequestModel {
  const _MobileLoginRequestModel({required this.email, required this.password});
  factory _MobileLoginRequestModel.fromJson(Map<String, dynamic> json) => _$MobileLoginRequestModelFromJson(json);

@override final  String email;
@override final  String password;

/// Create a copy of MobileLoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MobileLoginRequestModelCopyWith<_MobileLoginRequestModel> get copyWith => __$MobileLoginRequestModelCopyWithImpl<_MobileLoginRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MobileLoginRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MobileLoginRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'MobileLoginRequestModel(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$MobileLoginRequestModelCopyWith<$Res> implements $MobileLoginRequestModelCopyWith<$Res> {
  factory _$MobileLoginRequestModelCopyWith(_MobileLoginRequestModel value, $Res Function(_MobileLoginRequestModel) _then) = __$MobileLoginRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$MobileLoginRequestModelCopyWithImpl<$Res>
    implements _$MobileLoginRequestModelCopyWith<$Res> {
  __$MobileLoginRequestModelCopyWithImpl(this._self, this._then);

  final _MobileLoginRequestModel _self;
  final $Res Function(_MobileLoginRequestModel) _then;

/// Create a copy of MobileLoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_MobileLoginRequestModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

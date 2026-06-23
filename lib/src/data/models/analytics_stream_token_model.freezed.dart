// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_stream_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsStreamTokenModel {

 String get apikey; String get token;@JsonKey(name: 'ws_url') String get wsUrl;
/// Create a copy of AnalyticsStreamTokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsStreamTokenModelCopyWith<AnalyticsStreamTokenModel> get copyWith => _$AnalyticsStreamTokenModelCopyWithImpl<AnalyticsStreamTokenModel>(this as AnalyticsStreamTokenModel, _$identity);

  /// Serializes this AnalyticsStreamTokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsStreamTokenModel&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.token, token) || other.token == token)&&(identical(other.wsUrl, wsUrl) || other.wsUrl == wsUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apikey,token,wsUrl);

@override
String toString() {
  return 'AnalyticsStreamTokenModel(apikey: $apikey, token: $token, wsUrl: $wsUrl)';
}


}

/// @nodoc
abstract mixin class $AnalyticsStreamTokenModelCopyWith<$Res>  {
  factory $AnalyticsStreamTokenModelCopyWith(AnalyticsStreamTokenModel value, $Res Function(AnalyticsStreamTokenModel) _then) = _$AnalyticsStreamTokenModelCopyWithImpl;
@useResult
$Res call({
 String apikey, String token,@JsonKey(name: 'ws_url') String wsUrl
});




}
/// @nodoc
class _$AnalyticsStreamTokenModelCopyWithImpl<$Res>
    implements $AnalyticsStreamTokenModelCopyWith<$Res> {
  _$AnalyticsStreamTokenModelCopyWithImpl(this._self, this._then);

  final AnalyticsStreamTokenModel _self;
  final $Res Function(AnalyticsStreamTokenModel) _then;

/// Create a copy of AnalyticsStreamTokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apikey = null,Object? token = null,Object? wsUrl = null,}) {
  return _then(_self.copyWith(
apikey: null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,wsUrl: null == wsUrl ? _self.wsUrl : wsUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsStreamTokenModel].
extension AnalyticsStreamTokenModelPatterns on AnalyticsStreamTokenModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsStreamTokenModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsStreamTokenModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsStreamTokenModel value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsStreamTokenModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsStreamTokenModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsStreamTokenModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String apikey,  String token, @JsonKey(name: 'ws_url')  String wsUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsStreamTokenModel() when $default != null:
return $default(_that.apikey,_that.token,_that.wsUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String apikey,  String token, @JsonKey(name: 'ws_url')  String wsUrl)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsStreamTokenModel():
return $default(_that.apikey,_that.token,_that.wsUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String apikey,  String token, @JsonKey(name: 'ws_url')  String wsUrl)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsStreamTokenModel() when $default != null:
return $default(_that.apikey,_that.token,_that.wsUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsStreamTokenModel extends AnalyticsStreamTokenModel {
  const _AnalyticsStreamTokenModel({required this.apikey, required this.token, @JsonKey(name: 'ws_url') required this.wsUrl}): super._();
  factory _AnalyticsStreamTokenModel.fromJson(Map<String, dynamic> json) => _$AnalyticsStreamTokenModelFromJson(json);

@override final  String apikey;
@override final  String token;
@override@JsonKey(name: 'ws_url') final  String wsUrl;

/// Create a copy of AnalyticsStreamTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsStreamTokenModelCopyWith<_AnalyticsStreamTokenModel> get copyWith => __$AnalyticsStreamTokenModelCopyWithImpl<_AnalyticsStreamTokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsStreamTokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsStreamTokenModel&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.token, token) || other.token == token)&&(identical(other.wsUrl, wsUrl) || other.wsUrl == wsUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apikey,token,wsUrl);

@override
String toString() {
  return 'AnalyticsStreamTokenModel(apikey: $apikey, token: $token, wsUrl: $wsUrl)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsStreamTokenModelCopyWith<$Res> implements $AnalyticsStreamTokenModelCopyWith<$Res> {
  factory _$AnalyticsStreamTokenModelCopyWith(_AnalyticsStreamTokenModel value, $Res Function(_AnalyticsStreamTokenModel) _then) = __$AnalyticsStreamTokenModelCopyWithImpl;
@override @useResult
$Res call({
 String apikey, String token,@JsonKey(name: 'ws_url') String wsUrl
});




}
/// @nodoc
class __$AnalyticsStreamTokenModelCopyWithImpl<$Res>
    implements _$AnalyticsStreamTokenModelCopyWith<$Res> {
  __$AnalyticsStreamTokenModelCopyWithImpl(this._self, this._then);

  final _AnalyticsStreamTokenModel _self;
  final $Res Function(_AnalyticsStreamTokenModel) _then;

/// Create a copy of AnalyticsStreamTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apikey = null,Object? token = null,Object? wsUrl = null,}) {
  return _then(_AnalyticsStreamTokenModel(
apikey: null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,wsUrl: null == wsUrl ? _self.wsUrl : wsUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

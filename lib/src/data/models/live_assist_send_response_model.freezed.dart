// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_assist_send_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveAssistSendResponseModel {

 String? get status;
/// Create a copy of LiveAssistSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveAssistSendResponseModelCopyWith<LiveAssistSendResponseModel> get copyWith => _$LiveAssistSendResponseModelCopyWithImpl<LiveAssistSendResponseModel>(this as LiveAssistSendResponseModel, _$identity);

  /// Serializes this LiveAssistSendResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveAssistSendResponseModel&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'LiveAssistSendResponseModel(status: $status)';
}


}

/// @nodoc
abstract mixin class $LiveAssistSendResponseModelCopyWith<$Res>  {
  factory $LiveAssistSendResponseModelCopyWith(LiveAssistSendResponseModel value, $Res Function(LiveAssistSendResponseModel) _then) = _$LiveAssistSendResponseModelCopyWithImpl;
@useResult
$Res call({
 String? status
});




}
/// @nodoc
class _$LiveAssistSendResponseModelCopyWithImpl<$Res>
    implements $LiveAssistSendResponseModelCopyWith<$Res> {
  _$LiveAssistSendResponseModelCopyWithImpl(this._self, this._then);

  final LiveAssistSendResponseModel _self;
  final $Res Function(LiveAssistSendResponseModel) _then;

/// Create a copy of LiveAssistSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveAssistSendResponseModel].
extension LiveAssistSendResponseModelPatterns on LiveAssistSendResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveAssistSendResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveAssistSendResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveAssistSendResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _LiveAssistSendResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveAssistSendResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _LiveAssistSendResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveAssistSendResponseModel() when $default != null:
return $default(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? status)  $default,) {final _that = this;
switch (_that) {
case _LiveAssistSendResponseModel():
return $default(_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? status)?  $default,) {final _that = this;
switch (_that) {
case _LiveAssistSendResponseModel() when $default != null:
return $default(_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiveAssistSendResponseModel extends LiveAssistSendResponseModel {
  const _LiveAssistSendResponseModel({this.status}): super._();
  factory _LiveAssistSendResponseModel.fromJson(Map<String, dynamic> json) => _$LiveAssistSendResponseModelFromJson(json);

@override final  String? status;

/// Create a copy of LiveAssistSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveAssistSendResponseModelCopyWith<_LiveAssistSendResponseModel> get copyWith => __$LiveAssistSendResponseModelCopyWithImpl<_LiveAssistSendResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveAssistSendResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveAssistSendResponseModel&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'LiveAssistSendResponseModel(status: $status)';
}


}

/// @nodoc
abstract mixin class _$LiveAssistSendResponseModelCopyWith<$Res> implements $LiveAssistSendResponseModelCopyWith<$Res> {
  factory _$LiveAssistSendResponseModelCopyWith(_LiveAssistSendResponseModel value, $Res Function(_LiveAssistSendResponseModel) _then) = __$LiveAssistSendResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? status
});




}
/// @nodoc
class __$LiveAssistSendResponseModelCopyWithImpl<$Res>
    implements _$LiveAssistSendResponseModelCopyWith<$Res> {
  __$LiveAssistSendResponseModelCopyWithImpl(this._self, this._then);

  final _LiveAssistSendResponseModel _self;
  final $Res Function(_LiveAssistSendResponseModel) _then;

/// Create a copy of LiveAssistSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(_LiveAssistSendResponseModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

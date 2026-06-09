// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_quota_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SiteQuotaModel {

@JsonKey(name: 'remaining') int? get remaining;
/// Create a copy of SiteQuotaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteQuotaModelCopyWith<SiteQuotaModel> get copyWith => _$SiteQuotaModelCopyWithImpl<SiteQuotaModel>(this as SiteQuotaModel, _$identity);

  /// Serializes this SiteQuotaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteQuotaModel&&(identical(other.remaining, remaining) || other.remaining == remaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remaining);

@override
String toString() {
  return 'SiteQuotaModel(remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class $SiteQuotaModelCopyWith<$Res>  {
  factory $SiteQuotaModelCopyWith(SiteQuotaModel value, $Res Function(SiteQuotaModel) _then) = _$SiteQuotaModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'remaining') int? remaining
});




}
/// @nodoc
class _$SiteQuotaModelCopyWithImpl<$Res>
    implements $SiteQuotaModelCopyWith<$Res> {
  _$SiteQuotaModelCopyWithImpl(this._self, this._then);

  final SiteQuotaModel _self;
  final $Res Function(SiteQuotaModel) _then;

/// Create a copy of SiteQuotaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remaining = freezed,}) {
  return _then(_self.copyWith(
remaining: freezed == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SiteQuotaModel].
extension SiteQuotaModelPatterns on SiteQuotaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteQuotaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteQuotaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteQuotaModel value)  $default,){
final _that = this;
switch (_that) {
case _SiteQuotaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteQuotaModel value)?  $default,){
final _that = this;
switch (_that) {
case _SiteQuotaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'remaining')  int? remaining)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteQuotaModel() when $default != null:
return $default(_that.remaining);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'remaining')  int? remaining)  $default,) {final _that = this;
switch (_that) {
case _SiteQuotaModel():
return $default(_that.remaining);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'remaining')  int? remaining)?  $default,) {final _that = this;
switch (_that) {
case _SiteQuotaModel() when $default != null:
return $default(_that.remaining);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SiteQuotaModel implements SiteQuotaModel {
  const _SiteQuotaModel({@JsonKey(name: 'remaining') this.remaining});
  factory _SiteQuotaModel.fromJson(Map<String, dynamic> json) => _$SiteQuotaModelFromJson(json);

@override@JsonKey(name: 'remaining') final  int? remaining;

/// Create a copy of SiteQuotaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteQuotaModelCopyWith<_SiteQuotaModel> get copyWith => __$SiteQuotaModelCopyWithImpl<_SiteQuotaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteQuotaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteQuotaModel&&(identical(other.remaining, remaining) || other.remaining == remaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remaining);

@override
String toString() {
  return 'SiteQuotaModel(remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class _$SiteQuotaModelCopyWith<$Res> implements $SiteQuotaModelCopyWith<$Res> {
  factory _$SiteQuotaModelCopyWith(_SiteQuotaModel value, $Res Function(_SiteQuotaModel) _then) = __$SiteQuotaModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'remaining') int? remaining
});




}
/// @nodoc
class __$SiteQuotaModelCopyWithImpl<$Res>
    implements _$SiteQuotaModelCopyWith<$Res> {
  __$SiteQuotaModelCopyWithImpl(this._self, this._then);

  final _SiteQuotaModel _self;
  final $Res Function(_SiteQuotaModel) _then;

/// Create a copy of SiteQuotaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remaining = freezed,}) {
  return _then(_SiteQuotaModel(
remaining: freezed == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on

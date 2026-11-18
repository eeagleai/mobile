// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_revision_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SiteRevisionModel {

 String get id; String get apikey; String get sha256; String get kind; int? get bytes;@JsonKey(name: 'user_summary') String? get userSummary;@JsonKey(name: 'created_at_iso') DateTime get createdAt;@JsonKey(name: 'change_id') String? get changeId;@JsonKey(name: 'quota_consumed') bool get quotaConsumed;
/// Create a copy of SiteRevisionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteRevisionModelCopyWith<SiteRevisionModel> get copyWith => _$SiteRevisionModelCopyWithImpl<SiteRevisionModel>(this as SiteRevisionModel, _$identity);

  /// Serializes this SiteRevisionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteRevisionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.bytes, bytes) || other.bytes == bytes)&&(identical(other.userSummary, userSummary) || other.userSummary == userSummary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.changeId, changeId) || other.changeId == changeId)&&(identical(other.quotaConsumed, quotaConsumed) || other.quotaConsumed == quotaConsumed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,apikey,sha256,kind,bytes,userSummary,createdAt,changeId,quotaConsumed);

@override
String toString() {
  return 'SiteRevisionModel(id: $id, apikey: $apikey, sha256: $sha256, kind: $kind, bytes: $bytes, userSummary: $userSummary, createdAt: $createdAt, changeId: $changeId, quotaConsumed: $quotaConsumed)';
}


}

/// @nodoc
abstract mixin class $SiteRevisionModelCopyWith<$Res>  {
  factory $SiteRevisionModelCopyWith(SiteRevisionModel value, $Res Function(SiteRevisionModel) _then) = _$SiteRevisionModelCopyWithImpl;
@useResult
$Res call({
 String id, String apikey, String sha256, String kind, int? bytes,@JsonKey(name: 'user_summary') String? userSummary,@JsonKey(name: 'created_at_iso') DateTime createdAt,@JsonKey(name: 'change_id') String? changeId,@JsonKey(name: 'quota_consumed') bool quotaConsumed
});




}
/// @nodoc
class _$SiteRevisionModelCopyWithImpl<$Res>
    implements $SiteRevisionModelCopyWith<$Res> {
  _$SiteRevisionModelCopyWithImpl(this._self, this._then);

  final SiteRevisionModel _self;
  final $Res Function(SiteRevisionModel) _then;

/// Create a copy of SiteRevisionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? apikey = null,Object? sha256 = null,Object? kind = null,Object? bytes = freezed,Object? userSummary = freezed,Object? createdAt = null,Object? changeId = freezed,Object? quotaConsumed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,apikey: null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as int?,userSummary: freezed == userSummary ? _self.userSummary : userSummary // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,changeId: freezed == changeId ? _self.changeId : changeId // ignore: cast_nullable_to_non_nullable
as String?,quotaConsumed: null == quotaConsumed ? _self.quotaConsumed : quotaConsumed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SiteRevisionModel].
extension SiteRevisionModelPatterns on SiteRevisionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteRevisionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteRevisionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteRevisionModel value)  $default,){
final _that = this;
switch (_that) {
case _SiteRevisionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteRevisionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SiteRevisionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String apikey,  String sha256,  String kind,  int? bytes, @JsonKey(name: 'user_summary')  String? userSummary, @JsonKey(name: 'created_at_iso')  DateTime createdAt, @JsonKey(name: 'change_id')  String? changeId, @JsonKey(name: 'quota_consumed')  bool quotaConsumed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteRevisionModel() when $default != null:
return $default(_that.id,_that.apikey,_that.sha256,_that.kind,_that.bytes,_that.userSummary,_that.createdAt,_that.changeId,_that.quotaConsumed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String apikey,  String sha256,  String kind,  int? bytes, @JsonKey(name: 'user_summary')  String? userSummary, @JsonKey(name: 'created_at_iso')  DateTime createdAt, @JsonKey(name: 'change_id')  String? changeId, @JsonKey(name: 'quota_consumed')  bool quotaConsumed)  $default,) {final _that = this;
switch (_that) {
case _SiteRevisionModel():
return $default(_that.id,_that.apikey,_that.sha256,_that.kind,_that.bytes,_that.userSummary,_that.createdAt,_that.changeId,_that.quotaConsumed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String apikey,  String sha256,  String kind,  int? bytes, @JsonKey(name: 'user_summary')  String? userSummary, @JsonKey(name: 'created_at_iso')  DateTime createdAt, @JsonKey(name: 'change_id')  String? changeId, @JsonKey(name: 'quota_consumed')  bool quotaConsumed)?  $default,) {final _that = this;
switch (_that) {
case _SiteRevisionModel() when $default != null:
return $default(_that.id,_that.apikey,_that.sha256,_that.kind,_that.bytes,_that.userSummary,_that.createdAt,_that.changeId,_that.quotaConsumed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SiteRevisionModel extends SiteRevisionModel {
  const _SiteRevisionModel({required this.id, this.apikey = '', this.sha256 = '', this.kind = 'frontend', this.bytes, @JsonKey(name: 'user_summary') this.userSummary, @JsonKey(name: 'created_at_iso') required this.createdAt, @JsonKey(name: 'change_id') this.changeId, @JsonKey(name: 'quota_consumed') this.quotaConsumed = false}): super._();
  factory _SiteRevisionModel.fromJson(Map<String, dynamic> json) => _$SiteRevisionModelFromJson(json);

@override final  String id;
@override@JsonKey() final  String apikey;
@override@JsonKey() final  String sha256;
@override@JsonKey() final  String kind;
@override final  int? bytes;
@override@JsonKey(name: 'user_summary') final  String? userSummary;
@override@JsonKey(name: 'created_at_iso') final  DateTime createdAt;
@override@JsonKey(name: 'change_id') final  String? changeId;
@override@JsonKey(name: 'quota_consumed') final  bool quotaConsumed;

/// Create a copy of SiteRevisionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteRevisionModelCopyWith<_SiteRevisionModel> get copyWith => __$SiteRevisionModelCopyWithImpl<_SiteRevisionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteRevisionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteRevisionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.bytes, bytes) || other.bytes == bytes)&&(identical(other.userSummary, userSummary) || other.userSummary == userSummary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.changeId, changeId) || other.changeId == changeId)&&(identical(other.quotaConsumed, quotaConsumed) || other.quotaConsumed == quotaConsumed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,apikey,sha256,kind,bytes,userSummary,createdAt,changeId,quotaConsumed);

@override
String toString() {
  return 'SiteRevisionModel(id: $id, apikey: $apikey, sha256: $sha256, kind: $kind, bytes: $bytes, userSummary: $userSummary, createdAt: $createdAt, changeId: $changeId, quotaConsumed: $quotaConsumed)';
}


}

/// @nodoc
abstract mixin class _$SiteRevisionModelCopyWith<$Res> implements $SiteRevisionModelCopyWith<$Res> {
  factory _$SiteRevisionModelCopyWith(_SiteRevisionModel value, $Res Function(_SiteRevisionModel) _then) = __$SiteRevisionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String apikey, String sha256, String kind, int? bytes,@JsonKey(name: 'user_summary') String? userSummary,@JsonKey(name: 'created_at_iso') DateTime createdAt,@JsonKey(name: 'change_id') String? changeId,@JsonKey(name: 'quota_consumed') bool quotaConsumed
});




}
/// @nodoc
class __$SiteRevisionModelCopyWithImpl<$Res>
    implements _$SiteRevisionModelCopyWith<$Res> {
  __$SiteRevisionModelCopyWithImpl(this._self, this._then);

  final _SiteRevisionModel _self;
  final $Res Function(_SiteRevisionModel) _then;

/// Create a copy of SiteRevisionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? apikey = null,Object? sha256 = null,Object? kind = null,Object? bytes = freezed,Object? userSummary = freezed,Object? createdAt = null,Object? changeId = freezed,Object? quotaConsumed = null,}) {
  return _then(_SiteRevisionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,apikey: null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as int?,userSummary: freezed == userSummary ? _self.userSummary : userSummary // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,changeId: freezed == changeId ? _self.changeId : changeId // ignore: cast_nullable_to_non_nullable
as String?,quotaConsumed: null == quotaConsumed ? _self.quotaConsumed : quotaConsumed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SiteModel {

 String get apikey;@JsonKey(name: 'site_id') String get siteId; String get name; String get host; SiteQuotaModel? get quota;@JsonKey(name: 'subscription_status') String? get subscriptionStatus;
/// Create a copy of SiteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteModelCopyWith<SiteModel> get copyWith => _$SiteModelCopyWithImpl<SiteModel>(this as SiteModel, _$identity);

  /// Serializes this SiteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteModel&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.name, name) || other.name == name)&&(identical(other.host, host) || other.host == host)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apikey,siteId,name,host,quota,subscriptionStatus);

@override
String toString() {
  return 'SiteModel(apikey: $apikey, siteId: $siteId, name: $name, host: $host, quota: $quota, subscriptionStatus: $subscriptionStatus)';
}


}

/// @nodoc
abstract mixin class $SiteModelCopyWith<$Res>  {
  factory $SiteModelCopyWith(SiteModel value, $Res Function(SiteModel) _then) = _$SiteModelCopyWithImpl;
@useResult
$Res call({
 String apikey,@JsonKey(name: 'site_id') String siteId, String name, String host, SiteQuotaModel? quota,@JsonKey(name: 'subscription_status') String? subscriptionStatus
});


$SiteQuotaModelCopyWith<$Res>? get quota;

}
/// @nodoc
class _$SiteModelCopyWithImpl<$Res>
    implements $SiteModelCopyWith<$Res> {
  _$SiteModelCopyWithImpl(this._self, this._then);

  final SiteModel _self;
  final $Res Function(SiteModel) _then;

/// Create a copy of SiteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apikey = null,Object? siteId = null,Object? name = null,Object? host = null,Object? quota = freezed,Object? subscriptionStatus = freezed,}) {
  return _then(_self.copyWith(
apikey: null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,siteId: null == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as SiteQuotaModel?,subscriptionStatus: freezed == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SiteModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteQuotaModelCopyWith<$Res>? get quota {
    if (_self.quota == null) {
    return null;
  }

  return $SiteQuotaModelCopyWith<$Res>(_self.quota!, (value) {
    return _then(_self.copyWith(quota: value));
  });
}
}


/// Adds pattern-matching-related methods to [SiteModel].
extension SiteModelPatterns on SiteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteModel value)  $default,){
final _that = this;
switch (_that) {
case _SiteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteModel value)?  $default,){
final _that = this;
switch (_that) {
case _SiteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String apikey, @JsonKey(name: 'site_id')  String siteId,  String name,  String host,  SiteQuotaModel? quota, @JsonKey(name: 'subscription_status')  String? subscriptionStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteModel() when $default != null:
return $default(_that.apikey,_that.siteId,_that.name,_that.host,_that.quota,_that.subscriptionStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String apikey, @JsonKey(name: 'site_id')  String siteId,  String name,  String host,  SiteQuotaModel? quota, @JsonKey(name: 'subscription_status')  String? subscriptionStatus)  $default,) {final _that = this;
switch (_that) {
case _SiteModel():
return $default(_that.apikey,_that.siteId,_that.name,_that.host,_that.quota,_that.subscriptionStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String apikey, @JsonKey(name: 'site_id')  String siteId,  String name,  String host,  SiteQuotaModel? quota, @JsonKey(name: 'subscription_status')  String? subscriptionStatus)?  $default,) {final _that = this;
switch (_that) {
case _SiteModel() when $default != null:
return $default(_that.apikey,_that.siteId,_that.name,_that.host,_that.quota,_that.subscriptionStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SiteModel extends SiteModel {
  const _SiteModel({required this.apikey, @JsonKey(name: 'site_id') required this.siteId, required this.name, required this.host, this.quota, @JsonKey(name: 'subscription_status') this.subscriptionStatus}): super._();
  factory _SiteModel.fromJson(Map<String, dynamic> json) => _$SiteModelFromJson(json);

@override final  String apikey;
@override@JsonKey(name: 'site_id') final  String siteId;
@override final  String name;
@override final  String host;
@override final  SiteQuotaModel? quota;
@override@JsonKey(name: 'subscription_status') final  String? subscriptionStatus;

/// Create a copy of SiteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteModelCopyWith<_SiteModel> get copyWith => __$SiteModelCopyWithImpl<_SiteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteModel&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.name, name) || other.name == name)&&(identical(other.host, host) || other.host == host)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apikey,siteId,name,host,quota,subscriptionStatus);

@override
String toString() {
  return 'SiteModel(apikey: $apikey, siteId: $siteId, name: $name, host: $host, quota: $quota, subscriptionStatus: $subscriptionStatus)';
}


}

/// @nodoc
abstract mixin class _$SiteModelCopyWith<$Res> implements $SiteModelCopyWith<$Res> {
  factory _$SiteModelCopyWith(_SiteModel value, $Res Function(_SiteModel) _then) = __$SiteModelCopyWithImpl;
@override @useResult
$Res call({
 String apikey,@JsonKey(name: 'site_id') String siteId, String name, String host, SiteQuotaModel? quota,@JsonKey(name: 'subscription_status') String? subscriptionStatus
});


@override $SiteQuotaModelCopyWith<$Res>? get quota;

}
/// @nodoc
class __$SiteModelCopyWithImpl<$Res>
    implements _$SiteModelCopyWith<$Res> {
  __$SiteModelCopyWithImpl(this._self, this._then);

  final _SiteModel _self;
  final $Res Function(_SiteModel) _then;

/// Create a copy of SiteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apikey = null,Object? siteId = null,Object? name = null,Object? host = null,Object? quota = freezed,Object? subscriptionStatus = freezed,}) {
  return _then(_SiteModel(
apikey: null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,siteId: null == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as SiteQuotaModel?,subscriptionStatus: freezed == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SiteModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteQuotaModelCopyWith<$Res>? get quota {
    if (_self.quota == null) {
    return null;
  }

  return $SiteQuotaModelCopyWith<$Res>(_self.quota!, (value) {
    return _then(_self.copyWith(quota: value));
  });
}
}

// dart format on

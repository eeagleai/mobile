// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_rollback_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SiteRollbackReloadModel {

 bool get dte;
/// Create a copy of SiteRollbackReloadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteRollbackReloadModelCopyWith<SiteRollbackReloadModel> get copyWith => _$SiteRollbackReloadModelCopyWithImpl<SiteRollbackReloadModel>(this as SiteRollbackReloadModel, _$identity);

  /// Serializes this SiteRollbackReloadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteRollbackReloadModel&&(identical(other.dte, dte) || other.dte == dte));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dte);

@override
String toString() {
  return 'SiteRollbackReloadModel(dte: $dte)';
}


}

/// @nodoc
abstract mixin class $SiteRollbackReloadModelCopyWith<$Res>  {
  factory $SiteRollbackReloadModelCopyWith(SiteRollbackReloadModel value, $Res Function(SiteRollbackReloadModel) _then) = _$SiteRollbackReloadModelCopyWithImpl;
@useResult
$Res call({
 bool dte
});




}
/// @nodoc
class _$SiteRollbackReloadModelCopyWithImpl<$Res>
    implements $SiteRollbackReloadModelCopyWith<$Res> {
  _$SiteRollbackReloadModelCopyWithImpl(this._self, this._then);

  final SiteRollbackReloadModel _self;
  final $Res Function(SiteRollbackReloadModel) _then;

/// Create a copy of SiteRollbackReloadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dte = null,}) {
  return _then(_self.copyWith(
dte: null == dte ? _self.dte : dte // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SiteRollbackReloadModel].
extension SiteRollbackReloadModelPatterns on SiteRollbackReloadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteRollbackReloadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteRollbackReloadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteRollbackReloadModel value)  $default,){
final _that = this;
switch (_that) {
case _SiteRollbackReloadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteRollbackReloadModel value)?  $default,){
final _that = this;
switch (_that) {
case _SiteRollbackReloadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool dte)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteRollbackReloadModel() when $default != null:
return $default(_that.dte);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool dte)  $default,) {final _that = this;
switch (_that) {
case _SiteRollbackReloadModel():
return $default(_that.dte);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool dte)?  $default,) {final _that = this;
switch (_that) {
case _SiteRollbackReloadModel() when $default != null:
return $default(_that.dte);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SiteRollbackReloadModel implements SiteRollbackReloadModel {
  const _SiteRollbackReloadModel({this.dte = false});
  factory _SiteRollbackReloadModel.fromJson(Map<String, dynamic> json) => _$SiteRollbackReloadModelFromJson(json);

@override@JsonKey() final  bool dte;

/// Create a copy of SiteRollbackReloadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteRollbackReloadModelCopyWith<_SiteRollbackReloadModel> get copyWith => __$SiteRollbackReloadModelCopyWithImpl<_SiteRollbackReloadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteRollbackReloadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteRollbackReloadModel&&(identical(other.dte, dte) || other.dte == dte));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dte);

@override
String toString() {
  return 'SiteRollbackReloadModel(dte: $dte)';
}


}

/// @nodoc
abstract mixin class _$SiteRollbackReloadModelCopyWith<$Res> implements $SiteRollbackReloadModelCopyWith<$Res> {
  factory _$SiteRollbackReloadModelCopyWith(_SiteRollbackReloadModel value, $Res Function(_SiteRollbackReloadModel) _then) = __$SiteRollbackReloadModelCopyWithImpl;
@override @useResult
$Res call({
 bool dte
});




}
/// @nodoc
class __$SiteRollbackReloadModelCopyWithImpl<$Res>
    implements _$SiteRollbackReloadModelCopyWith<$Res> {
  __$SiteRollbackReloadModelCopyWithImpl(this._self, this._then);

  final _SiteRollbackReloadModel _self;
  final $Res Function(_SiteRollbackReloadModel) _then;

/// Create a copy of SiteRollbackReloadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dte = null,}) {
  return _then(_SiteRollbackReloadModel(
dte: null == dte ? _self.dte : dte // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SiteRollbackResponseModel {

@JsonKey(name: 'rolled_back_to') String get rolledBackTo; String? get sha256; String? get kind; List<String> get kinds;@JsonKey(name: 'quota_refunded') bool get quotaRefunded; SiteQuotaModel? get quota; SiteRollbackReloadModel? get reload;
/// Create a copy of SiteRollbackResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteRollbackResponseModelCopyWith<SiteRollbackResponseModel> get copyWith => _$SiteRollbackResponseModelCopyWithImpl<SiteRollbackResponseModel>(this as SiteRollbackResponseModel, _$identity);

  /// Serializes this SiteRollbackResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteRollbackResponseModel&&(identical(other.rolledBackTo, rolledBackTo) || other.rolledBackTo == rolledBackTo)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.kinds, kinds)&&(identical(other.quotaRefunded, quotaRefunded) || other.quotaRefunded == quotaRefunded)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.reload, reload) || other.reload == reload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rolledBackTo,sha256,kind,const DeepCollectionEquality().hash(kinds),quotaRefunded,quota,reload);

@override
String toString() {
  return 'SiteRollbackResponseModel(rolledBackTo: $rolledBackTo, sha256: $sha256, kind: $kind, kinds: $kinds, quotaRefunded: $quotaRefunded, quota: $quota, reload: $reload)';
}


}

/// @nodoc
abstract mixin class $SiteRollbackResponseModelCopyWith<$Res>  {
  factory $SiteRollbackResponseModelCopyWith(SiteRollbackResponseModel value, $Res Function(SiteRollbackResponseModel) _then) = _$SiteRollbackResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rolled_back_to') String rolledBackTo, String? sha256, String? kind, List<String> kinds,@JsonKey(name: 'quota_refunded') bool quotaRefunded, SiteQuotaModel? quota, SiteRollbackReloadModel? reload
});


$SiteQuotaModelCopyWith<$Res>? get quota;$SiteRollbackReloadModelCopyWith<$Res>? get reload;

}
/// @nodoc
class _$SiteRollbackResponseModelCopyWithImpl<$Res>
    implements $SiteRollbackResponseModelCopyWith<$Res> {
  _$SiteRollbackResponseModelCopyWithImpl(this._self, this._then);

  final SiteRollbackResponseModel _self;
  final $Res Function(SiteRollbackResponseModel) _then;

/// Create a copy of SiteRollbackResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rolledBackTo = null,Object? sha256 = freezed,Object? kind = freezed,Object? kinds = null,Object? quotaRefunded = null,Object? quota = freezed,Object? reload = freezed,}) {
  return _then(_self.copyWith(
rolledBackTo: null == rolledBackTo ? _self.rolledBackTo : rolledBackTo // ignore: cast_nullable_to_non_nullable
as String,sha256: freezed == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,kinds: null == kinds ? _self.kinds : kinds // ignore: cast_nullable_to_non_nullable
as List<String>,quotaRefunded: null == quotaRefunded ? _self.quotaRefunded : quotaRefunded // ignore: cast_nullable_to_non_nullable
as bool,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as SiteQuotaModel?,reload: freezed == reload ? _self.reload : reload // ignore: cast_nullable_to_non_nullable
as SiteRollbackReloadModel?,
  ));
}
/// Create a copy of SiteRollbackResponseModel
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
}/// Create a copy of SiteRollbackResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteRollbackReloadModelCopyWith<$Res>? get reload {
    if (_self.reload == null) {
    return null;
  }

  return $SiteRollbackReloadModelCopyWith<$Res>(_self.reload!, (value) {
    return _then(_self.copyWith(reload: value));
  });
}
}


/// Adds pattern-matching-related methods to [SiteRollbackResponseModel].
extension SiteRollbackResponseModelPatterns on SiteRollbackResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteRollbackResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteRollbackResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteRollbackResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SiteRollbackResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteRollbackResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SiteRollbackResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'rolled_back_to')  String rolledBackTo,  String? sha256,  String? kind,  List<String> kinds, @JsonKey(name: 'quota_refunded')  bool quotaRefunded,  SiteQuotaModel? quota,  SiteRollbackReloadModel? reload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteRollbackResponseModel() when $default != null:
return $default(_that.rolledBackTo,_that.sha256,_that.kind,_that.kinds,_that.quotaRefunded,_that.quota,_that.reload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'rolled_back_to')  String rolledBackTo,  String? sha256,  String? kind,  List<String> kinds, @JsonKey(name: 'quota_refunded')  bool quotaRefunded,  SiteQuotaModel? quota,  SiteRollbackReloadModel? reload)  $default,) {final _that = this;
switch (_that) {
case _SiteRollbackResponseModel():
return $default(_that.rolledBackTo,_that.sha256,_that.kind,_that.kinds,_that.quotaRefunded,_that.quota,_that.reload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'rolled_back_to')  String rolledBackTo,  String? sha256,  String? kind,  List<String> kinds, @JsonKey(name: 'quota_refunded')  bool quotaRefunded,  SiteQuotaModel? quota,  SiteRollbackReloadModel? reload)?  $default,) {final _that = this;
switch (_that) {
case _SiteRollbackResponseModel() when $default != null:
return $default(_that.rolledBackTo,_that.sha256,_that.kind,_that.kinds,_that.quotaRefunded,_that.quota,_that.reload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SiteRollbackResponseModel extends SiteRollbackResponseModel {
  const _SiteRollbackResponseModel({@JsonKey(name: 'rolled_back_to') required this.rolledBackTo, this.sha256, this.kind, final  List<String> kinds = const [], @JsonKey(name: 'quota_refunded') this.quotaRefunded = false, this.quota, this.reload}): _kinds = kinds,super._();
  factory _SiteRollbackResponseModel.fromJson(Map<String, dynamic> json) => _$SiteRollbackResponseModelFromJson(json);

@override@JsonKey(name: 'rolled_back_to') final  String rolledBackTo;
@override final  String? sha256;
@override final  String? kind;
 final  List<String> _kinds;
@override@JsonKey() List<String> get kinds {
  if (_kinds is EqualUnmodifiableListView) return _kinds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_kinds);
}

@override@JsonKey(name: 'quota_refunded') final  bool quotaRefunded;
@override final  SiteQuotaModel? quota;
@override final  SiteRollbackReloadModel? reload;

/// Create a copy of SiteRollbackResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteRollbackResponseModelCopyWith<_SiteRollbackResponseModel> get copyWith => __$SiteRollbackResponseModelCopyWithImpl<_SiteRollbackResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteRollbackResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteRollbackResponseModel&&(identical(other.rolledBackTo, rolledBackTo) || other.rolledBackTo == rolledBackTo)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other._kinds, _kinds)&&(identical(other.quotaRefunded, quotaRefunded) || other.quotaRefunded == quotaRefunded)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.reload, reload) || other.reload == reload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rolledBackTo,sha256,kind,const DeepCollectionEquality().hash(_kinds),quotaRefunded,quota,reload);

@override
String toString() {
  return 'SiteRollbackResponseModel(rolledBackTo: $rolledBackTo, sha256: $sha256, kind: $kind, kinds: $kinds, quotaRefunded: $quotaRefunded, quota: $quota, reload: $reload)';
}


}

/// @nodoc
abstract mixin class _$SiteRollbackResponseModelCopyWith<$Res> implements $SiteRollbackResponseModelCopyWith<$Res> {
  factory _$SiteRollbackResponseModelCopyWith(_SiteRollbackResponseModel value, $Res Function(_SiteRollbackResponseModel) _then) = __$SiteRollbackResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rolled_back_to') String rolledBackTo, String? sha256, String? kind, List<String> kinds,@JsonKey(name: 'quota_refunded') bool quotaRefunded, SiteQuotaModel? quota, SiteRollbackReloadModel? reload
});


@override $SiteQuotaModelCopyWith<$Res>? get quota;@override $SiteRollbackReloadModelCopyWith<$Res>? get reload;

}
/// @nodoc
class __$SiteRollbackResponseModelCopyWithImpl<$Res>
    implements _$SiteRollbackResponseModelCopyWith<$Res> {
  __$SiteRollbackResponseModelCopyWithImpl(this._self, this._then);

  final _SiteRollbackResponseModel _self;
  final $Res Function(_SiteRollbackResponseModel) _then;

/// Create a copy of SiteRollbackResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rolledBackTo = null,Object? sha256 = freezed,Object? kind = freezed,Object? kinds = null,Object? quotaRefunded = null,Object? quota = freezed,Object? reload = freezed,}) {
  return _then(_SiteRollbackResponseModel(
rolledBackTo: null == rolledBackTo ? _self.rolledBackTo : rolledBackTo // ignore: cast_nullable_to_non_nullable
as String,sha256: freezed == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,kinds: null == kinds ? _self._kinds : kinds // ignore: cast_nullable_to_non_nullable
as List<String>,quotaRefunded: null == quotaRefunded ? _self.quotaRefunded : quotaRefunded // ignore: cast_nullable_to_non_nullable
as bool,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as SiteQuotaModel?,reload: freezed == reload ? _self.reload : reload // ignore: cast_nullable_to_non_nullable
as SiteRollbackReloadModel?,
  ));
}

/// Create a copy of SiteRollbackResponseModel
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
}/// Create a copy of SiteRollbackResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteRollbackReloadModelCopyWith<$Res>? get reload {
    if (_self.reload == null) {
    return null;
  }

  return $SiteRollbackReloadModelCopyWith<$Res>(_self.reload!, (value) {
    return _then(_self.copyWith(reload: value));
  });
}
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sites_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SitesResponseModel {

 List<SiteModel> get items;
/// Create a copy of SitesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SitesResponseModelCopyWith<SitesResponseModel> get copyWith => _$SitesResponseModelCopyWithImpl<SitesResponseModel>(this as SitesResponseModel, _$identity);

  /// Serializes this SitesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SitesResponseModel&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'SitesResponseModel(items: $items)';
}


}

/// @nodoc
abstract mixin class $SitesResponseModelCopyWith<$Res>  {
  factory $SitesResponseModelCopyWith(SitesResponseModel value, $Res Function(SitesResponseModel) _then) = _$SitesResponseModelCopyWithImpl;
@useResult
$Res call({
 List<SiteModel> items
});




}
/// @nodoc
class _$SitesResponseModelCopyWithImpl<$Res>
    implements $SitesResponseModelCopyWith<$Res> {
  _$SitesResponseModelCopyWithImpl(this._self, this._then);

  final SitesResponseModel _self;
  final $Res Function(SitesResponseModel) _then;

/// Create a copy of SitesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SiteModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SitesResponseModel].
extension SitesResponseModelPatterns on SitesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SitesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SitesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SitesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SitesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SitesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SitesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SiteModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SitesResponseModel() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SiteModel> items)  $default,) {final _that = this;
switch (_that) {
case _SitesResponseModel():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SiteModel> items)?  $default,) {final _that = this;
switch (_that) {
case _SitesResponseModel() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SitesResponseModel extends SitesResponseModel {
  const _SitesResponseModel({final  List<SiteModel> items = const []}): _items = items,super._();
  factory _SitesResponseModel.fromJson(Map<String, dynamic> json) => _$SitesResponseModelFromJson(json);

 final  List<SiteModel> _items;
@override@JsonKey() List<SiteModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of SitesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SitesResponseModelCopyWith<_SitesResponseModel> get copyWith => __$SitesResponseModelCopyWithImpl<_SitesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SitesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SitesResponseModel&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'SitesResponseModel(items: $items)';
}


}

/// @nodoc
abstract mixin class _$SitesResponseModelCopyWith<$Res> implements $SitesResponseModelCopyWith<$Res> {
  factory _$SitesResponseModelCopyWith(_SitesResponseModel value, $Res Function(_SitesResponseModel) _then) = __$SitesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<SiteModel> items
});




}
/// @nodoc
class __$SitesResponseModelCopyWithImpl<$Res>
    implements _$SitesResponseModelCopyWith<$Res> {
  __$SitesResponseModelCopyWithImpl(this._self, this._then);

  final _SitesResponseModel _self;
  final $Res Function(_SitesResponseModel) _then;

/// Create a copy of SitesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_SitesResponseModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SiteModel>,
  ));
}


}

// dart format on

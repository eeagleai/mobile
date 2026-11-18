// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_revisions_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SiteRevisionsResponseModel {

 List<SiteRevisionModel> get items;
/// Create a copy of SiteRevisionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteRevisionsResponseModelCopyWith<SiteRevisionsResponseModel> get copyWith => _$SiteRevisionsResponseModelCopyWithImpl<SiteRevisionsResponseModel>(this as SiteRevisionsResponseModel, _$identity);

  /// Serializes this SiteRevisionsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteRevisionsResponseModel&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'SiteRevisionsResponseModel(items: $items)';
}


}

/// @nodoc
abstract mixin class $SiteRevisionsResponseModelCopyWith<$Res>  {
  factory $SiteRevisionsResponseModelCopyWith(SiteRevisionsResponseModel value, $Res Function(SiteRevisionsResponseModel) _then) = _$SiteRevisionsResponseModelCopyWithImpl;
@useResult
$Res call({
 List<SiteRevisionModel> items
});




}
/// @nodoc
class _$SiteRevisionsResponseModelCopyWithImpl<$Res>
    implements $SiteRevisionsResponseModelCopyWith<$Res> {
  _$SiteRevisionsResponseModelCopyWithImpl(this._self, this._then);

  final SiteRevisionsResponseModel _self;
  final $Res Function(SiteRevisionsResponseModel) _then;

/// Create a copy of SiteRevisionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SiteRevisionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SiteRevisionsResponseModel].
extension SiteRevisionsResponseModelPatterns on SiteRevisionsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteRevisionsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteRevisionsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteRevisionsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SiteRevisionsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteRevisionsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SiteRevisionsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SiteRevisionModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteRevisionsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SiteRevisionModel> items)  $default,) {final _that = this;
switch (_that) {
case _SiteRevisionsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SiteRevisionModel> items)?  $default,) {final _that = this;
switch (_that) {
case _SiteRevisionsResponseModel() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SiteRevisionsResponseModel extends SiteRevisionsResponseModel {
  const _SiteRevisionsResponseModel({final  List<SiteRevisionModel> items = const []}): _items = items,super._();
  factory _SiteRevisionsResponseModel.fromJson(Map<String, dynamic> json) => _$SiteRevisionsResponseModelFromJson(json);

 final  List<SiteRevisionModel> _items;
@override@JsonKey() List<SiteRevisionModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of SiteRevisionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteRevisionsResponseModelCopyWith<_SiteRevisionsResponseModel> get copyWith => __$SiteRevisionsResponseModelCopyWithImpl<_SiteRevisionsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteRevisionsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteRevisionsResponseModel&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'SiteRevisionsResponseModel(items: $items)';
}


}

/// @nodoc
abstract mixin class _$SiteRevisionsResponseModelCopyWith<$Res> implements $SiteRevisionsResponseModelCopyWith<$Res> {
  factory _$SiteRevisionsResponseModelCopyWith(_SiteRevisionsResponseModel value, $Res Function(_SiteRevisionsResponseModel) _then) = __$SiteRevisionsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<SiteRevisionModel> items
});




}
/// @nodoc
class __$SiteRevisionsResponseModelCopyWithImpl<$Res>
    implements _$SiteRevisionsResponseModelCopyWith<$Res> {
  __$SiteRevisionsResponseModelCopyWithImpl(this._self, this._then);

  final _SiteRevisionsResponseModel _self;
  final $Res Function(_SiteRevisionsResponseModel) _then;

/// Create a copy of SiteRevisionsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_SiteRevisionsResponseModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SiteRevisionModel>,
  ));
}


}

// dart format on

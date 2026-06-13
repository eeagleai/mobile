// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clickable_page_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClickablePageLink {

 String get path; String get url;
/// Create a copy of ClickablePageLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClickablePageLinkCopyWith<ClickablePageLink> get copyWith => _$ClickablePageLinkCopyWithImpl<ClickablePageLink>(this as ClickablePageLink, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClickablePageLink&&(identical(other.path, path) || other.path == path)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,path,url);

@override
String toString() {
  return 'ClickablePageLink(path: $path, url: $url)';
}


}

/// @nodoc
abstract mixin class $ClickablePageLinkCopyWith<$Res>  {
  factory $ClickablePageLinkCopyWith(ClickablePageLink value, $Res Function(ClickablePageLink) _then) = _$ClickablePageLinkCopyWithImpl;
@useResult
$Res call({
 String path, String url
});




}
/// @nodoc
class _$ClickablePageLinkCopyWithImpl<$Res>
    implements $ClickablePageLinkCopyWith<$Res> {
  _$ClickablePageLinkCopyWithImpl(this._self, this._then);

  final ClickablePageLink _self;
  final $Res Function(ClickablePageLink) _then;

/// Create a copy of ClickablePageLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? url = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClickablePageLink].
extension ClickablePageLinkPatterns on ClickablePageLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClickablePageLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClickablePageLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClickablePageLink value)  $default,){
final _that = this;
switch (_that) {
case _ClickablePageLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClickablePageLink value)?  $default,){
final _that = this;
switch (_that) {
case _ClickablePageLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClickablePageLink() when $default != null:
return $default(_that.path,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  String url)  $default,) {final _that = this;
switch (_that) {
case _ClickablePageLink():
return $default(_that.path,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  String url)?  $default,) {final _that = this;
switch (_that) {
case _ClickablePageLink() when $default != null:
return $default(_that.path,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _ClickablePageLink implements ClickablePageLink {
  const _ClickablePageLink({required this.path, required this.url});
  

@override final  String path;
@override final  String url;

/// Create a copy of ClickablePageLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClickablePageLinkCopyWith<_ClickablePageLink> get copyWith => __$ClickablePageLinkCopyWithImpl<_ClickablePageLink>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClickablePageLink&&(identical(other.path, path) || other.path == path)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,path,url);

@override
String toString() {
  return 'ClickablePageLink(path: $path, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ClickablePageLinkCopyWith<$Res> implements $ClickablePageLinkCopyWith<$Res> {
  factory _$ClickablePageLinkCopyWith(_ClickablePageLink value, $Res Function(_ClickablePageLink) _then) = __$ClickablePageLinkCopyWithImpl;
@override @useResult
$Res call({
 String path, String url
});




}
/// @nodoc
class __$ClickablePageLinkCopyWithImpl<$Res>
    implements _$ClickablePageLinkCopyWith<$Res> {
  __$ClickablePageLinkCopyWithImpl(this._self, this._then);

  final _ClickablePageLink _self;
  final $Res Function(_ClickablePageLink) _then;

/// Create a copy of ClickablePageLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? url = null,}) {
  return _then(_ClickablePageLink(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

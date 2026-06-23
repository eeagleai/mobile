// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_preview_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SitePreviewAction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SitePreviewAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SitePreviewAction()';
}


}

/// @nodoc
class $SitePreviewActionCopyWith<$Res>  {
$SitePreviewActionCopyWith(SitePreviewAction _, $Res Function(SitePreviewAction) __);
}


/// Adds pattern-matching-related methods to [SitePreviewAction].
extension SitePreviewActionPatterns on SitePreviewAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SitePreviewActionOpen value)?  open,TResult Function( SitePreviewActionChoose value)?  choose,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SitePreviewActionOpen() when open != null:
return open(_that);case SitePreviewActionChoose() when choose != null:
return choose(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SitePreviewActionOpen value)  open,required TResult Function( SitePreviewActionChoose value)  choose,}){
final _that = this;
switch (_that) {
case SitePreviewActionOpen():
return open(_that);case SitePreviewActionChoose():
return choose(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SitePreviewActionOpen value)?  open,TResult? Function( SitePreviewActionChoose value)?  choose,}){
final _that = this;
switch (_that) {
case SitePreviewActionOpen() when open != null:
return open(_that);case SitePreviewActionChoose() when choose != null:
return choose(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String url)?  open,TResult Function( List<String> urls)?  choose,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SitePreviewActionOpen() when open != null:
return open(_that.url);case SitePreviewActionChoose() when choose != null:
return choose(_that.urls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String url)  open,required TResult Function( List<String> urls)  choose,}) {final _that = this;
switch (_that) {
case SitePreviewActionOpen():
return open(_that.url);case SitePreviewActionChoose():
return choose(_that.urls);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String url)?  open,TResult? Function( List<String> urls)?  choose,}) {final _that = this;
switch (_that) {
case SitePreviewActionOpen() when open != null:
return open(_that.url);case SitePreviewActionChoose() when choose != null:
return choose(_that.urls);case _:
  return null;

}
}

}

/// @nodoc


class SitePreviewActionOpen implements SitePreviewAction {
  const SitePreviewActionOpen({required this.url});
  

 final  String url;

/// Create a copy of SitePreviewAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SitePreviewActionOpenCopyWith<SitePreviewActionOpen> get copyWith => _$SitePreviewActionOpenCopyWithImpl<SitePreviewActionOpen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SitePreviewActionOpen&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'SitePreviewAction.open(url: $url)';
}


}

/// @nodoc
abstract mixin class $SitePreviewActionOpenCopyWith<$Res> implements $SitePreviewActionCopyWith<$Res> {
  factory $SitePreviewActionOpenCopyWith(SitePreviewActionOpen value, $Res Function(SitePreviewActionOpen) _then) = _$SitePreviewActionOpenCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$SitePreviewActionOpenCopyWithImpl<$Res>
    implements $SitePreviewActionOpenCopyWith<$Res> {
  _$SitePreviewActionOpenCopyWithImpl(this._self, this._then);

  final SitePreviewActionOpen _self;
  final $Res Function(SitePreviewActionOpen) _then;

/// Create a copy of SitePreviewAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(SitePreviewActionOpen(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SitePreviewActionChoose implements SitePreviewAction {
  const SitePreviewActionChoose({required final  List<String> urls}): _urls = urls;
  

 final  List<String> _urls;
 List<String> get urls {
  if (_urls is EqualUnmodifiableListView) return _urls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_urls);
}


/// Create a copy of SitePreviewAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SitePreviewActionChooseCopyWith<SitePreviewActionChoose> get copyWith => _$SitePreviewActionChooseCopyWithImpl<SitePreviewActionChoose>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SitePreviewActionChoose&&const DeepCollectionEquality().equals(other._urls, _urls));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_urls));

@override
String toString() {
  return 'SitePreviewAction.choose(urls: $urls)';
}


}

/// @nodoc
abstract mixin class $SitePreviewActionChooseCopyWith<$Res> implements $SitePreviewActionCopyWith<$Res> {
  factory $SitePreviewActionChooseCopyWith(SitePreviewActionChoose value, $Res Function(SitePreviewActionChoose) _then) = _$SitePreviewActionChooseCopyWithImpl;
@useResult
$Res call({
 List<String> urls
});




}
/// @nodoc
class _$SitePreviewActionChooseCopyWithImpl<$Res>
    implements $SitePreviewActionChooseCopyWith<$Res> {
  _$SitePreviewActionChooseCopyWithImpl(this._self, this._then);

  final SitePreviewActionChoose _self;
  final $Res Function(SitePreviewActionChoose) _then;

/// Create a copy of SitePreviewAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? urls = null,}) {
  return _then(SitePreviewActionChoose(
urls: null == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

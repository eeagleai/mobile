// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bootstrap_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthBootstrapEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthBootstrapEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBootstrapEvent()';
}


}

/// @nodoc
class $AuthBootstrapEventCopyWith<$Res>  {
$AuthBootstrapEventCopyWith(AuthBootstrapEvent _, $Res Function(AuthBootstrapEvent) __);
}


/// Adds pattern-matching-related methods to [AuthBootstrapEvent].
extension AuthBootstrapEventPatterns on AuthBootstrapEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,}) {final _that = this;
switch (_that) {
case _Started():
return started();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AuthBootstrapEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthBootstrapEvent.started()';
}


}




/// @nodoc
mixin _$AuthBootstrapState {

 bool get isChecking; bool get isAuthenticated;
/// Create a copy of AuthBootstrapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthBootstrapStateCopyWith<AuthBootstrapState> get copyWith => _$AuthBootstrapStateCopyWithImpl<AuthBootstrapState>(this as AuthBootstrapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthBootstrapState&&(identical(other.isChecking, isChecking) || other.isChecking == isChecking)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated));
}


@override
int get hashCode => Object.hash(runtimeType,isChecking,isAuthenticated);

@override
String toString() {
  return 'AuthBootstrapState(isChecking: $isChecking, isAuthenticated: $isAuthenticated)';
}


}

/// @nodoc
abstract mixin class $AuthBootstrapStateCopyWith<$Res>  {
  factory $AuthBootstrapStateCopyWith(AuthBootstrapState value, $Res Function(AuthBootstrapState) _then) = _$AuthBootstrapStateCopyWithImpl;
@useResult
$Res call({
 bool isChecking, bool isAuthenticated
});




}
/// @nodoc
class _$AuthBootstrapStateCopyWithImpl<$Res>
    implements $AuthBootstrapStateCopyWith<$Res> {
  _$AuthBootstrapStateCopyWithImpl(this._self, this._then);

  final AuthBootstrapState _self;
  final $Res Function(AuthBootstrapState) _then;

/// Create a copy of AuthBootstrapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isChecking = null,Object? isAuthenticated = null,}) {
  return _then(_self.copyWith(
isChecking: null == isChecking ? _self.isChecking : isChecking // ignore: cast_nullable_to_non_nullable
as bool,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthBootstrapState].
extension AuthBootstrapStatePatterns on AuthBootstrapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthBootstrapState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthBootstrapState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthBootstrapState value)  $default,){
final _that = this;
switch (_that) {
case _AuthBootstrapState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthBootstrapState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthBootstrapState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isChecking,  bool isAuthenticated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthBootstrapState() when $default != null:
return $default(_that.isChecking,_that.isAuthenticated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isChecking,  bool isAuthenticated)  $default,) {final _that = this;
switch (_that) {
case _AuthBootstrapState():
return $default(_that.isChecking,_that.isAuthenticated);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isChecking,  bool isAuthenticated)?  $default,) {final _that = this;
switch (_that) {
case _AuthBootstrapState() when $default != null:
return $default(_that.isChecking,_that.isAuthenticated);case _:
  return null;

}
}

}

/// @nodoc


class _AuthBootstrapState implements AuthBootstrapState {
  const _AuthBootstrapState({this.isChecking = true, this.isAuthenticated = false});
  

@override@JsonKey() final  bool isChecking;
@override@JsonKey() final  bool isAuthenticated;

/// Create a copy of AuthBootstrapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthBootstrapStateCopyWith<_AuthBootstrapState> get copyWith => __$AuthBootstrapStateCopyWithImpl<_AuthBootstrapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthBootstrapState&&(identical(other.isChecking, isChecking) || other.isChecking == isChecking)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated));
}


@override
int get hashCode => Object.hash(runtimeType,isChecking,isAuthenticated);

@override
String toString() {
  return 'AuthBootstrapState(isChecking: $isChecking, isAuthenticated: $isAuthenticated)';
}


}

/// @nodoc
abstract mixin class _$AuthBootstrapStateCopyWith<$Res> implements $AuthBootstrapStateCopyWith<$Res> {
  factory _$AuthBootstrapStateCopyWith(_AuthBootstrapState value, $Res Function(_AuthBootstrapState) _then) = __$AuthBootstrapStateCopyWithImpl;
@override @useResult
$Res call({
 bool isChecking, bool isAuthenticated
});




}
/// @nodoc
class __$AuthBootstrapStateCopyWithImpl<$Res>
    implements _$AuthBootstrapStateCopyWith<$Res> {
  __$AuthBootstrapStateCopyWithImpl(this._self, this._then);

  final _AuthBootstrapState _self;
  final $Res Function(_AuthBootstrapState) _then;

/// Create a copy of AuthBootstrapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isChecking = null,Object? isAuthenticated = null,}) {
  return _then(_AuthBootstrapState(
isChecking: null == isChecking ? _self.isChecking : isChecking // ignore: cast_nullable_to_non_nullable
as bool,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

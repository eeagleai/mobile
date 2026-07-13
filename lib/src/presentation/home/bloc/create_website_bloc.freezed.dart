// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_website_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateWebsiteEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWebsiteEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateWebsiteEvent()';
}


}

/// @nodoc
class $CreateWebsiteEventCopyWith<$Res>  {
$CreateWebsiteEventCopyWith(CreateWebsiteEvent _, $Res Function(CreateWebsiteEvent) __);
}


/// Adds pattern-matching-related methods to [CreateWebsiteEvent].
extension CreateWebsiteEventPatterns on CreateWebsiteEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PromptChanged value)?  promptChanged,TResult Function( _Submitted value)?  submitted,TResult Function( _PollRequested value)?  pollRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptChanged() when promptChanged != null:
return promptChanged(_that);case _Submitted() when submitted != null:
return submitted(_that);case _PollRequested() when pollRequested != null:
return pollRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PromptChanged value)  promptChanged,required TResult Function( _Submitted value)  submitted,required TResult Function( _PollRequested value)  pollRequested,}){
final _that = this;
switch (_that) {
case _PromptChanged():
return promptChanged(_that);case _Submitted():
return submitted(_that);case _PollRequested():
return pollRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PromptChanged value)?  promptChanged,TResult? Function( _Submitted value)?  submitted,TResult? Function( _PollRequested value)?  pollRequested,}){
final _that = this;
switch (_that) {
case _PromptChanged() when promptChanged != null:
return promptChanged(_that);case _Submitted() when submitted != null:
return submitted(_that);case _PollRequested() when pollRequested != null:
return pollRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String value)?  promptChanged,TResult Function()?  submitted,TResult Function()?  pollRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptChanged() when promptChanged != null:
return promptChanged(_that.value);case _Submitted() when submitted != null:
return submitted();case _PollRequested() when pollRequested != null:
return pollRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String value)  promptChanged,required TResult Function()  submitted,required TResult Function()  pollRequested,}) {final _that = this;
switch (_that) {
case _PromptChanged():
return promptChanged(_that.value);case _Submitted():
return submitted();case _PollRequested():
return pollRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String value)?  promptChanged,TResult? Function()?  submitted,TResult? Function()?  pollRequested,}) {final _that = this;
switch (_that) {
case _PromptChanged() when promptChanged != null:
return promptChanged(_that.value);case _Submitted() when submitted != null:
return submitted();case _PollRequested() when pollRequested != null:
return pollRequested();case _:
  return null;

}
}

}

/// @nodoc


class _PromptChanged implements CreateWebsiteEvent {
  const _PromptChanged(this.value);
  

 final  String value;

/// Create a copy of CreateWebsiteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptChangedCopyWith<_PromptChanged> get copyWith => __$PromptChangedCopyWithImpl<_PromptChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'CreateWebsiteEvent.promptChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$PromptChangedCopyWith<$Res> implements $CreateWebsiteEventCopyWith<$Res> {
  factory _$PromptChangedCopyWith(_PromptChanged value, $Res Function(_PromptChanged) _then) = __$PromptChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$PromptChangedCopyWithImpl<$Res>
    implements _$PromptChangedCopyWith<$Res> {
  __$PromptChangedCopyWithImpl(this._self, this._then);

  final _PromptChanged _self;
  final $Res Function(_PromptChanged) _then;

/// Create a copy of CreateWebsiteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_PromptChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Submitted implements CreateWebsiteEvent {
  const _Submitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateWebsiteEvent.submitted()';
}


}




/// @nodoc


class _PollRequested implements CreateWebsiteEvent {
  const _PollRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PollRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateWebsiteEvent.pollRequested()';
}


}




/// @nodoc
mixin _$CreateWebsiteState {

 String get prompt; bool get isBuilding; bool get isComplete; WebsiteBuildStatus? get build; String? get errorMessage;
/// Create a copy of CreateWebsiteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWebsiteStateCopyWith<CreateWebsiteState> get copyWith => _$CreateWebsiteStateCopyWithImpl<CreateWebsiteState>(this as CreateWebsiteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWebsiteState&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.isBuilding, isBuilding) || other.isBuilding == isBuilding)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete)&&(identical(other.build, build) || other.build == build)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,prompt,isBuilding,isComplete,build,errorMessage);

@override
String toString() {
  return 'CreateWebsiteState(prompt: $prompt, isBuilding: $isBuilding, isComplete: $isComplete, build: $build, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CreateWebsiteStateCopyWith<$Res>  {
  factory $CreateWebsiteStateCopyWith(CreateWebsiteState value, $Res Function(CreateWebsiteState) _then) = _$CreateWebsiteStateCopyWithImpl;
@useResult
$Res call({
 String prompt, bool isBuilding, bool isComplete, WebsiteBuildStatus? build, String? errorMessage
});




}
/// @nodoc
class _$CreateWebsiteStateCopyWithImpl<$Res>
    implements $CreateWebsiteStateCopyWith<$Res> {
  _$CreateWebsiteStateCopyWithImpl(this._self, this._then);

  final CreateWebsiteState _self;
  final $Res Function(CreateWebsiteState) _then;

/// Create a copy of CreateWebsiteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prompt = null,Object? isBuilding = null,Object? isComplete = null,Object? build = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,isBuilding: null == isBuilding ? _self.isBuilding : isBuilding // ignore: cast_nullable_to_non_nullable
as bool,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,build: freezed == build ? _self.build : build // ignore: cast_nullable_to_non_nullable
as WebsiteBuildStatus?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateWebsiteState].
extension CreateWebsiteStatePatterns on CreateWebsiteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateWebsiteState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateWebsiteState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateWebsiteState value)  $default,){
final _that = this;
switch (_that) {
case _CreateWebsiteState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateWebsiteState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateWebsiteState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String prompt,  bool isBuilding,  bool isComplete,  WebsiteBuildStatus? build,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateWebsiteState() when $default != null:
return $default(_that.prompt,_that.isBuilding,_that.isComplete,_that.build,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String prompt,  bool isBuilding,  bool isComplete,  WebsiteBuildStatus? build,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CreateWebsiteState():
return $default(_that.prompt,_that.isBuilding,_that.isComplete,_that.build,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String prompt,  bool isBuilding,  bool isComplete,  WebsiteBuildStatus? build,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CreateWebsiteState() when $default != null:
return $default(_that.prompt,_that.isBuilding,_that.isComplete,_that.build,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CreateWebsiteState implements CreateWebsiteState {
  const _CreateWebsiteState({this.prompt = '', this.isBuilding = false, this.isComplete = false, this.build, this.errorMessage});
  

@override@JsonKey() final  String prompt;
@override@JsonKey() final  bool isBuilding;
@override@JsonKey() final  bool isComplete;
@override final  WebsiteBuildStatus? build;
@override final  String? errorMessage;

/// Create a copy of CreateWebsiteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateWebsiteStateCopyWith<_CreateWebsiteState> get copyWith => __$CreateWebsiteStateCopyWithImpl<_CreateWebsiteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateWebsiteState&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.isBuilding, isBuilding) || other.isBuilding == isBuilding)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete)&&(identical(other.build, build) || other.build == build)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,prompt,isBuilding,isComplete,build,errorMessage);

@override
String toString() {
  return 'CreateWebsiteState(prompt: $prompt, isBuilding: $isBuilding, isComplete: $isComplete, build: $build, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CreateWebsiteStateCopyWith<$Res> implements $CreateWebsiteStateCopyWith<$Res> {
  factory _$CreateWebsiteStateCopyWith(_CreateWebsiteState value, $Res Function(_CreateWebsiteState) _then) = __$CreateWebsiteStateCopyWithImpl;
@override @useResult
$Res call({
 String prompt, bool isBuilding, bool isComplete, WebsiteBuildStatus? build, String? errorMessage
});




}
/// @nodoc
class __$CreateWebsiteStateCopyWithImpl<$Res>
    implements _$CreateWebsiteStateCopyWith<$Res> {
  __$CreateWebsiteStateCopyWithImpl(this._self, this._then);

  final _CreateWebsiteState _self;
  final $Res Function(_CreateWebsiteState) _then;

/// Create a copy of CreateWebsiteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prompt = null,Object? isBuilding = null,Object? isComplete = null,Object? build = freezed,Object? errorMessage = freezed,}) {
  return _then(_CreateWebsiteState(
prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,isBuilding: null == isBuilding ? _self.isBuilding : isBuilding // ignore: cast_nullable_to_non_nullable
as bool,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,build: freezed == build ? _self.build : build // ignore: cast_nullable_to_non_nullable
as WebsiteBuildStatus?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

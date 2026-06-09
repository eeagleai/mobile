// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_inbound_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatInboundEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInboundEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatInboundEvent()';
}


}

/// @nodoc
class $ChatInboundEventCopyWith<$Res>  {
$ChatInboundEventCopyWith(ChatInboundEvent _, $Res Function(ChatInboundEvent) __);
}


/// Adds pattern-matching-related methods to [ChatInboundEvent].
extension ChatInboundEventPatterns on ChatInboundEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatInboundStatusEvent value)?  status,TResult Function( ChatInboundMessageEvent value)?  message,TResult Function( ChatInboundAssistantFinishedEvent value)?  assistantFinished,TResult Function( ChatInboundErrorEvent value)?  error,TResult Function( ChatInboundPongEvent value)?  pong,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatInboundStatusEvent() when status != null:
return status(_that);case ChatInboundMessageEvent() when message != null:
return message(_that);case ChatInboundAssistantFinishedEvent() when assistantFinished != null:
return assistantFinished(_that);case ChatInboundErrorEvent() when error != null:
return error(_that);case ChatInboundPongEvent() when pong != null:
return pong(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatInboundStatusEvent value)  status,required TResult Function( ChatInboundMessageEvent value)  message,required TResult Function( ChatInboundAssistantFinishedEvent value)  assistantFinished,required TResult Function( ChatInboundErrorEvent value)  error,required TResult Function( ChatInboundPongEvent value)  pong,}){
final _that = this;
switch (_that) {
case ChatInboundStatusEvent():
return status(_that);case ChatInboundMessageEvent():
return message(_that);case ChatInboundAssistantFinishedEvent():
return assistantFinished(_that);case ChatInboundErrorEvent():
return error(_that);case ChatInboundPongEvent():
return pong(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatInboundStatusEvent value)?  status,TResult? Function( ChatInboundMessageEvent value)?  message,TResult? Function( ChatInboundAssistantFinishedEvent value)?  assistantFinished,TResult? Function( ChatInboundErrorEvent value)?  error,TResult? Function( ChatInboundPongEvent value)?  pong,}){
final _that = this;
switch (_that) {
case ChatInboundStatusEvent() when status != null:
return status(_that);case ChatInboundMessageEvent() when message != null:
return message(_that);case ChatInboundAssistantFinishedEvent() when assistantFinished != null:
return assistantFinished(_that);case ChatInboundErrorEvent() when error != null:
return error(_that);case ChatInboundPongEvent() when pong != null:
return pong(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String state)?  status,TResult Function( ChatMessageRole role,  String content)?  message,TResult Function()?  assistantFinished,TResult Function( String error,  String? detail)?  error,TResult Function()?  pong,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatInboundStatusEvent() when status != null:
return status(_that.state);case ChatInboundMessageEvent() when message != null:
return message(_that.role,_that.content);case ChatInboundAssistantFinishedEvent() when assistantFinished != null:
return assistantFinished();case ChatInboundErrorEvent() when error != null:
return error(_that.error,_that.detail);case ChatInboundPongEvent() when pong != null:
return pong();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String state)  status,required TResult Function( ChatMessageRole role,  String content)  message,required TResult Function()  assistantFinished,required TResult Function( String error,  String? detail)  error,required TResult Function()  pong,}) {final _that = this;
switch (_that) {
case ChatInboundStatusEvent():
return status(_that.state);case ChatInboundMessageEvent():
return message(_that.role,_that.content);case ChatInboundAssistantFinishedEvent():
return assistantFinished();case ChatInboundErrorEvent():
return error(_that.error,_that.detail);case ChatInboundPongEvent():
return pong();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String state)?  status,TResult? Function( ChatMessageRole role,  String content)?  message,TResult? Function()?  assistantFinished,TResult? Function( String error,  String? detail)?  error,TResult? Function()?  pong,}) {final _that = this;
switch (_that) {
case ChatInboundStatusEvent() when status != null:
return status(_that.state);case ChatInboundMessageEvent() when message != null:
return message(_that.role,_that.content);case ChatInboundAssistantFinishedEvent() when assistantFinished != null:
return assistantFinished();case ChatInboundErrorEvent() when error != null:
return error(_that.error,_that.detail);case ChatInboundPongEvent() when pong != null:
return pong();case _:
  return null;

}
}

}

/// @nodoc


class ChatInboundStatusEvent implements ChatInboundEvent {
  const ChatInboundStatusEvent({required this.state});
  

 final  String state;

/// Create a copy of ChatInboundEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatInboundStatusEventCopyWith<ChatInboundStatusEvent> get copyWith => _$ChatInboundStatusEventCopyWithImpl<ChatInboundStatusEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInboundStatusEvent&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString() {
  return 'ChatInboundEvent.status(state: $state)';
}


}

/// @nodoc
abstract mixin class $ChatInboundStatusEventCopyWith<$Res> implements $ChatInboundEventCopyWith<$Res> {
  factory $ChatInboundStatusEventCopyWith(ChatInboundStatusEvent value, $Res Function(ChatInboundStatusEvent) _then) = _$ChatInboundStatusEventCopyWithImpl;
@useResult
$Res call({
 String state
});




}
/// @nodoc
class _$ChatInboundStatusEventCopyWithImpl<$Res>
    implements $ChatInboundStatusEventCopyWith<$Res> {
  _$ChatInboundStatusEventCopyWithImpl(this._self, this._then);

  final ChatInboundStatusEvent _self;
  final $Res Function(ChatInboundStatusEvent) _then;

/// Create a copy of ChatInboundEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(ChatInboundStatusEvent(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatInboundMessageEvent implements ChatInboundEvent {
  const ChatInboundMessageEvent({required this.role, required this.content});
  

 final  ChatMessageRole role;
 final  String content;

/// Create a copy of ChatInboundEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatInboundMessageEventCopyWith<ChatInboundMessageEvent> get copyWith => _$ChatInboundMessageEventCopyWithImpl<ChatInboundMessageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInboundMessageEvent&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'ChatInboundEvent.message(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class $ChatInboundMessageEventCopyWith<$Res> implements $ChatInboundEventCopyWith<$Res> {
  factory $ChatInboundMessageEventCopyWith(ChatInboundMessageEvent value, $Res Function(ChatInboundMessageEvent) _then) = _$ChatInboundMessageEventCopyWithImpl;
@useResult
$Res call({
 ChatMessageRole role, String content
});




}
/// @nodoc
class _$ChatInboundMessageEventCopyWithImpl<$Res>
    implements $ChatInboundMessageEventCopyWith<$Res> {
  _$ChatInboundMessageEventCopyWithImpl(this._self, this._then);

  final ChatInboundMessageEvent _self;
  final $Res Function(ChatInboundMessageEvent) _then;

/// Create a copy of ChatInboundEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = null,}) {
  return _then(ChatInboundMessageEvent(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatMessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatInboundAssistantFinishedEvent implements ChatInboundEvent {
  const ChatInboundAssistantFinishedEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInboundAssistantFinishedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatInboundEvent.assistantFinished()';
}


}




/// @nodoc


class ChatInboundErrorEvent implements ChatInboundEvent {
  const ChatInboundErrorEvent({required this.error, this.detail});
  

 final  String error;
 final  String? detail;

/// Create a copy of ChatInboundEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatInboundErrorEventCopyWith<ChatInboundErrorEvent> get copyWith => _$ChatInboundErrorEventCopyWithImpl<ChatInboundErrorEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInboundErrorEvent&&(identical(other.error, error) || other.error == error)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,error,detail);

@override
String toString() {
  return 'ChatInboundEvent.error(error: $error, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $ChatInboundErrorEventCopyWith<$Res> implements $ChatInboundEventCopyWith<$Res> {
  factory $ChatInboundErrorEventCopyWith(ChatInboundErrorEvent value, $Res Function(ChatInboundErrorEvent) _then) = _$ChatInboundErrorEventCopyWithImpl;
@useResult
$Res call({
 String error, String? detail
});




}
/// @nodoc
class _$ChatInboundErrorEventCopyWithImpl<$Res>
    implements $ChatInboundErrorEventCopyWith<$Res> {
  _$ChatInboundErrorEventCopyWithImpl(this._self, this._then);

  final ChatInboundErrorEvent _self;
  final $Res Function(ChatInboundErrorEvent) _then;

/// Create a copy of ChatInboundEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? detail = freezed,}) {
  return _then(ChatInboundErrorEvent(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ChatInboundPongEvent implements ChatInboundEvent {
  const ChatInboundPongEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInboundPongEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatInboundEvent.pong()';
}


}




// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_conversation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiveConversationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveConversationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LiveConversationEvent()';
}


}

/// @nodoc
class $LiveConversationEventCopyWith<$Res>  {
$LiveConversationEventCopyWith(LiveConversationEvent _, $Res Function(LiveConversationEvent) __);
}


/// Adds pattern-matching-related methods to [LiveConversationEvent].
extension LiveConversationEventPatterns on LiveConversationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _ConnectSocketRequested value)?  connectSocketRequested,TResult Function( _SocketMessageReceived value)?  socketMessageReceived,TResult Function( _MessageSent value)?  messageSent,TResult Function( _MessageRetried value)?  messageRetried,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that);case _MessageSent() when messageSent != null:
return messageSent(_that);case _MessageRetried() when messageRetried != null:
return messageRetried(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _ConnectSocketRequested value)  connectSocketRequested,required TResult Function( _SocketMessageReceived value)  socketMessageReceived,required TResult Function( _MessageSent value)  messageSent,required TResult Function( _MessageRetried value)  messageRetried,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _ConnectSocketRequested():
return connectSocketRequested(_that);case _SocketMessageReceived():
return socketMessageReceived(_that);case _MessageSent():
return messageSent(_that);case _MessageRetried():
return messageRetried(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _ConnectSocketRequested value)?  connectSocketRequested,TResult? Function( _SocketMessageReceived value)?  socketMessageReceived,TResult? Function( _MessageSent value)?  messageSent,TResult? Function( _MessageRetried value)?  messageRetried,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that);case _MessageSent() when messageSent != null:
return messageSent(_that);case _MessageRetried() when messageRetried != null:
return messageRetried(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String apikey,  String conversationId,  String? seedMessage,  DateTime? seedCreatedAt)?  started,TResult Function( bool isReconnect)?  connectSocketRequested,TResult Function( AnalyticsSocketMessage message)?  socketMessageReceived,TResult Function( String text)?  messageSent,TResult Function( String localId)?  messageRetried,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.apikey,_that.conversationId,_that.seedMessage,_that.seedCreatedAt);case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that.isReconnect);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that.message);case _MessageSent() when messageSent != null:
return messageSent(_that.text);case _MessageRetried() when messageRetried != null:
return messageRetried(_that.localId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String apikey,  String conversationId,  String? seedMessage,  DateTime? seedCreatedAt)  started,required TResult Function( bool isReconnect)  connectSocketRequested,required TResult Function( AnalyticsSocketMessage message)  socketMessageReceived,required TResult Function( String text)  messageSent,required TResult Function( String localId)  messageRetried,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.apikey,_that.conversationId,_that.seedMessage,_that.seedCreatedAt);case _ConnectSocketRequested():
return connectSocketRequested(_that.isReconnect);case _SocketMessageReceived():
return socketMessageReceived(_that.message);case _MessageSent():
return messageSent(_that.text);case _MessageRetried():
return messageRetried(_that.localId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String apikey,  String conversationId,  String? seedMessage,  DateTime? seedCreatedAt)?  started,TResult? Function( bool isReconnect)?  connectSocketRequested,TResult? Function( AnalyticsSocketMessage message)?  socketMessageReceived,TResult? Function( String text)?  messageSent,TResult? Function( String localId)?  messageRetried,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.apikey,_that.conversationId,_that.seedMessage,_that.seedCreatedAt);case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that.isReconnect);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that.message);case _MessageSent() when messageSent != null:
return messageSent(_that.text);case _MessageRetried() when messageRetried != null:
return messageRetried(_that.localId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LiveConversationEvent {
  const _Started({required this.apikey, required this.conversationId, this.seedMessage, this.seedCreatedAt});
  

 final  String apikey;
 final  String conversationId;
 final  String? seedMessage;
 final  DateTime? seedCreatedAt;

/// Create a copy of LiveConversationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.seedMessage, seedMessage) || other.seedMessage == seedMessage)&&(identical(other.seedCreatedAt, seedCreatedAt) || other.seedCreatedAt == seedCreatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,apikey,conversationId,seedMessage,seedCreatedAt);

@override
String toString() {
  return 'LiveConversationEvent.started(apikey: $apikey, conversationId: $conversationId, seedMessage: $seedMessage, seedCreatedAt: $seedCreatedAt)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $LiveConversationEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String apikey, String conversationId, String? seedMessage, DateTime? seedCreatedAt
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of LiveConversationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apikey = null,Object? conversationId = null,Object? seedMessage = freezed,Object? seedCreatedAt = freezed,}) {
  return _then(_Started(
apikey: null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,seedMessage: freezed == seedMessage ? _self.seedMessage : seedMessage // ignore: cast_nullable_to_non_nullable
as String?,seedCreatedAt: freezed == seedCreatedAt ? _self.seedCreatedAt : seedCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _ConnectSocketRequested implements LiveConversationEvent {
  const _ConnectSocketRequested({this.isReconnect = false});
  

@JsonKey() final  bool isReconnect;

/// Create a copy of LiveConversationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectSocketRequestedCopyWith<_ConnectSocketRequested> get copyWith => __$ConnectSocketRequestedCopyWithImpl<_ConnectSocketRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectSocketRequested&&(identical(other.isReconnect, isReconnect) || other.isReconnect == isReconnect));
}


@override
int get hashCode => Object.hash(runtimeType,isReconnect);

@override
String toString() {
  return 'LiveConversationEvent.connectSocketRequested(isReconnect: $isReconnect)';
}


}

/// @nodoc
abstract mixin class _$ConnectSocketRequestedCopyWith<$Res> implements $LiveConversationEventCopyWith<$Res> {
  factory _$ConnectSocketRequestedCopyWith(_ConnectSocketRequested value, $Res Function(_ConnectSocketRequested) _then) = __$ConnectSocketRequestedCopyWithImpl;
@useResult
$Res call({
 bool isReconnect
});




}
/// @nodoc
class __$ConnectSocketRequestedCopyWithImpl<$Res>
    implements _$ConnectSocketRequestedCopyWith<$Res> {
  __$ConnectSocketRequestedCopyWithImpl(this._self, this._then);

  final _ConnectSocketRequested _self;
  final $Res Function(_ConnectSocketRequested) _then;

/// Create a copy of LiveConversationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isReconnect = null,}) {
  return _then(_ConnectSocketRequested(
isReconnect: null == isReconnect ? _self.isReconnect : isReconnect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SocketMessageReceived implements LiveConversationEvent {
  const _SocketMessageReceived(this.message);
  

 final  AnalyticsSocketMessage message;

/// Create a copy of LiveConversationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocketMessageReceivedCopyWith<_SocketMessageReceived> get copyWith => __$SocketMessageReceivedCopyWithImpl<_SocketMessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocketMessageReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LiveConversationEvent.socketMessageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SocketMessageReceivedCopyWith<$Res> implements $LiveConversationEventCopyWith<$Res> {
  factory _$SocketMessageReceivedCopyWith(_SocketMessageReceived value, $Res Function(_SocketMessageReceived) _then) = __$SocketMessageReceivedCopyWithImpl;
@useResult
$Res call({
 AnalyticsSocketMessage message
});




}
/// @nodoc
class __$SocketMessageReceivedCopyWithImpl<$Res>
    implements _$SocketMessageReceivedCopyWith<$Res> {
  __$SocketMessageReceivedCopyWithImpl(this._self, this._then);

  final _SocketMessageReceived _self;
  final $Res Function(_SocketMessageReceived) _then;

/// Create a copy of LiveConversationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SocketMessageReceived(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as AnalyticsSocketMessage,
  ));
}


}

/// @nodoc


class _MessageSent implements LiveConversationEvent {
  const _MessageSent(this.text);
  

 final  String text;

/// Create a copy of LiveConversationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageSentCopyWith<_MessageSent> get copyWith => __$MessageSentCopyWithImpl<_MessageSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageSent&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'LiveConversationEvent.messageSent(text: $text)';
}


}

/// @nodoc
abstract mixin class _$MessageSentCopyWith<$Res> implements $LiveConversationEventCopyWith<$Res> {
  factory _$MessageSentCopyWith(_MessageSent value, $Res Function(_MessageSent) _then) = __$MessageSentCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class __$MessageSentCopyWithImpl<$Res>
    implements _$MessageSentCopyWith<$Res> {
  __$MessageSentCopyWithImpl(this._self, this._then);

  final _MessageSent _self;
  final $Res Function(_MessageSent) _then;

/// Create a copy of LiveConversationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_MessageSent(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MessageRetried implements LiveConversationEvent {
  const _MessageRetried(this.localId);
  

 final  String localId;

/// Create a copy of LiveConversationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageRetriedCopyWith<_MessageRetried> get copyWith => __$MessageRetriedCopyWithImpl<_MessageRetried>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageRetried&&(identical(other.localId, localId) || other.localId == localId));
}


@override
int get hashCode => Object.hash(runtimeType,localId);

@override
String toString() {
  return 'LiveConversationEvent.messageRetried(localId: $localId)';
}


}

/// @nodoc
abstract mixin class _$MessageRetriedCopyWith<$Res> implements $LiveConversationEventCopyWith<$Res> {
  factory _$MessageRetriedCopyWith(_MessageRetried value, $Res Function(_MessageRetried) _then) = __$MessageRetriedCopyWithImpl;
@useResult
$Res call({
 String localId
});




}
/// @nodoc
class __$MessageRetriedCopyWithImpl<$Res>
    implements _$MessageRetriedCopyWith<$Res> {
  __$MessageRetriedCopyWithImpl(this._self, this._then);

  final _MessageRetried _self;
  final $Res Function(_MessageRetried) _then;

/// Create a copy of LiveConversationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? localId = null,}) {
  return _then(_MessageRetried(
null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LiveConversationState {

 AnalyticsConnectionStatus get status; List<LiveChatMessage> get messages; String? get errorMessage;
/// Create a copy of LiveConversationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveConversationStateCopyWith<LiveConversationState> get copyWith => _$LiveConversationStateCopyWithImpl<LiveConversationState>(this as LiveConversationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveConversationState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(messages),errorMessage);

@override
String toString() {
  return 'LiveConversationState(status: $status, messages: $messages, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LiveConversationStateCopyWith<$Res>  {
  factory $LiveConversationStateCopyWith(LiveConversationState value, $Res Function(LiveConversationState) _then) = _$LiveConversationStateCopyWithImpl;
@useResult
$Res call({
 AnalyticsConnectionStatus status, List<LiveChatMessage> messages, String? errorMessage
});




}
/// @nodoc
class _$LiveConversationStateCopyWithImpl<$Res>
    implements $LiveConversationStateCopyWith<$Res> {
  _$LiveConversationStateCopyWithImpl(this._self, this._then);

  final LiveConversationState _self;
  final $Res Function(LiveConversationState) _then;

/// Create a copy of LiveConversationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? messages = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsConnectionStatus,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<LiveChatMessage>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveConversationState].
extension LiveConversationStatePatterns on LiveConversationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveConversationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveConversationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveConversationState value)  $default,){
final _that = this;
switch (_that) {
case _LiveConversationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveConversationState value)?  $default,){
final _that = this;
switch (_that) {
case _LiveConversationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnalyticsConnectionStatus status,  List<LiveChatMessage> messages,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveConversationState() when $default != null:
return $default(_that.status,_that.messages,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnalyticsConnectionStatus status,  List<LiveChatMessage> messages,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LiveConversationState():
return $default(_that.status,_that.messages,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnalyticsConnectionStatus status,  List<LiveChatMessage> messages,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LiveConversationState() when $default != null:
return $default(_that.status,_that.messages,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LiveConversationState implements LiveConversationState {
  const _LiveConversationState({this.status = AnalyticsConnectionStatus.offline, final  List<LiveChatMessage> messages = const <LiveChatMessage>[], this.errorMessage}): _messages = messages;
  

@override@JsonKey() final  AnalyticsConnectionStatus status;
 final  List<LiveChatMessage> _messages;
@override@JsonKey() List<LiveChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  String? errorMessage;

/// Create a copy of LiveConversationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveConversationStateCopyWith<_LiveConversationState> get copyWith => __$LiveConversationStateCopyWithImpl<_LiveConversationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveConversationState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_messages),errorMessage);

@override
String toString() {
  return 'LiveConversationState(status: $status, messages: $messages, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LiveConversationStateCopyWith<$Res> implements $LiveConversationStateCopyWith<$Res> {
  factory _$LiveConversationStateCopyWith(_LiveConversationState value, $Res Function(_LiveConversationState) _then) = __$LiveConversationStateCopyWithImpl;
@override @useResult
$Res call({
 AnalyticsConnectionStatus status, List<LiveChatMessage> messages, String? errorMessage
});




}
/// @nodoc
class __$LiveConversationStateCopyWithImpl<$Res>
    implements _$LiveConversationStateCopyWith<$Res> {
  __$LiveConversationStateCopyWithImpl(this._self, this._then);

  final _LiveConversationState _self;
  final $Res Function(_LiveConversationState) _then;

/// Create a copy of LiveConversationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? messages = null,Object? errorMessage = freezed,}) {
  return _then(_LiveConversationState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsConnectionStatus,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<LiveChatMessage>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

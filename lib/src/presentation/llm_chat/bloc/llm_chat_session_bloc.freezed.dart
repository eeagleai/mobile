// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'llm_chat_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LlmChatSessionEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LlmChatSessionEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LlmChatSessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LlmChatSessionEvent()';
}


}

/// @nodoc
class $LlmChatSessionEventCopyWith<$Res>  {
$LlmChatSessionEventCopyWith(LlmChatSessionEvent _, $Res Function(LlmChatSessionEvent) __);
}


/// Adds pattern-matching-related methods to [LlmChatSessionEvent].
extension LlmChatSessionEventPatterns on LlmChatSessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _MessageSent value)?  messageSent,TResult Function( _InboundEventReceived value)?  inboundEventReceived,TResult Function( _Disposed value)?  disposed,TResult Function( _PreviewActionConsumed value)?  previewActionConsumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _MessageSent() when messageSent != null:
return messageSent(_that);case _InboundEventReceived() when inboundEventReceived != null:
return inboundEventReceived(_that);case _Disposed() when disposed != null:
return disposed(_that);case _PreviewActionConsumed() when previewActionConsumed != null:
return previewActionConsumed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _MessageSent value)  messageSent,required TResult Function( _InboundEventReceived value)  inboundEventReceived,required TResult Function( _Disposed value)  disposed,required TResult Function( _PreviewActionConsumed value)  previewActionConsumed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _MessageSent():
return messageSent(_that);case _InboundEventReceived():
return inboundEventReceived(_that);case _Disposed():
return disposed(_that);case _PreviewActionConsumed():
return previewActionConsumed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _MessageSent value)?  messageSent,TResult? Function( _InboundEventReceived value)?  inboundEventReceived,TResult? Function( _Disposed value)?  disposed,TResult? Function( _PreviewActionConsumed value)?  previewActionConsumed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _MessageSent() when messageSent != null:
return messageSent(_that);case _InboundEventReceived() when inboundEventReceived != null:
return inboundEventReceived(_that);case _Disposed() when disposed != null:
return disposed(_that);case _PreviewActionConsumed() when previewActionConsumed != null:
return previewActionConsumed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Site site)?  started,TResult Function( String text)?  messageSent,TResult Function( ChatInboundEvent event)?  inboundEventReceived,TResult Function()?  disposed,TResult Function()?  previewActionConsumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.site);case _MessageSent() when messageSent != null:
return messageSent(_that.text);case _InboundEventReceived() when inboundEventReceived != null:
return inboundEventReceived(_that.event);case _Disposed() when disposed != null:
return disposed();case _PreviewActionConsumed() when previewActionConsumed != null:
return previewActionConsumed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Site site)  started,required TResult Function( String text)  messageSent,required TResult Function( ChatInboundEvent event)  inboundEventReceived,required TResult Function()  disposed,required TResult Function()  previewActionConsumed,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.site);case _MessageSent():
return messageSent(_that.text);case _InboundEventReceived():
return inboundEventReceived(_that.event);case _Disposed():
return disposed();case _PreviewActionConsumed():
return previewActionConsumed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Site site)?  started,TResult? Function( String text)?  messageSent,TResult? Function( ChatInboundEvent event)?  inboundEventReceived,TResult? Function()?  disposed,TResult? Function()?  previewActionConsumed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.site);case _MessageSent() when messageSent != null:
return messageSent(_that.text);case _InboundEventReceived() when inboundEventReceived != null:
return inboundEventReceived(_that.event);case _Disposed() when disposed != null:
return disposed();case _PreviewActionConsumed() when previewActionConsumed != null:
return previewActionConsumed();case _:
  return null;

}
}

}

/// @nodoc


class _Started with DiagnosticableTreeMixin implements LlmChatSessionEvent {
  const _Started({required this.site});
  

 final  Site site;

/// Create a copy of LlmChatSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LlmChatSessionEvent.started'))
    ..add(DiagnosticsProperty('site', site));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.site, site) || other.site == site));
}


@override
int get hashCode => Object.hash(runtimeType,site);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LlmChatSessionEvent.started(site: $site)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $LlmChatSessionEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 Site site
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of LlmChatSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? site = null,}) {
  return _then(_Started(
site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as Site,
  ));
}


}

/// @nodoc


class _MessageSent with DiagnosticableTreeMixin implements LlmChatSessionEvent {
  const _MessageSent({required this.text});
  

 final  String text;

/// Create a copy of LlmChatSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageSentCopyWith<_MessageSent> get copyWith => __$MessageSentCopyWithImpl<_MessageSent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LlmChatSessionEvent.messageSent'))
    ..add(DiagnosticsProperty('text', text));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageSent&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LlmChatSessionEvent.messageSent(text: $text)';
}


}

/// @nodoc
abstract mixin class _$MessageSentCopyWith<$Res> implements $LlmChatSessionEventCopyWith<$Res> {
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

/// Create a copy of LlmChatSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_MessageSent(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _InboundEventReceived with DiagnosticableTreeMixin implements LlmChatSessionEvent {
  const _InboundEventReceived(this.event);
  

 final  ChatInboundEvent event;

/// Create a copy of LlmChatSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboundEventReceivedCopyWith<_InboundEventReceived> get copyWith => __$InboundEventReceivedCopyWithImpl<_InboundEventReceived>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LlmChatSessionEvent.inboundEventReceived'))
    ..add(DiagnosticsProperty('event', event));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboundEventReceived&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,event);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LlmChatSessionEvent.inboundEventReceived(event: $event)';
}


}

/// @nodoc
abstract mixin class _$InboundEventReceivedCopyWith<$Res> implements $LlmChatSessionEventCopyWith<$Res> {
  factory _$InboundEventReceivedCopyWith(_InboundEventReceived value, $Res Function(_InboundEventReceived) _then) = __$InboundEventReceivedCopyWithImpl;
@useResult
$Res call({
 ChatInboundEvent event
});


$ChatInboundEventCopyWith<$Res> get event;

}
/// @nodoc
class __$InboundEventReceivedCopyWithImpl<$Res>
    implements _$InboundEventReceivedCopyWith<$Res> {
  __$InboundEventReceivedCopyWithImpl(this._self, this._then);

  final _InboundEventReceived _self;
  final $Res Function(_InboundEventReceived) _then;

/// Create a copy of LlmChatSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? event = null,}) {
  return _then(_InboundEventReceived(
null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ChatInboundEvent,
  ));
}

/// Create a copy of LlmChatSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatInboundEventCopyWith<$Res> get event {
  
  return $ChatInboundEventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc


class _Disposed with DiagnosticableTreeMixin implements LlmChatSessionEvent {
  const _Disposed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LlmChatSessionEvent.disposed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disposed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LlmChatSessionEvent.disposed()';
}


}




/// @nodoc


class _PreviewActionConsumed with DiagnosticableTreeMixin implements LlmChatSessionEvent {
  const _PreviewActionConsumed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LlmChatSessionEvent.previewActionConsumed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviewActionConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LlmChatSessionEvent.previewActionConsumed()';
}


}




/// @nodoc
mixin _$LlmChatSessionState implements DiagnosticableTreeMixin {

 ChatConnectionPhase get connectionPhase; List<ChatMessage> get messages; int? get quotaRemaining; String? get errorMessage; SitePreviewAction? get previewAction;
/// Create a copy of LlmChatSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LlmChatSessionStateCopyWith<LlmChatSessionState> get copyWith => _$LlmChatSessionStateCopyWithImpl<LlmChatSessionState>(this as LlmChatSessionState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LlmChatSessionState'))
    ..add(DiagnosticsProperty('connectionPhase', connectionPhase))..add(DiagnosticsProperty('messages', messages))..add(DiagnosticsProperty('quotaRemaining', quotaRemaining))..add(DiagnosticsProperty('errorMessage', errorMessage))..add(DiagnosticsProperty('previewAction', previewAction));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LlmChatSessionState&&(identical(other.connectionPhase, connectionPhase) || other.connectionPhase == connectionPhase)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.quotaRemaining, quotaRemaining) || other.quotaRemaining == quotaRemaining)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.previewAction, previewAction) || other.previewAction == previewAction));
}


@override
int get hashCode => Object.hash(runtimeType,connectionPhase,const DeepCollectionEquality().hash(messages),quotaRemaining,errorMessage,previewAction);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LlmChatSessionState(connectionPhase: $connectionPhase, messages: $messages, quotaRemaining: $quotaRemaining, errorMessage: $errorMessage, previewAction: $previewAction)';
}


}

/// @nodoc
abstract mixin class $LlmChatSessionStateCopyWith<$Res>  {
  factory $LlmChatSessionStateCopyWith(LlmChatSessionState value, $Res Function(LlmChatSessionState) _then) = _$LlmChatSessionStateCopyWithImpl;
@useResult
$Res call({
 ChatConnectionPhase connectionPhase, List<ChatMessage> messages, int? quotaRemaining, String? errorMessage, SitePreviewAction? previewAction
});


$SitePreviewActionCopyWith<$Res>? get previewAction;

}
/// @nodoc
class _$LlmChatSessionStateCopyWithImpl<$Res>
    implements $LlmChatSessionStateCopyWith<$Res> {
  _$LlmChatSessionStateCopyWithImpl(this._self, this._then);

  final LlmChatSessionState _self;
  final $Res Function(LlmChatSessionState) _then;

/// Create a copy of LlmChatSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionPhase = null,Object? messages = null,Object? quotaRemaining = freezed,Object? errorMessage = freezed,Object? previewAction = freezed,}) {
  return _then(_self.copyWith(
connectionPhase: null == connectionPhase ? _self.connectionPhase : connectionPhase // ignore: cast_nullable_to_non_nullable
as ChatConnectionPhase,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,quotaRemaining: freezed == quotaRemaining ? _self.quotaRemaining : quotaRemaining // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,previewAction: freezed == previewAction ? _self.previewAction : previewAction // ignore: cast_nullable_to_non_nullable
as SitePreviewAction?,
  ));
}
/// Create a copy of LlmChatSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SitePreviewActionCopyWith<$Res>? get previewAction {
    if (_self.previewAction == null) {
    return null;
  }

  return $SitePreviewActionCopyWith<$Res>(_self.previewAction!, (value) {
    return _then(_self.copyWith(previewAction: value));
  });
}
}


/// Adds pattern-matching-related methods to [LlmChatSessionState].
extension LlmChatSessionStatePatterns on LlmChatSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LlmChatSessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LlmChatSessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LlmChatSessionState value)  $default,){
final _that = this;
switch (_that) {
case _LlmChatSessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LlmChatSessionState value)?  $default,){
final _that = this;
switch (_that) {
case _LlmChatSessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatConnectionPhase connectionPhase,  List<ChatMessage> messages,  int? quotaRemaining,  String? errorMessage,  SitePreviewAction? previewAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LlmChatSessionState() when $default != null:
return $default(_that.connectionPhase,_that.messages,_that.quotaRemaining,_that.errorMessage,_that.previewAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatConnectionPhase connectionPhase,  List<ChatMessage> messages,  int? quotaRemaining,  String? errorMessage,  SitePreviewAction? previewAction)  $default,) {final _that = this;
switch (_that) {
case _LlmChatSessionState():
return $default(_that.connectionPhase,_that.messages,_that.quotaRemaining,_that.errorMessage,_that.previewAction);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatConnectionPhase connectionPhase,  List<ChatMessage> messages,  int? quotaRemaining,  String? errorMessage,  SitePreviewAction? previewAction)?  $default,) {final _that = this;
switch (_that) {
case _LlmChatSessionState() when $default != null:
return $default(_that.connectionPhase,_that.messages,_that.quotaRemaining,_that.errorMessage,_that.previewAction);case _:
  return null;

}
}

}

/// @nodoc


class _LlmChatSessionState with DiagnosticableTreeMixin implements LlmChatSessionState {
  const _LlmChatSessionState({this.connectionPhase = ChatConnectionPhase.connecting, final  List<ChatMessage> messages = const [], this.quotaRemaining, this.errorMessage, this.previewAction}): _messages = messages;
  

@override@JsonKey() final  ChatConnectionPhase connectionPhase;
 final  List<ChatMessage> _messages;
@override@JsonKey() List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  int? quotaRemaining;
@override final  String? errorMessage;
@override final  SitePreviewAction? previewAction;

/// Create a copy of LlmChatSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LlmChatSessionStateCopyWith<_LlmChatSessionState> get copyWith => __$LlmChatSessionStateCopyWithImpl<_LlmChatSessionState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LlmChatSessionState'))
    ..add(DiagnosticsProperty('connectionPhase', connectionPhase))..add(DiagnosticsProperty('messages', messages))..add(DiagnosticsProperty('quotaRemaining', quotaRemaining))..add(DiagnosticsProperty('errorMessage', errorMessage))..add(DiagnosticsProperty('previewAction', previewAction));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LlmChatSessionState&&(identical(other.connectionPhase, connectionPhase) || other.connectionPhase == connectionPhase)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.quotaRemaining, quotaRemaining) || other.quotaRemaining == quotaRemaining)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.previewAction, previewAction) || other.previewAction == previewAction));
}


@override
int get hashCode => Object.hash(runtimeType,connectionPhase,const DeepCollectionEquality().hash(_messages),quotaRemaining,errorMessage,previewAction);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LlmChatSessionState(connectionPhase: $connectionPhase, messages: $messages, quotaRemaining: $quotaRemaining, errorMessage: $errorMessage, previewAction: $previewAction)';
}


}

/// @nodoc
abstract mixin class _$LlmChatSessionStateCopyWith<$Res> implements $LlmChatSessionStateCopyWith<$Res> {
  factory _$LlmChatSessionStateCopyWith(_LlmChatSessionState value, $Res Function(_LlmChatSessionState) _then) = __$LlmChatSessionStateCopyWithImpl;
@override @useResult
$Res call({
 ChatConnectionPhase connectionPhase, List<ChatMessage> messages, int? quotaRemaining, String? errorMessage, SitePreviewAction? previewAction
});


@override $SitePreviewActionCopyWith<$Res>? get previewAction;

}
/// @nodoc
class __$LlmChatSessionStateCopyWithImpl<$Res>
    implements _$LlmChatSessionStateCopyWith<$Res> {
  __$LlmChatSessionStateCopyWithImpl(this._self, this._then);

  final _LlmChatSessionState _self;
  final $Res Function(_LlmChatSessionState) _then;

/// Create a copy of LlmChatSessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionPhase = null,Object? messages = null,Object? quotaRemaining = freezed,Object? errorMessage = freezed,Object? previewAction = freezed,}) {
  return _then(_LlmChatSessionState(
connectionPhase: null == connectionPhase ? _self.connectionPhase : connectionPhase // ignore: cast_nullable_to_non_nullable
as ChatConnectionPhase,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,quotaRemaining: freezed == quotaRemaining ? _self.quotaRemaining : quotaRemaining // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,previewAction: freezed == previewAction ? _self.previewAction : previewAction // ignore: cast_nullable_to_non_nullable
as SitePreviewAction?,
  ));
}

/// Create a copy of LlmChatSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SitePreviewActionCopyWith<$Res>? get previewAction {
    if (_self.previewAction == null) {
    return null;
  }

  return $SitePreviewActionCopyWith<$Res>(_self.previewAction!, (value) {
    return _then(_self.copyWith(previewAction: value));
  });
}
}

// dart format on

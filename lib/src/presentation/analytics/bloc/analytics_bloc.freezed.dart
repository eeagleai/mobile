// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalyticsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsEvent()';
}


}

/// @nodoc
class $AnalyticsEventCopyWith<$Res>  {
$AnalyticsEventCopyWith(AnalyticsEvent _, $Res Function(AnalyticsEvent) __);
}


/// Adds pattern-matching-related methods to [AnalyticsEvent].
extension AnalyticsEventPatterns on AnalyticsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _StatsRequested value)?  statsRequested,TResult Function( _ConnectSocketRequested value)?  connectSocketRequested,TResult Function( _SocketMessageReceived value)?  socketMessageReceived,TResult Function( _ConversationOpened value)?  conversationOpened,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _StatsRequested() when statsRequested != null:
return statsRequested(_that);case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that);case _ConversationOpened() when conversationOpened != null:
return conversationOpened(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _StatsRequested value)  statsRequested,required TResult Function( _ConnectSocketRequested value)  connectSocketRequested,required TResult Function( _SocketMessageReceived value)  socketMessageReceived,required TResult Function( _ConversationOpened value)  conversationOpened,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RefreshRequested():
return refreshRequested(_that);case _StatsRequested():
return statsRequested(_that);case _ConnectSocketRequested():
return connectSocketRequested(_that);case _SocketMessageReceived():
return socketMessageReceived(_that);case _ConversationOpened():
return conversationOpened(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _StatsRequested value)?  statsRequested,TResult? Function( _ConnectSocketRequested value)?  connectSocketRequested,TResult? Function( _SocketMessageReceived value)?  socketMessageReceived,TResult? Function( _ConversationOpened value)?  conversationOpened,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _StatsRequested() when statsRequested != null:
return statsRequested(_that);case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that);case _ConversationOpened() when conversationOpened != null:
return conversationOpened(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String apikey)?  started,TResult Function()?  refreshRequested,TResult Function()?  statsRequested,TResult Function( bool isReconnect)?  connectSocketRequested,TResult Function( AnalyticsSocketMessage message)?  socketMessageReceived,TResult Function( String conversationId)?  conversationOpened,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.apikey);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _StatsRequested() when statsRequested != null:
return statsRequested();case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that.isReconnect);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that.message);case _ConversationOpened() when conversationOpened != null:
return conversationOpened(_that.conversationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String apikey)  started,required TResult Function()  refreshRequested,required TResult Function()  statsRequested,required TResult Function( bool isReconnect)  connectSocketRequested,required TResult Function( AnalyticsSocketMessage message)  socketMessageReceived,required TResult Function( String conversationId)  conversationOpened,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.apikey);case _RefreshRequested():
return refreshRequested();case _StatsRequested():
return statsRequested();case _ConnectSocketRequested():
return connectSocketRequested(_that.isReconnect);case _SocketMessageReceived():
return socketMessageReceived(_that.message);case _ConversationOpened():
return conversationOpened(_that.conversationId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String apikey)?  started,TResult? Function()?  refreshRequested,TResult? Function()?  statsRequested,TResult? Function( bool isReconnect)?  connectSocketRequested,TResult? Function( AnalyticsSocketMessage message)?  socketMessageReceived,TResult? Function( String conversationId)?  conversationOpened,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.apikey);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _StatsRequested() when statsRequested != null:
return statsRequested();case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that.isReconnect);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that.message);case _ConversationOpened() when conversationOpened != null:
return conversationOpened(_that.conversationId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AnalyticsEvent {
  const _Started(this.apikey);
  

 final  String apikey;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.apikey, apikey) || other.apikey == apikey));
}


@override
int get hashCode => Object.hash(runtimeType,apikey);

@override
String toString() {
  return 'AnalyticsEvent.started(apikey: $apikey)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String apikey
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apikey = null,}) {
  return _then(_Started(
null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RefreshRequested implements AnalyticsEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsEvent.refreshRequested()';
}


}




/// @nodoc


class _StatsRequested implements AnalyticsEvent {
  const _StatsRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsEvent.statsRequested()';
}


}




/// @nodoc


class _ConnectSocketRequested implements AnalyticsEvent {
  const _ConnectSocketRequested({this.isReconnect = false});
  

@JsonKey() final  bool isReconnect;

/// Create a copy of AnalyticsEvent
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
  return 'AnalyticsEvent.connectSocketRequested(isReconnect: $isReconnect)';
}


}

/// @nodoc
abstract mixin class _$ConnectSocketRequestedCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
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

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isReconnect = null,}) {
  return _then(_ConnectSocketRequested(
isReconnect: null == isReconnect ? _self.isReconnect : isReconnect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SocketMessageReceived implements AnalyticsEvent {
  const _SocketMessageReceived(this.message);
  

 final  AnalyticsSocketMessage message;

/// Create a copy of AnalyticsEvent
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
  return 'AnalyticsEvent.socketMessageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SocketMessageReceivedCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
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

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SocketMessageReceived(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as AnalyticsSocketMessage,
  ));
}


}

/// @nodoc


class _ConversationOpened implements AnalyticsEvent {
  const _ConversationOpened(this.conversationId);
  

 final  String conversationId;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationOpenedCopyWith<_ConversationOpened> get copyWith => __$ConversationOpenedCopyWithImpl<_ConversationOpened>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationOpened&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'AnalyticsEvent.conversationOpened(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class _$ConversationOpenedCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory _$ConversationOpenedCopyWith(_ConversationOpened value, $Res Function(_ConversationOpened) _then) = __$ConversationOpenedCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class __$ConversationOpenedCopyWithImpl<$Res>
    implements _$ConversationOpenedCopyWith<$Res> {
  __$ConversationOpenedCopyWithImpl(this._self, this._then);

  final _ConversationOpened _self;
  final $Res Function(_ConversationOpened) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(_ConversationOpened(
null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AnalyticsState {

 AnalyticsConnectionStatus get status; AnalyticsStats? get stats; List<domain.AnalyticsEvent> get events; Set<String> get unreadConversationIds; bool get isLoadingStats; bool get isLoadingEvents; String? get errorMessage;
/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsStateCopyWith<AnalyticsState> get copyWith => _$AnalyticsStateCopyWithImpl<AnalyticsState>(this as AnalyticsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsState&&(identical(other.status, status) || other.status == status)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other.events, events)&&const DeepCollectionEquality().equals(other.unreadConversationIds, unreadConversationIds)&&(identical(other.isLoadingStats, isLoadingStats) || other.isLoadingStats == isLoadingStats)&&(identical(other.isLoadingEvents, isLoadingEvents) || other.isLoadingEvents == isLoadingEvents)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,stats,const DeepCollectionEquality().hash(events),const DeepCollectionEquality().hash(unreadConversationIds),isLoadingStats,isLoadingEvents,errorMessage);

@override
String toString() {
  return 'AnalyticsState(status: $status, stats: $stats, events: $events, unreadConversationIds: $unreadConversationIds, isLoadingStats: $isLoadingStats, isLoadingEvents: $isLoadingEvents, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AnalyticsStateCopyWith<$Res>  {
  factory $AnalyticsStateCopyWith(AnalyticsState value, $Res Function(AnalyticsState) _then) = _$AnalyticsStateCopyWithImpl;
@useResult
$Res call({
 AnalyticsConnectionStatus status, AnalyticsStats? stats, List<domain.AnalyticsEvent> events, Set<String> unreadConversationIds, bool isLoadingStats, bool isLoadingEvents, String? errorMessage
});




}
/// @nodoc
class _$AnalyticsStateCopyWithImpl<$Res>
    implements $AnalyticsStateCopyWith<$Res> {
  _$AnalyticsStateCopyWithImpl(this._self, this._then);

  final AnalyticsState _self;
  final $Res Function(AnalyticsState) _then;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? stats = freezed,Object? events = null,Object? unreadConversationIds = null,Object? isLoadingStats = null,Object? isLoadingEvents = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsConnectionStatus,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as AnalyticsStats?,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<domain.AnalyticsEvent>,unreadConversationIds: null == unreadConversationIds ? _self.unreadConversationIds : unreadConversationIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isLoadingStats: null == isLoadingStats ? _self.isLoadingStats : isLoadingStats // ignore: cast_nullable_to_non_nullable
as bool,isLoadingEvents: null == isLoadingEvents ? _self.isLoadingEvents : isLoadingEvents // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsState].
extension AnalyticsStatePatterns on AnalyticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsState value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsState value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnalyticsConnectionStatus status,  AnalyticsStats? stats,  List<domain.AnalyticsEvent> events,  Set<String> unreadConversationIds,  bool isLoadingStats,  bool isLoadingEvents,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsState() when $default != null:
return $default(_that.status,_that.stats,_that.events,_that.unreadConversationIds,_that.isLoadingStats,_that.isLoadingEvents,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnalyticsConnectionStatus status,  AnalyticsStats? stats,  List<domain.AnalyticsEvent> events,  Set<String> unreadConversationIds,  bool isLoadingStats,  bool isLoadingEvents,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsState():
return $default(_that.status,_that.stats,_that.events,_that.unreadConversationIds,_that.isLoadingStats,_that.isLoadingEvents,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnalyticsConnectionStatus status,  AnalyticsStats? stats,  List<domain.AnalyticsEvent> events,  Set<String> unreadConversationIds,  bool isLoadingStats,  bool isLoadingEvents,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsState() when $default != null:
return $default(_that.status,_that.stats,_that.events,_that.unreadConversationIds,_that.isLoadingStats,_that.isLoadingEvents,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AnalyticsState implements AnalyticsState {
  const _AnalyticsState({this.status = AnalyticsConnectionStatus.offline, this.stats, final  List<domain.AnalyticsEvent> events = const <domain.AnalyticsEvent>[], final  Set<String> unreadConversationIds = const <String>{}, this.isLoadingStats = false, this.isLoadingEvents = false, this.errorMessage}): _events = events,_unreadConversationIds = unreadConversationIds;
  

@override@JsonKey() final  AnalyticsConnectionStatus status;
@override final  AnalyticsStats? stats;
 final  List<domain.AnalyticsEvent> _events;
@override@JsonKey() List<domain.AnalyticsEvent> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

 final  Set<String> _unreadConversationIds;
@override@JsonKey() Set<String> get unreadConversationIds {
  if (_unreadConversationIds is EqualUnmodifiableSetView) return _unreadConversationIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_unreadConversationIds);
}

@override@JsonKey() final  bool isLoadingStats;
@override@JsonKey() final  bool isLoadingEvents;
@override final  String? errorMessage;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsStateCopyWith<_AnalyticsState> get copyWith => __$AnalyticsStateCopyWithImpl<_AnalyticsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsState&&(identical(other.status, status) || other.status == status)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other._events, _events)&&const DeepCollectionEquality().equals(other._unreadConversationIds, _unreadConversationIds)&&(identical(other.isLoadingStats, isLoadingStats) || other.isLoadingStats == isLoadingStats)&&(identical(other.isLoadingEvents, isLoadingEvents) || other.isLoadingEvents == isLoadingEvents)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,stats,const DeepCollectionEquality().hash(_events),const DeepCollectionEquality().hash(_unreadConversationIds),isLoadingStats,isLoadingEvents,errorMessage);

@override
String toString() {
  return 'AnalyticsState(status: $status, stats: $stats, events: $events, unreadConversationIds: $unreadConversationIds, isLoadingStats: $isLoadingStats, isLoadingEvents: $isLoadingEvents, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsStateCopyWith<$Res> implements $AnalyticsStateCopyWith<$Res> {
  factory _$AnalyticsStateCopyWith(_AnalyticsState value, $Res Function(_AnalyticsState) _then) = __$AnalyticsStateCopyWithImpl;
@override @useResult
$Res call({
 AnalyticsConnectionStatus status, AnalyticsStats? stats, List<domain.AnalyticsEvent> events, Set<String> unreadConversationIds, bool isLoadingStats, bool isLoadingEvents, String? errorMessage
});




}
/// @nodoc
class __$AnalyticsStateCopyWithImpl<$Res>
    implements _$AnalyticsStateCopyWith<$Res> {
  __$AnalyticsStateCopyWithImpl(this._self, this._then);

  final _AnalyticsState _self;
  final $Res Function(_AnalyticsState) _then;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? stats = freezed,Object? events = null,Object? unreadConversationIds = null,Object? isLoadingStats = null,Object? isLoadingEvents = null,Object? errorMessage = freezed,}) {
  return _then(_AnalyticsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsConnectionStatus,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as AnalyticsStats?,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<domain.AnalyticsEvent>,unreadConversationIds: null == unreadConversationIds ? _self._unreadConversationIds : unreadConversationIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isLoadingStats: null == isLoadingStats ? _self.isLoadingStats : isLoadingStats // ignore: cast_nullable_to_non_nullable
as bool,isLoadingEvents: null == isLoadingEvents ? _self.isLoadingEvents : isLoadingEvents // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _TabChanged value)?  tabChanged,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _StatsRequested value)?  statsRequested,TResult Function( _ConversationsUpdated value)?  conversationsUpdated,TResult Function( _EventsUpdated value)?  eventsUpdated,TResult Function( _ConnectionStatusUpdated value)?  connectionStatusUpdated,TResult Function( _ConversationOpened value)?  conversationOpened,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _TabChanged() when tabChanged != null:
return tabChanged(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _StatsRequested() when statsRequested != null:
return statsRequested(_that);case _ConversationsUpdated() when conversationsUpdated != null:
return conversationsUpdated(_that);case _EventsUpdated() when eventsUpdated != null:
return eventsUpdated(_that);case _ConnectionStatusUpdated() when connectionStatusUpdated != null:
return connectionStatusUpdated(_that);case _ConversationOpened() when conversationOpened != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _TabChanged value)  tabChanged,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _StatsRequested value)  statsRequested,required TResult Function( _ConversationsUpdated value)  conversationsUpdated,required TResult Function( _EventsUpdated value)  eventsUpdated,required TResult Function( _ConnectionStatusUpdated value)  connectionStatusUpdated,required TResult Function( _ConversationOpened value)  conversationOpened,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _TabChanged():
return tabChanged(_that);case _RefreshRequested():
return refreshRequested(_that);case _StatsRequested():
return statsRequested(_that);case _ConversationsUpdated():
return conversationsUpdated(_that);case _EventsUpdated():
return eventsUpdated(_that);case _ConnectionStatusUpdated():
return connectionStatusUpdated(_that);case _ConversationOpened():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _TabChanged value)?  tabChanged,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _StatsRequested value)?  statsRequested,TResult? Function( _ConversationsUpdated value)?  conversationsUpdated,TResult? Function( _EventsUpdated value)?  eventsUpdated,TResult? Function( _ConnectionStatusUpdated value)?  connectionStatusUpdated,TResult? Function( _ConversationOpened value)?  conversationOpened,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _TabChanged() when tabChanged != null:
return tabChanged(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _StatsRequested() when statsRequested != null:
return statsRequested(_that);case _ConversationsUpdated() when conversationsUpdated != null:
return conversationsUpdated(_that);case _EventsUpdated() when eventsUpdated != null:
return eventsUpdated(_that);case _ConnectionStatusUpdated() when connectionStatusUpdated != null:
return connectionStatusUpdated(_that);case _ConversationOpened() when conversationOpened != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String apikey)?  started,TResult Function( AnalyticsTab tab)?  tabChanged,TResult Function()?  refreshRequested,TResult Function()?  statsRequested,TResult Function( List<LiveConversationSummary> conversations)?  conversationsUpdated,TResult Function( List<domain.AnalyticsEvent> events)?  eventsUpdated,TResult Function( AnalyticsConnectionStatus status)?  connectionStatusUpdated,TResult Function( String conversationId)?  conversationOpened,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.apikey);case _TabChanged() when tabChanged != null:
return tabChanged(_that.tab);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _StatsRequested() when statsRequested != null:
return statsRequested();case _ConversationsUpdated() when conversationsUpdated != null:
return conversationsUpdated(_that.conversations);case _EventsUpdated() when eventsUpdated != null:
return eventsUpdated(_that.events);case _ConnectionStatusUpdated() when connectionStatusUpdated != null:
return connectionStatusUpdated(_that.status);case _ConversationOpened() when conversationOpened != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String apikey)  started,required TResult Function( AnalyticsTab tab)  tabChanged,required TResult Function()  refreshRequested,required TResult Function()  statsRequested,required TResult Function( List<LiveConversationSummary> conversations)  conversationsUpdated,required TResult Function( List<domain.AnalyticsEvent> events)  eventsUpdated,required TResult Function( AnalyticsConnectionStatus status)  connectionStatusUpdated,required TResult Function( String conversationId)  conversationOpened,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.apikey);case _TabChanged():
return tabChanged(_that.tab);case _RefreshRequested():
return refreshRequested();case _StatsRequested():
return statsRequested();case _ConversationsUpdated():
return conversationsUpdated(_that.conversations);case _EventsUpdated():
return eventsUpdated(_that.events);case _ConnectionStatusUpdated():
return connectionStatusUpdated(_that.status);case _ConversationOpened():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String apikey)?  started,TResult? Function( AnalyticsTab tab)?  tabChanged,TResult? Function()?  refreshRequested,TResult? Function()?  statsRequested,TResult? Function( List<LiveConversationSummary> conversations)?  conversationsUpdated,TResult? Function( List<domain.AnalyticsEvent> events)?  eventsUpdated,TResult? Function( AnalyticsConnectionStatus status)?  connectionStatusUpdated,TResult? Function( String conversationId)?  conversationOpened,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.apikey);case _TabChanged() when tabChanged != null:
return tabChanged(_that.tab);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _StatsRequested() when statsRequested != null:
return statsRequested();case _ConversationsUpdated() when conversationsUpdated != null:
return conversationsUpdated(_that.conversations);case _EventsUpdated() when eventsUpdated != null:
return eventsUpdated(_that.events);case _ConnectionStatusUpdated() when connectionStatusUpdated != null:
return connectionStatusUpdated(_that.status);case _ConversationOpened() when conversationOpened != null:
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


class _TabChanged implements AnalyticsEvent {
  const _TabChanged(this.tab);
  

 final  AnalyticsTab tab;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabChangedCopyWith<_TabChanged> get copyWith => __$TabChangedCopyWithImpl<_TabChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabChanged&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,tab);

@override
String toString() {
  return 'AnalyticsEvent.tabChanged(tab: $tab)';
}


}

/// @nodoc
abstract mixin class _$TabChangedCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory _$TabChangedCopyWith(_TabChanged value, $Res Function(_TabChanged) _then) = __$TabChangedCopyWithImpl;
@useResult
$Res call({
 AnalyticsTab tab
});




}
/// @nodoc
class __$TabChangedCopyWithImpl<$Res>
    implements _$TabChangedCopyWith<$Res> {
  __$TabChangedCopyWithImpl(this._self, this._then);

  final _TabChanged _self;
  final $Res Function(_TabChanged) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tab = null,}) {
  return _then(_TabChanged(
null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as AnalyticsTab,
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


class _ConversationsUpdated implements AnalyticsEvent {
  const _ConversationsUpdated(final  List<LiveConversationSummary> conversations): _conversations = conversations;
  

 final  List<LiveConversationSummary> _conversations;
 List<LiveConversationSummary> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}


/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationsUpdatedCopyWith<_ConversationsUpdated> get copyWith => __$ConversationsUpdatedCopyWithImpl<_ConversationsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationsUpdated&&const DeepCollectionEquality().equals(other._conversations, _conversations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations));

@override
String toString() {
  return 'AnalyticsEvent.conversationsUpdated(conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class _$ConversationsUpdatedCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory _$ConversationsUpdatedCopyWith(_ConversationsUpdated value, $Res Function(_ConversationsUpdated) _then) = __$ConversationsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<LiveConversationSummary> conversations
});




}
/// @nodoc
class __$ConversationsUpdatedCopyWithImpl<$Res>
    implements _$ConversationsUpdatedCopyWith<$Res> {
  __$ConversationsUpdatedCopyWithImpl(this._self, this._then);

  final _ConversationsUpdated _self;
  final $Res Function(_ConversationsUpdated) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversations = null,}) {
  return _then(_ConversationsUpdated(
null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<LiveConversationSummary>,
  ));
}


}

/// @nodoc


class _EventsUpdated implements AnalyticsEvent {
  const _EventsUpdated(final  List<domain.AnalyticsEvent> events): _events = events;
  

 final  List<domain.AnalyticsEvent> _events;
 List<domain.AnalyticsEvent> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventsUpdatedCopyWith<_EventsUpdated> get copyWith => __$EventsUpdatedCopyWithImpl<_EventsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsUpdated&&const DeepCollectionEquality().equals(other._events, _events));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'AnalyticsEvent.eventsUpdated(events: $events)';
}


}

/// @nodoc
abstract mixin class _$EventsUpdatedCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory _$EventsUpdatedCopyWith(_EventsUpdated value, $Res Function(_EventsUpdated) _then) = __$EventsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<domain.AnalyticsEvent> events
});




}
/// @nodoc
class __$EventsUpdatedCopyWithImpl<$Res>
    implements _$EventsUpdatedCopyWith<$Res> {
  __$EventsUpdatedCopyWithImpl(this._self, this._then);

  final _EventsUpdated _self;
  final $Res Function(_EventsUpdated) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? events = null,}) {
  return _then(_EventsUpdated(
null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<domain.AnalyticsEvent>,
  ));
}


}

/// @nodoc


class _ConnectionStatusUpdated implements AnalyticsEvent {
  const _ConnectionStatusUpdated(this.status);
  

 final  AnalyticsConnectionStatus status;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionStatusUpdatedCopyWith<_ConnectionStatusUpdated> get copyWith => __$ConnectionStatusUpdatedCopyWithImpl<_ConnectionStatusUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionStatusUpdated&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'AnalyticsEvent.connectionStatusUpdated(status: $status)';
}


}

/// @nodoc
abstract mixin class _$ConnectionStatusUpdatedCopyWith<$Res> implements $AnalyticsEventCopyWith<$Res> {
  factory _$ConnectionStatusUpdatedCopyWith(_ConnectionStatusUpdated value, $Res Function(_ConnectionStatusUpdated) _then) = __$ConnectionStatusUpdatedCopyWithImpl;
@useResult
$Res call({
 AnalyticsConnectionStatus status
});




}
/// @nodoc
class __$ConnectionStatusUpdatedCopyWithImpl<$Res>
    implements _$ConnectionStatusUpdatedCopyWith<$Res> {
  __$ConnectionStatusUpdatedCopyWithImpl(this._self, this._then);

  final _ConnectionStatusUpdated _self;
  final $Res Function(_ConnectionStatusUpdated) _then;

/// Create a copy of AnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_ConnectionStatusUpdated(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsConnectionStatus,
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

 AnalyticsTab get selectedTab; AnalyticsConnectionStatus get status; AnalyticsStats? get stats; List<LiveConversationSummary> get conversations; List<domain.AnalyticsEvent> get events; bool get isLoadingStats; bool get isLoadingEvents; String? get errorMessage;
/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsStateCopyWith<AnalyticsState> get copyWith => _$AnalyticsStateCopyWithImpl<AnalyticsState>(this as AnalyticsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.status, status) || other.status == status)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other.conversations, conversations)&&const DeepCollectionEquality().equals(other.events, events)&&(identical(other.isLoadingStats, isLoadingStats) || other.isLoadingStats == isLoadingStats)&&(identical(other.isLoadingEvents, isLoadingEvents) || other.isLoadingEvents == isLoadingEvents)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,status,stats,const DeepCollectionEquality().hash(conversations),const DeepCollectionEquality().hash(events),isLoadingStats,isLoadingEvents,errorMessage);

@override
String toString() {
  return 'AnalyticsState(selectedTab: $selectedTab, status: $status, stats: $stats, conversations: $conversations, events: $events, isLoadingStats: $isLoadingStats, isLoadingEvents: $isLoadingEvents, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AnalyticsStateCopyWith<$Res>  {
  factory $AnalyticsStateCopyWith(AnalyticsState value, $Res Function(AnalyticsState) _then) = _$AnalyticsStateCopyWithImpl;
@useResult
$Res call({
 AnalyticsTab selectedTab, AnalyticsConnectionStatus status, AnalyticsStats? stats, List<LiveConversationSummary> conversations, List<domain.AnalyticsEvent> events, bool isLoadingStats, bool isLoadingEvents, String? errorMessage
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
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? status = null,Object? stats = freezed,Object? conversations = null,Object? events = null,Object? isLoadingStats = null,Object? isLoadingEvents = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as AnalyticsTab,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsConnectionStatus,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as AnalyticsStats?,conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<LiveConversationSummary>,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<domain.AnalyticsEvent>,isLoadingStats: null == isLoadingStats ? _self.isLoadingStats : isLoadingStats // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnalyticsTab selectedTab,  AnalyticsConnectionStatus status,  AnalyticsStats? stats,  List<LiveConversationSummary> conversations,  List<domain.AnalyticsEvent> events,  bool isLoadingStats,  bool isLoadingEvents,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsState() when $default != null:
return $default(_that.selectedTab,_that.status,_that.stats,_that.conversations,_that.events,_that.isLoadingStats,_that.isLoadingEvents,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnalyticsTab selectedTab,  AnalyticsConnectionStatus status,  AnalyticsStats? stats,  List<LiveConversationSummary> conversations,  List<domain.AnalyticsEvent> events,  bool isLoadingStats,  bool isLoadingEvents,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsState():
return $default(_that.selectedTab,_that.status,_that.stats,_that.conversations,_that.events,_that.isLoadingStats,_that.isLoadingEvents,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnalyticsTab selectedTab,  AnalyticsConnectionStatus status,  AnalyticsStats? stats,  List<LiveConversationSummary> conversations,  List<domain.AnalyticsEvent> events,  bool isLoadingStats,  bool isLoadingEvents,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsState() when $default != null:
return $default(_that.selectedTab,_that.status,_that.stats,_that.conversations,_that.events,_that.isLoadingStats,_that.isLoadingEvents,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AnalyticsState implements AnalyticsState {
  const _AnalyticsState({this.selectedTab = AnalyticsTab.chats, this.status = AnalyticsConnectionStatus.offline, this.stats, final  List<LiveConversationSummary> conversations = const <LiveConversationSummary>[], final  List<domain.AnalyticsEvent> events = const <domain.AnalyticsEvent>[], this.isLoadingStats = false, this.isLoadingEvents = false, this.errorMessage}): _conversations = conversations,_events = events;
  

@override@JsonKey() final  AnalyticsTab selectedTab;
@override@JsonKey() final  AnalyticsConnectionStatus status;
@override final  AnalyticsStats? stats;
 final  List<LiveConversationSummary> _conversations;
@override@JsonKey() List<LiveConversationSummary> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}

 final  List<domain.AnalyticsEvent> _events;
@override@JsonKey() List<domain.AnalyticsEvent> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.status, status) || other.status == status)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&const DeepCollectionEquality().equals(other._events, _events)&&(identical(other.isLoadingStats, isLoadingStats) || other.isLoadingStats == isLoadingStats)&&(identical(other.isLoadingEvents, isLoadingEvents) || other.isLoadingEvents == isLoadingEvents)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,status,stats,const DeepCollectionEquality().hash(_conversations),const DeepCollectionEquality().hash(_events),isLoadingStats,isLoadingEvents,errorMessage);

@override
String toString() {
  return 'AnalyticsState(selectedTab: $selectedTab, status: $status, stats: $stats, conversations: $conversations, events: $events, isLoadingStats: $isLoadingStats, isLoadingEvents: $isLoadingEvents, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsStateCopyWith<$Res> implements $AnalyticsStateCopyWith<$Res> {
  factory _$AnalyticsStateCopyWith(_AnalyticsState value, $Res Function(_AnalyticsState) _then) = __$AnalyticsStateCopyWithImpl;
@override @useResult
$Res call({
 AnalyticsTab selectedTab, AnalyticsConnectionStatus status, AnalyticsStats? stats, List<LiveConversationSummary> conversations, List<domain.AnalyticsEvent> events, bool isLoadingStats, bool isLoadingEvents, String? errorMessage
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
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? status = null,Object? stats = freezed,Object? conversations = null,Object? events = null,Object? isLoadingStats = null,Object? isLoadingEvents = null,Object? errorMessage = freezed,}) {
  return _then(_AnalyticsState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as AnalyticsTab,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsConnectionStatus,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as AnalyticsStats?,conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<LiveConversationSummary>,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<domain.AnalyticsEvent>,isLoadingStats: null == isLoadingStats ? _self.isLoadingStats : isLoadingStats // ignore: cast_nullable_to_non_nullable
as bool,isLoadingEvents: null == isLoadingEvents ? _self.isLoadingEvents : isLoadingEvents // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

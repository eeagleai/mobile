// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_analytics_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeAnalyticsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeAnalyticsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeAnalyticsEvent()';
}


}

/// @nodoc
class $HomeAnalyticsEventCopyWith<$Res>  {
$HomeAnalyticsEventCopyWith(HomeAnalyticsEvent _, $Res Function(HomeAnalyticsEvent) __);
}


/// Adds pattern-matching-related methods to [HomeAnalyticsEvent].
extension HomeAnalyticsEventPatterns on HomeAnalyticsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SitesUpdated value)?  sitesUpdated,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _SiteRefreshRequested value)?  siteRefreshRequested,TResult Function( _StatsRequested value)?  statsRequested,TResult Function( _ConnectSocketRequested value)?  connectSocketRequested,TResult Function( _SocketMessageReceived value)?  socketMessageReceived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SitesUpdated() when sitesUpdated != null:
return sitesUpdated(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _SiteRefreshRequested() when siteRefreshRequested != null:
return siteRefreshRequested(_that);case _StatsRequested() when statsRequested != null:
return statsRequested(_that);case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SitesUpdated value)  sitesUpdated,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _SiteRefreshRequested value)  siteRefreshRequested,required TResult Function( _StatsRequested value)  statsRequested,required TResult Function( _ConnectSocketRequested value)  connectSocketRequested,required TResult Function( _SocketMessageReceived value)  socketMessageReceived,}){
final _that = this;
switch (_that) {
case _SitesUpdated():
return sitesUpdated(_that);case _RefreshRequested():
return refreshRequested(_that);case _SiteRefreshRequested():
return siteRefreshRequested(_that);case _StatsRequested():
return statsRequested(_that);case _ConnectSocketRequested():
return connectSocketRequested(_that);case _SocketMessageReceived():
return socketMessageReceived(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SitesUpdated value)?  sitesUpdated,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _SiteRefreshRequested value)?  siteRefreshRequested,TResult? Function( _StatsRequested value)?  statsRequested,TResult? Function( _ConnectSocketRequested value)?  connectSocketRequested,TResult? Function( _SocketMessageReceived value)?  socketMessageReceived,}){
final _that = this;
switch (_that) {
case _SitesUpdated() when sitesUpdated != null:
return sitesUpdated(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _SiteRefreshRequested() when siteRefreshRequested != null:
return siteRefreshRequested(_that);case _StatsRequested() when statsRequested != null:
return statsRequested(_that);case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Site> sites)?  sitesUpdated,TResult Function()?  refreshRequested,TResult Function( String apikey)?  siteRefreshRequested,TResult Function( String apikey)?  statsRequested,TResult Function( String apikey,  bool isReconnect)?  connectSocketRequested,TResult Function( String apikey,  AnalyticsSocketMessage message)?  socketMessageReceived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SitesUpdated() when sitesUpdated != null:
return sitesUpdated(_that.sites);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _SiteRefreshRequested() when siteRefreshRequested != null:
return siteRefreshRequested(_that.apikey);case _StatsRequested() when statsRequested != null:
return statsRequested(_that.apikey);case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that.apikey,_that.isReconnect);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that.apikey,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Site> sites)  sitesUpdated,required TResult Function()  refreshRequested,required TResult Function( String apikey)  siteRefreshRequested,required TResult Function( String apikey)  statsRequested,required TResult Function( String apikey,  bool isReconnect)  connectSocketRequested,required TResult Function( String apikey,  AnalyticsSocketMessage message)  socketMessageReceived,}) {final _that = this;
switch (_that) {
case _SitesUpdated():
return sitesUpdated(_that.sites);case _RefreshRequested():
return refreshRequested();case _SiteRefreshRequested():
return siteRefreshRequested(_that.apikey);case _StatsRequested():
return statsRequested(_that.apikey);case _ConnectSocketRequested():
return connectSocketRequested(_that.apikey,_that.isReconnect);case _SocketMessageReceived():
return socketMessageReceived(_that.apikey,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Site> sites)?  sitesUpdated,TResult? Function()?  refreshRequested,TResult? Function( String apikey)?  siteRefreshRequested,TResult? Function( String apikey)?  statsRequested,TResult? Function( String apikey,  bool isReconnect)?  connectSocketRequested,TResult? Function( String apikey,  AnalyticsSocketMessage message)?  socketMessageReceived,}) {final _that = this;
switch (_that) {
case _SitesUpdated() when sitesUpdated != null:
return sitesUpdated(_that.sites);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _SiteRefreshRequested() when siteRefreshRequested != null:
return siteRefreshRequested(_that.apikey);case _StatsRequested() when statsRequested != null:
return statsRequested(_that.apikey);case _ConnectSocketRequested() when connectSocketRequested != null:
return connectSocketRequested(_that.apikey,_that.isReconnect);case _SocketMessageReceived() when socketMessageReceived != null:
return socketMessageReceived(_that.apikey,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _SitesUpdated implements HomeAnalyticsEvent {
  const _SitesUpdated(final  List<Site> sites): _sites = sites;
  

 final  List<Site> _sites;
 List<Site> get sites {
  if (_sites is EqualUnmodifiableListView) return _sites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sites);
}


/// Create a copy of HomeAnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SitesUpdatedCopyWith<_SitesUpdated> get copyWith => __$SitesUpdatedCopyWithImpl<_SitesUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SitesUpdated&&const DeepCollectionEquality().equals(other._sites, _sites));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sites));

@override
String toString() {
  return 'HomeAnalyticsEvent.sitesUpdated(sites: $sites)';
}


}

/// @nodoc
abstract mixin class _$SitesUpdatedCopyWith<$Res> implements $HomeAnalyticsEventCopyWith<$Res> {
  factory _$SitesUpdatedCopyWith(_SitesUpdated value, $Res Function(_SitesUpdated) _then) = __$SitesUpdatedCopyWithImpl;
@useResult
$Res call({
 List<Site> sites
});




}
/// @nodoc
class __$SitesUpdatedCopyWithImpl<$Res>
    implements _$SitesUpdatedCopyWith<$Res> {
  __$SitesUpdatedCopyWithImpl(this._self, this._then);

  final _SitesUpdated _self;
  final $Res Function(_SitesUpdated) _then;

/// Create a copy of HomeAnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sites = null,}) {
  return _then(_SitesUpdated(
null == sites ? _self._sites : sites // ignore: cast_nullable_to_non_nullable
as List<Site>,
  ));
}


}

/// @nodoc


class _RefreshRequested implements HomeAnalyticsEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeAnalyticsEvent.refreshRequested()';
}


}




/// @nodoc


class _SiteRefreshRequested implements HomeAnalyticsEvent {
  const _SiteRefreshRequested(this.apikey);
  

 final  String apikey;

/// Create a copy of HomeAnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteRefreshRequestedCopyWith<_SiteRefreshRequested> get copyWith => __$SiteRefreshRequestedCopyWithImpl<_SiteRefreshRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteRefreshRequested&&(identical(other.apikey, apikey) || other.apikey == apikey));
}


@override
int get hashCode => Object.hash(runtimeType,apikey);

@override
String toString() {
  return 'HomeAnalyticsEvent.siteRefreshRequested(apikey: $apikey)';
}


}

/// @nodoc
abstract mixin class _$SiteRefreshRequestedCopyWith<$Res> implements $HomeAnalyticsEventCopyWith<$Res> {
  factory _$SiteRefreshRequestedCopyWith(_SiteRefreshRequested value, $Res Function(_SiteRefreshRequested) _then) = __$SiteRefreshRequestedCopyWithImpl;
@useResult
$Res call({
 String apikey
});




}
/// @nodoc
class __$SiteRefreshRequestedCopyWithImpl<$Res>
    implements _$SiteRefreshRequestedCopyWith<$Res> {
  __$SiteRefreshRequestedCopyWithImpl(this._self, this._then);

  final _SiteRefreshRequested _self;
  final $Res Function(_SiteRefreshRequested) _then;

/// Create a copy of HomeAnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apikey = null,}) {
  return _then(_SiteRefreshRequested(
null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StatsRequested implements HomeAnalyticsEvent {
  const _StatsRequested(this.apikey);
  

 final  String apikey;

/// Create a copy of HomeAnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsRequestedCopyWith<_StatsRequested> get copyWith => __$StatsRequestedCopyWithImpl<_StatsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsRequested&&(identical(other.apikey, apikey) || other.apikey == apikey));
}


@override
int get hashCode => Object.hash(runtimeType,apikey);

@override
String toString() {
  return 'HomeAnalyticsEvent.statsRequested(apikey: $apikey)';
}


}

/// @nodoc
abstract mixin class _$StatsRequestedCopyWith<$Res> implements $HomeAnalyticsEventCopyWith<$Res> {
  factory _$StatsRequestedCopyWith(_StatsRequested value, $Res Function(_StatsRequested) _then) = __$StatsRequestedCopyWithImpl;
@useResult
$Res call({
 String apikey
});




}
/// @nodoc
class __$StatsRequestedCopyWithImpl<$Res>
    implements _$StatsRequestedCopyWith<$Res> {
  __$StatsRequestedCopyWithImpl(this._self, this._then);

  final _StatsRequested _self;
  final $Res Function(_StatsRequested) _then;

/// Create a copy of HomeAnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apikey = null,}) {
  return _then(_StatsRequested(
null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ConnectSocketRequested implements HomeAnalyticsEvent {
  const _ConnectSocketRequested(this.apikey, {this.isReconnect = false});
  

 final  String apikey;
@JsonKey() final  bool isReconnect;

/// Create a copy of HomeAnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectSocketRequestedCopyWith<_ConnectSocketRequested> get copyWith => __$ConnectSocketRequestedCopyWithImpl<_ConnectSocketRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectSocketRequested&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.isReconnect, isReconnect) || other.isReconnect == isReconnect));
}


@override
int get hashCode => Object.hash(runtimeType,apikey,isReconnect);

@override
String toString() {
  return 'HomeAnalyticsEvent.connectSocketRequested(apikey: $apikey, isReconnect: $isReconnect)';
}


}

/// @nodoc
abstract mixin class _$ConnectSocketRequestedCopyWith<$Res> implements $HomeAnalyticsEventCopyWith<$Res> {
  factory _$ConnectSocketRequestedCopyWith(_ConnectSocketRequested value, $Res Function(_ConnectSocketRequested) _then) = __$ConnectSocketRequestedCopyWithImpl;
@useResult
$Res call({
 String apikey, bool isReconnect
});




}
/// @nodoc
class __$ConnectSocketRequestedCopyWithImpl<$Res>
    implements _$ConnectSocketRequestedCopyWith<$Res> {
  __$ConnectSocketRequestedCopyWithImpl(this._self, this._then);

  final _ConnectSocketRequested _self;
  final $Res Function(_ConnectSocketRequested) _then;

/// Create a copy of HomeAnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apikey = null,Object? isReconnect = null,}) {
  return _then(_ConnectSocketRequested(
null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,isReconnect: null == isReconnect ? _self.isReconnect : isReconnect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SocketMessageReceived implements HomeAnalyticsEvent {
  const _SocketMessageReceived(this.apikey, this.message);
  

 final  String apikey;
 final  AnalyticsSocketMessage message;

/// Create a copy of HomeAnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocketMessageReceivedCopyWith<_SocketMessageReceived> get copyWith => __$SocketMessageReceivedCopyWithImpl<_SocketMessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocketMessageReceived&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,apikey,message);

@override
String toString() {
  return 'HomeAnalyticsEvent.socketMessageReceived(apikey: $apikey, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SocketMessageReceivedCopyWith<$Res> implements $HomeAnalyticsEventCopyWith<$Res> {
  factory _$SocketMessageReceivedCopyWith(_SocketMessageReceived value, $Res Function(_SocketMessageReceived) _then) = __$SocketMessageReceivedCopyWithImpl;
@useResult
$Res call({
 String apikey, AnalyticsSocketMessage message
});




}
/// @nodoc
class __$SocketMessageReceivedCopyWithImpl<$Res>
    implements _$SocketMessageReceivedCopyWith<$Res> {
  __$SocketMessageReceivedCopyWithImpl(this._self, this._then);

  final _SocketMessageReceived _self;
  final $Res Function(_SocketMessageReceived) _then;

/// Create a copy of HomeAnalyticsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apikey = null,Object? message = null,}) {
  return _then(_SocketMessageReceived(
null == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as AnalyticsSocketMessage,
  ));
}


}

/// @nodoc
mixin _$HomeAnalyticsState {

 Map<String, SiteAnalyticsState> get analytics;
/// Create a copy of HomeAnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeAnalyticsStateCopyWith<HomeAnalyticsState> get copyWith => _$HomeAnalyticsStateCopyWithImpl<HomeAnalyticsState>(this as HomeAnalyticsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeAnalyticsState&&const DeepCollectionEquality().equals(other.analytics, analytics));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(analytics));

@override
String toString() {
  return 'HomeAnalyticsState(analytics: $analytics)';
}


}

/// @nodoc
abstract mixin class $HomeAnalyticsStateCopyWith<$Res>  {
  factory $HomeAnalyticsStateCopyWith(HomeAnalyticsState value, $Res Function(HomeAnalyticsState) _then) = _$HomeAnalyticsStateCopyWithImpl;
@useResult
$Res call({
 Map<String, SiteAnalyticsState> analytics
});




}
/// @nodoc
class _$HomeAnalyticsStateCopyWithImpl<$Res>
    implements $HomeAnalyticsStateCopyWith<$Res> {
  _$HomeAnalyticsStateCopyWithImpl(this._self, this._then);

  final HomeAnalyticsState _self;
  final $Res Function(HomeAnalyticsState) _then;

/// Create a copy of HomeAnalyticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? analytics = null,}) {
  return _then(_self.copyWith(
analytics: null == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, SiteAnalyticsState>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeAnalyticsState].
extension HomeAnalyticsStatePatterns on HomeAnalyticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeAnalyticsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeAnalyticsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeAnalyticsState value)  $default,){
final _that = this;
switch (_that) {
case _HomeAnalyticsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeAnalyticsState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeAnalyticsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, SiteAnalyticsState> analytics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeAnalyticsState() when $default != null:
return $default(_that.analytics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, SiteAnalyticsState> analytics)  $default,) {final _that = this;
switch (_that) {
case _HomeAnalyticsState():
return $default(_that.analytics);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, SiteAnalyticsState> analytics)?  $default,) {final _that = this;
switch (_that) {
case _HomeAnalyticsState() when $default != null:
return $default(_that.analytics);case _:
  return null;

}
}

}

/// @nodoc


class _HomeAnalyticsState extends HomeAnalyticsState {
  const _HomeAnalyticsState({final  Map<String, SiteAnalyticsState> analytics = const <String, SiteAnalyticsState>{}}): _analytics = analytics,super._();
  

 final  Map<String, SiteAnalyticsState> _analytics;
@override@JsonKey() Map<String, SiteAnalyticsState> get analytics {
  if (_analytics is EqualUnmodifiableMapView) return _analytics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_analytics);
}


/// Create a copy of HomeAnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeAnalyticsStateCopyWith<_HomeAnalyticsState> get copyWith => __$HomeAnalyticsStateCopyWithImpl<_HomeAnalyticsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeAnalyticsState&&const DeepCollectionEquality().equals(other._analytics, _analytics));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_analytics));

@override
String toString() {
  return 'HomeAnalyticsState(analytics: $analytics)';
}


}

/// @nodoc
abstract mixin class _$HomeAnalyticsStateCopyWith<$Res> implements $HomeAnalyticsStateCopyWith<$Res> {
  factory _$HomeAnalyticsStateCopyWith(_HomeAnalyticsState value, $Res Function(_HomeAnalyticsState) _then) = __$HomeAnalyticsStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, SiteAnalyticsState> analytics
});




}
/// @nodoc
class __$HomeAnalyticsStateCopyWithImpl<$Res>
    implements _$HomeAnalyticsStateCopyWith<$Res> {
  __$HomeAnalyticsStateCopyWithImpl(this._self, this._then);

  final _HomeAnalyticsState _self;
  final $Res Function(_HomeAnalyticsState) _then;

/// Create a copy of HomeAnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? analytics = null,}) {
  return _then(_HomeAnalyticsState(
analytics: null == analytics ? _self._analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, SiteAnalyticsState>,
  ));
}


}

// dart format on

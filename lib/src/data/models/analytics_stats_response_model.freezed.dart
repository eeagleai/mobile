// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_stats_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsStatsResponseModel {

 String? get apikey; AnalyticsStatsModel? get stats;
/// Create a copy of AnalyticsStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsStatsResponseModelCopyWith<AnalyticsStatsResponseModel> get copyWith => _$AnalyticsStatsResponseModelCopyWithImpl<AnalyticsStatsResponseModel>(this as AnalyticsStatsResponseModel, _$identity);

  /// Serializes this AnalyticsStatsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsStatsResponseModel&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apikey,stats);

@override
String toString() {
  return 'AnalyticsStatsResponseModel(apikey: $apikey, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $AnalyticsStatsResponseModelCopyWith<$Res>  {
  factory $AnalyticsStatsResponseModelCopyWith(AnalyticsStatsResponseModel value, $Res Function(AnalyticsStatsResponseModel) _then) = _$AnalyticsStatsResponseModelCopyWithImpl;
@useResult
$Res call({
 String? apikey, AnalyticsStatsModel? stats
});


$AnalyticsStatsModelCopyWith<$Res>? get stats;

}
/// @nodoc
class _$AnalyticsStatsResponseModelCopyWithImpl<$Res>
    implements $AnalyticsStatsResponseModelCopyWith<$Res> {
  _$AnalyticsStatsResponseModelCopyWithImpl(this._self, this._then);

  final AnalyticsStatsResponseModel _self;
  final $Res Function(AnalyticsStatsResponseModel) _then;

/// Create a copy of AnalyticsStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apikey = freezed,Object? stats = freezed,}) {
  return _then(_self.copyWith(
apikey: freezed == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String?,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as AnalyticsStatsModel?,
  ));
}
/// Create a copy of AnalyticsStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnalyticsStatsModelCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $AnalyticsStatsModelCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnalyticsStatsResponseModel].
extension AnalyticsStatsResponseModelPatterns on AnalyticsStatsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsStatsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsStatsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsStatsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsStatsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsStatsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsStatsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? apikey,  AnalyticsStatsModel? stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsStatsResponseModel() when $default != null:
return $default(_that.apikey,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? apikey,  AnalyticsStatsModel? stats)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsStatsResponseModel():
return $default(_that.apikey,_that.stats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? apikey,  AnalyticsStatsModel? stats)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsStatsResponseModel() when $default != null:
return $default(_that.apikey,_that.stats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsStatsResponseModel extends AnalyticsStatsResponseModel {
  const _AnalyticsStatsResponseModel({this.apikey, this.stats}): super._();
  factory _AnalyticsStatsResponseModel.fromJson(Map<String, dynamic> json) => _$AnalyticsStatsResponseModelFromJson(json);

@override final  String? apikey;
@override final  AnalyticsStatsModel? stats;

/// Create a copy of AnalyticsStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsStatsResponseModelCopyWith<_AnalyticsStatsResponseModel> get copyWith => __$AnalyticsStatsResponseModelCopyWithImpl<_AnalyticsStatsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsStatsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsStatsResponseModel&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apikey,stats);

@override
String toString() {
  return 'AnalyticsStatsResponseModel(apikey: $apikey, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsStatsResponseModelCopyWith<$Res> implements $AnalyticsStatsResponseModelCopyWith<$Res> {
  factory _$AnalyticsStatsResponseModelCopyWith(_AnalyticsStatsResponseModel value, $Res Function(_AnalyticsStatsResponseModel) _then) = __$AnalyticsStatsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? apikey, AnalyticsStatsModel? stats
});


@override $AnalyticsStatsModelCopyWith<$Res>? get stats;

}
/// @nodoc
class __$AnalyticsStatsResponseModelCopyWithImpl<$Res>
    implements _$AnalyticsStatsResponseModelCopyWith<$Res> {
  __$AnalyticsStatsResponseModelCopyWithImpl(this._self, this._then);

  final _AnalyticsStatsResponseModel _self;
  final $Res Function(_AnalyticsStatsResponseModel) _then;

/// Create a copy of AnalyticsStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apikey = freezed,Object? stats = freezed,}) {
  return _then(_AnalyticsStatsResponseModel(
apikey: freezed == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String?,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as AnalyticsStatsModel?,
  ));
}

/// Create a copy of AnalyticsStatsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnalyticsStatsModelCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $AnalyticsStatsModelCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$AnalyticsStatsModel {

@JsonKey(name: 'total_events') int get totalEvents;@JsonKey(name: 'unique_visitors') int get uniqueVisitors;@JsonKey(name: 'unique_sessions') int get uniqueSessions;@JsonKey(name: 'last_event_at') DateTime? get lastEventAt;
/// Create a copy of AnalyticsStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsStatsModelCopyWith<AnalyticsStatsModel> get copyWith => _$AnalyticsStatsModelCopyWithImpl<AnalyticsStatsModel>(this as AnalyticsStatsModel, _$identity);

  /// Serializes this AnalyticsStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsStatsModel&&(identical(other.totalEvents, totalEvents) || other.totalEvents == totalEvents)&&(identical(other.uniqueVisitors, uniqueVisitors) || other.uniqueVisitors == uniqueVisitors)&&(identical(other.uniqueSessions, uniqueSessions) || other.uniqueSessions == uniqueSessions)&&(identical(other.lastEventAt, lastEventAt) || other.lastEventAt == lastEventAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalEvents,uniqueVisitors,uniqueSessions,lastEventAt);

@override
String toString() {
  return 'AnalyticsStatsModel(totalEvents: $totalEvents, uniqueVisitors: $uniqueVisitors, uniqueSessions: $uniqueSessions, lastEventAt: $lastEventAt)';
}


}

/// @nodoc
abstract mixin class $AnalyticsStatsModelCopyWith<$Res>  {
  factory $AnalyticsStatsModelCopyWith(AnalyticsStatsModel value, $Res Function(AnalyticsStatsModel) _then) = _$AnalyticsStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_events') int totalEvents,@JsonKey(name: 'unique_visitors') int uniqueVisitors,@JsonKey(name: 'unique_sessions') int uniqueSessions,@JsonKey(name: 'last_event_at') DateTime? lastEventAt
});




}
/// @nodoc
class _$AnalyticsStatsModelCopyWithImpl<$Res>
    implements $AnalyticsStatsModelCopyWith<$Res> {
  _$AnalyticsStatsModelCopyWithImpl(this._self, this._then);

  final AnalyticsStatsModel _self;
  final $Res Function(AnalyticsStatsModel) _then;

/// Create a copy of AnalyticsStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalEvents = null,Object? uniqueVisitors = null,Object? uniqueSessions = null,Object? lastEventAt = freezed,}) {
  return _then(_self.copyWith(
totalEvents: null == totalEvents ? _self.totalEvents : totalEvents // ignore: cast_nullable_to_non_nullable
as int,uniqueVisitors: null == uniqueVisitors ? _self.uniqueVisitors : uniqueVisitors // ignore: cast_nullable_to_non_nullable
as int,uniqueSessions: null == uniqueSessions ? _self.uniqueSessions : uniqueSessions // ignore: cast_nullable_to_non_nullable
as int,lastEventAt: freezed == lastEventAt ? _self.lastEventAt : lastEventAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsStatsModel].
extension AnalyticsStatsModelPatterns on AnalyticsStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_events')  int totalEvents, @JsonKey(name: 'unique_visitors')  int uniqueVisitors, @JsonKey(name: 'unique_sessions')  int uniqueSessions, @JsonKey(name: 'last_event_at')  DateTime? lastEventAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsStatsModel() when $default != null:
return $default(_that.totalEvents,_that.uniqueVisitors,_that.uniqueSessions,_that.lastEventAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_events')  int totalEvents, @JsonKey(name: 'unique_visitors')  int uniqueVisitors, @JsonKey(name: 'unique_sessions')  int uniqueSessions, @JsonKey(name: 'last_event_at')  DateTime? lastEventAt)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsStatsModel():
return $default(_that.totalEvents,_that.uniqueVisitors,_that.uniqueSessions,_that.lastEventAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_events')  int totalEvents, @JsonKey(name: 'unique_visitors')  int uniqueVisitors, @JsonKey(name: 'unique_sessions')  int uniqueSessions, @JsonKey(name: 'last_event_at')  DateTime? lastEventAt)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsStatsModel() when $default != null:
return $default(_that.totalEvents,_that.uniqueVisitors,_that.uniqueSessions,_that.lastEventAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsStatsModel implements AnalyticsStatsModel {
  const _AnalyticsStatsModel({@JsonKey(name: 'total_events') this.totalEvents = 0, @JsonKey(name: 'unique_visitors') this.uniqueVisitors = 0, @JsonKey(name: 'unique_sessions') this.uniqueSessions = 0, @JsonKey(name: 'last_event_at') this.lastEventAt});
  factory _AnalyticsStatsModel.fromJson(Map<String, dynamic> json) => _$AnalyticsStatsModelFromJson(json);

@override@JsonKey(name: 'total_events') final  int totalEvents;
@override@JsonKey(name: 'unique_visitors') final  int uniqueVisitors;
@override@JsonKey(name: 'unique_sessions') final  int uniqueSessions;
@override@JsonKey(name: 'last_event_at') final  DateTime? lastEventAt;

/// Create a copy of AnalyticsStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsStatsModelCopyWith<_AnalyticsStatsModel> get copyWith => __$AnalyticsStatsModelCopyWithImpl<_AnalyticsStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsStatsModel&&(identical(other.totalEvents, totalEvents) || other.totalEvents == totalEvents)&&(identical(other.uniqueVisitors, uniqueVisitors) || other.uniqueVisitors == uniqueVisitors)&&(identical(other.uniqueSessions, uniqueSessions) || other.uniqueSessions == uniqueSessions)&&(identical(other.lastEventAt, lastEventAt) || other.lastEventAt == lastEventAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalEvents,uniqueVisitors,uniqueSessions,lastEventAt);

@override
String toString() {
  return 'AnalyticsStatsModel(totalEvents: $totalEvents, uniqueVisitors: $uniqueVisitors, uniqueSessions: $uniqueSessions, lastEventAt: $lastEventAt)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsStatsModelCopyWith<$Res> implements $AnalyticsStatsModelCopyWith<$Res> {
  factory _$AnalyticsStatsModelCopyWith(_AnalyticsStatsModel value, $Res Function(_AnalyticsStatsModel) _then) = __$AnalyticsStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_events') int totalEvents,@JsonKey(name: 'unique_visitors') int uniqueVisitors,@JsonKey(name: 'unique_sessions') int uniqueSessions,@JsonKey(name: 'last_event_at') DateTime? lastEventAt
});




}
/// @nodoc
class __$AnalyticsStatsModelCopyWithImpl<$Res>
    implements _$AnalyticsStatsModelCopyWith<$Res> {
  __$AnalyticsStatsModelCopyWithImpl(this._self, this._then);

  final _AnalyticsStatsModel _self;
  final $Res Function(_AnalyticsStatsModel) _then;

/// Create a copy of AnalyticsStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalEvents = null,Object? uniqueVisitors = null,Object? uniqueSessions = null,Object? lastEventAt = freezed,}) {
  return _then(_AnalyticsStatsModel(
totalEvents: null == totalEvents ? _self.totalEvents : totalEvents // ignore: cast_nullable_to_non_nullable
as int,uniqueVisitors: null == uniqueVisitors ? _self.uniqueVisitors : uniqueVisitors // ignore: cast_nullable_to_non_nullable
as int,uniqueSessions: null == uniqueSessions ? _self.uniqueSessions : uniqueSessions // ignore: cast_nullable_to_non_nullable
as int,lastEventAt: freezed == lastEventAt ? _self.lastEventAt : lastEventAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

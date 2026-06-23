// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_events_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsEventsResponseModel {

 String? get apikey; List<AnalyticsEventModel> get events;
/// Create a copy of AnalyticsEventsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsEventsResponseModelCopyWith<AnalyticsEventsResponseModel> get copyWith => _$AnalyticsEventsResponseModelCopyWithImpl<AnalyticsEventsResponseModel>(this as AnalyticsEventsResponseModel, _$identity);

  /// Serializes this AnalyticsEventsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsEventsResponseModel&&(identical(other.apikey, apikey) || other.apikey == apikey)&&const DeepCollectionEquality().equals(other.events, events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apikey,const DeepCollectionEquality().hash(events));

@override
String toString() {
  return 'AnalyticsEventsResponseModel(apikey: $apikey, events: $events)';
}


}

/// @nodoc
abstract mixin class $AnalyticsEventsResponseModelCopyWith<$Res>  {
  factory $AnalyticsEventsResponseModelCopyWith(AnalyticsEventsResponseModel value, $Res Function(AnalyticsEventsResponseModel) _then) = _$AnalyticsEventsResponseModelCopyWithImpl;
@useResult
$Res call({
 String? apikey, List<AnalyticsEventModel> events
});




}
/// @nodoc
class _$AnalyticsEventsResponseModelCopyWithImpl<$Res>
    implements $AnalyticsEventsResponseModelCopyWith<$Res> {
  _$AnalyticsEventsResponseModelCopyWithImpl(this._self, this._then);

  final AnalyticsEventsResponseModel _self;
  final $Res Function(AnalyticsEventsResponseModel) _then;

/// Create a copy of AnalyticsEventsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apikey = freezed,Object? events = null,}) {
  return _then(_self.copyWith(
apikey: freezed == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String?,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<AnalyticsEventModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsEventsResponseModel].
extension AnalyticsEventsResponseModelPatterns on AnalyticsEventsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsEventsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsEventsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsEventsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsEventsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsEventsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsEventsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? apikey,  List<AnalyticsEventModel> events)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsEventsResponseModel() when $default != null:
return $default(_that.apikey,_that.events);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? apikey,  List<AnalyticsEventModel> events)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsEventsResponseModel():
return $default(_that.apikey,_that.events);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? apikey,  List<AnalyticsEventModel> events)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsEventsResponseModel() when $default != null:
return $default(_that.apikey,_that.events);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsEventsResponseModel extends AnalyticsEventsResponseModel {
  const _AnalyticsEventsResponseModel({this.apikey, final  List<AnalyticsEventModel> events = const []}): _events = events,super._();
  factory _AnalyticsEventsResponseModel.fromJson(Map<String, dynamic> json) => _$AnalyticsEventsResponseModelFromJson(json);

@override final  String? apikey;
 final  List<AnalyticsEventModel> _events;
@override@JsonKey() List<AnalyticsEventModel> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of AnalyticsEventsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsEventsResponseModelCopyWith<_AnalyticsEventsResponseModel> get copyWith => __$AnalyticsEventsResponseModelCopyWithImpl<_AnalyticsEventsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsEventsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsEventsResponseModel&&(identical(other.apikey, apikey) || other.apikey == apikey)&&const DeepCollectionEquality().equals(other._events, _events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,apikey,const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'AnalyticsEventsResponseModel(apikey: $apikey, events: $events)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsEventsResponseModelCopyWith<$Res> implements $AnalyticsEventsResponseModelCopyWith<$Res> {
  factory _$AnalyticsEventsResponseModelCopyWith(_AnalyticsEventsResponseModel value, $Res Function(_AnalyticsEventsResponseModel) _then) = __$AnalyticsEventsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? apikey, List<AnalyticsEventModel> events
});




}
/// @nodoc
class __$AnalyticsEventsResponseModelCopyWithImpl<$Res>
    implements _$AnalyticsEventsResponseModelCopyWith<$Res> {
  __$AnalyticsEventsResponseModelCopyWithImpl(this._self, this._then);

  final _AnalyticsEventsResponseModel _self;
  final $Res Function(_AnalyticsEventsResponseModel) _then;

/// Create a copy of AnalyticsEventsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apikey = freezed,Object? events = null,}) {
  return _then(_AnalyticsEventsResponseModel(
apikey: freezed == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String?,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<AnalyticsEventModel>,
  ));
}


}

// dart format on

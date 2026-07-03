// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_conversation_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiveConversationSummary {

 String get conversationId; String get siteApiKey; String get visitorLabel; String? get pageUrl; String? get city; String? get country; String? get visitId; LiveConversationStatus get status; DateTime get firstSeenAt; DateTime get lastActivityAt; int get unreadCount; String? get latestPreview; String? get latestEventType;
/// Create a copy of LiveConversationSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveConversationSummaryCopyWith<LiveConversationSummary> get copyWith => _$LiveConversationSummaryCopyWithImpl<LiveConversationSummary>(this as LiveConversationSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveConversationSummary&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.siteApiKey, siteApiKey) || other.siteApiKey == siteApiKey)&&(identical(other.visitorLabel, visitorLabel) || other.visitorLabel == visitorLabel)&&(identical(other.pageUrl, pageUrl) || other.pageUrl == pageUrl)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.visitId, visitId) || other.visitId == visitId)&&(identical(other.status, status) || other.status == status)&&(identical(other.firstSeenAt, firstSeenAt) || other.firstSeenAt == firstSeenAt)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.latestPreview, latestPreview) || other.latestPreview == latestPreview)&&(identical(other.latestEventType, latestEventType) || other.latestEventType == latestEventType));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,siteApiKey,visitorLabel,pageUrl,city,country,visitId,status,firstSeenAt,lastActivityAt,unreadCount,latestPreview,latestEventType);

@override
String toString() {
  return 'LiveConversationSummary(conversationId: $conversationId, siteApiKey: $siteApiKey, visitorLabel: $visitorLabel, pageUrl: $pageUrl, city: $city, country: $country, visitId: $visitId, status: $status, firstSeenAt: $firstSeenAt, lastActivityAt: $lastActivityAt, unreadCount: $unreadCount, latestPreview: $latestPreview, latestEventType: $latestEventType)';
}


}

/// @nodoc
abstract mixin class $LiveConversationSummaryCopyWith<$Res>  {
  factory $LiveConversationSummaryCopyWith(LiveConversationSummary value, $Res Function(LiveConversationSummary) _then) = _$LiveConversationSummaryCopyWithImpl;
@useResult
$Res call({
 String conversationId, String siteApiKey, String visitorLabel, String? pageUrl, String? city, String? country, String? visitId, LiveConversationStatus status, DateTime firstSeenAt, DateTime lastActivityAt, int unreadCount, String? latestPreview, String? latestEventType
});




}
/// @nodoc
class _$LiveConversationSummaryCopyWithImpl<$Res>
    implements $LiveConversationSummaryCopyWith<$Res> {
  _$LiveConversationSummaryCopyWithImpl(this._self, this._then);

  final LiveConversationSummary _self;
  final $Res Function(LiveConversationSummary) _then;

/// Create a copy of LiveConversationSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,Object? siteApiKey = null,Object? visitorLabel = null,Object? pageUrl = freezed,Object? city = freezed,Object? country = freezed,Object? visitId = freezed,Object? status = null,Object? firstSeenAt = null,Object? lastActivityAt = null,Object? unreadCount = null,Object? latestPreview = freezed,Object? latestEventType = freezed,}) {
  return _then(_self.copyWith(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,siteApiKey: null == siteApiKey ? _self.siteApiKey : siteApiKey // ignore: cast_nullable_to_non_nullable
as String,visitorLabel: null == visitorLabel ? _self.visitorLabel : visitorLabel // ignore: cast_nullable_to_non_nullable
as String,pageUrl: freezed == pageUrl ? _self.pageUrl : pageUrl // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,visitId: freezed == visitId ? _self.visitId : visitId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LiveConversationStatus,firstSeenAt: null == firstSeenAt ? _self.firstSeenAt : firstSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastActivityAt: null == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,latestPreview: freezed == latestPreview ? _self.latestPreview : latestPreview // ignore: cast_nullable_to_non_nullable
as String?,latestEventType: freezed == latestEventType ? _self.latestEventType : latestEventType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveConversationSummary].
extension LiveConversationSummaryPatterns on LiveConversationSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveConversationSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveConversationSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveConversationSummary value)  $default,){
final _that = this;
switch (_that) {
case _LiveConversationSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveConversationSummary value)?  $default,){
final _that = this;
switch (_that) {
case _LiveConversationSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String conversationId,  String siteApiKey,  String visitorLabel,  String? pageUrl,  String? city,  String? country,  String? visitId,  LiveConversationStatus status,  DateTime firstSeenAt,  DateTime lastActivityAt,  int unreadCount,  String? latestPreview,  String? latestEventType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveConversationSummary() when $default != null:
return $default(_that.conversationId,_that.siteApiKey,_that.visitorLabel,_that.pageUrl,_that.city,_that.country,_that.visitId,_that.status,_that.firstSeenAt,_that.lastActivityAt,_that.unreadCount,_that.latestPreview,_that.latestEventType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String conversationId,  String siteApiKey,  String visitorLabel,  String? pageUrl,  String? city,  String? country,  String? visitId,  LiveConversationStatus status,  DateTime firstSeenAt,  DateTime lastActivityAt,  int unreadCount,  String? latestPreview,  String? latestEventType)  $default,) {final _that = this;
switch (_that) {
case _LiveConversationSummary():
return $default(_that.conversationId,_that.siteApiKey,_that.visitorLabel,_that.pageUrl,_that.city,_that.country,_that.visitId,_that.status,_that.firstSeenAt,_that.lastActivityAt,_that.unreadCount,_that.latestPreview,_that.latestEventType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String conversationId,  String siteApiKey,  String visitorLabel,  String? pageUrl,  String? city,  String? country,  String? visitId,  LiveConversationStatus status,  DateTime firstSeenAt,  DateTime lastActivityAt,  int unreadCount,  String? latestPreview,  String? latestEventType)?  $default,) {final _that = this;
switch (_that) {
case _LiveConversationSummary() when $default != null:
return $default(_that.conversationId,_that.siteApiKey,_that.visitorLabel,_that.pageUrl,_that.city,_that.country,_that.visitId,_that.status,_that.firstSeenAt,_that.lastActivityAt,_that.unreadCount,_that.latestPreview,_that.latestEventType);case _:
  return null;

}
}

}

/// @nodoc


class _LiveConversationSummary implements LiveConversationSummary {
  const _LiveConversationSummary({required this.conversationId, required this.siteApiKey, required this.visitorLabel, this.pageUrl, this.city, this.country, this.visitId, required this.status, required this.firstSeenAt, required this.lastActivityAt, this.unreadCount = 0, this.latestPreview, this.latestEventType});
  

@override final  String conversationId;
@override final  String siteApiKey;
@override final  String visitorLabel;
@override final  String? pageUrl;
@override final  String? city;
@override final  String? country;
@override final  String? visitId;
@override final  LiveConversationStatus status;
@override final  DateTime firstSeenAt;
@override final  DateTime lastActivityAt;
@override@JsonKey() final  int unreadCount;
@override final  String? latestPreview;
@override final  String? latestEventType;

/// Create a copy of LiveConversationSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveConversationSummaryCopyWith<_LiveConversationSummary> get copyWith => __$LiveConversationSummaryCopyWithImpl<_LiveConversationSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveConversationSummary&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.siteApiKey, siteApiKey) || other.siteApiKey == siteApiKey)&&(identical(other.visitorLabel, visitorLabel) || other.visitorLabel == visitorLabel)&&(identical(other.pageUrl, pageUrl) || other.pageUrl == pageUrl)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.visitId, visitId) || other.visitId == visitId)&&(identical(other.status, status) || other.status == status)&&(identical(other.firstSeenAt, firstSeenAt) || other.firstSeenAt == firstSeenAt)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.latestPreview, latestPreview) || other.latestPreview == latestPreview)&&(identical(other.latestEventType, latestEventType) || other.latestEventType == latestEventType));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,siteApiKey,visitorLabel,pageUrl,city,country,visitId,status,firstSeenAt,lastActivityAt,unreadCount,latestPreview,latestEventType);

@override
String toString() {
  return 'LiveConversationSummary(conversationId: $conversationId, siteApiKey: $siteApiKey, visitorLabel: $visitorLabel, pageUrl: $pageUrl, city: $city, country: $country, visitId: $visitId, status: $status, firstSeenAt: $firstSeenAt, lastActivityAt: $lastActivityAt, unreadCount: $unreadCount, latestPreview: $latestPreview, latestEventType: $latestEventType)';
}


}

/// @nodoc
abstract mixin class _$LiveConversationSummaryCopyWith<$Res> implements $LiveConversationSummaryCopyWith<$Res> {
  factory _$LiveConversationSummaryCopyWith(_LiveConversationSummary value, $Res Function(_LiveConversationSummary) _then) = __$LiveConversationSummaryCopyWithImpl;
@override @useResult
$Res call({
 String conversationId, String siteApiKey, String visitorLabel, String? pageUrl, String? city, String? country, String? visitId, LiveConversationStatus status, DateTime firstSeenAt, DateTime lastActivityAt, int unreadCount, String? latestPreview, String? latestEventType
});




}
/// @nodoc
class __$LiveConversationSummaryCopyWithImpl<$Res>
    implements _$LiveConversationSummaryCopyWith<$Res> {
  __$LiveConversationSummaryCopyWithImpl(this._self, this._then);

  final _LiveConversationSummary _self;
  final $Res Function(_LiveConversationSummary) _then;

/// Create a copy of LiveConversationSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? siteApiKey = null,Object? visitorLabel = null,Object? pageUrl = freezed,Object? city = freezed,Object? country = freezed,Object? visitId = freezed,Object? status = null,Object? firstSeenAt = null,Object? lastActivityAt = null,Object? unreadCount = null,Object? latestPreview = freezed,Object? latestEventType = freezed,}) {
  return _then(_LiveConversationSummary(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,siteApiKey: null == siteApiKey ? _self.siteApiKey : siteApiKey // ignore: cast_nullable_to_non_nullable
as String,visitorLabel: null == visitorLabel ? _self.visitorLabel : visitorLabel // ignore: cast_nullable_to_non_nullable
as String,pageUrl: freezed == pageUrl ? _self.pageUrl : pageUrl // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,visitId: freezed == visitId ? _self.visitId : visitId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LiveConversationStatus,firstSeenAt: null == firstSeenAt ? _self.firstSeenAt : firstSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastActivityAt: null == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,latestPreview: freezed == latestPreview ? _self.latestPreview : latestPreview // ignore: cast_nullable_to_non_nullable
as String?,latestEventType: freezed == latestEventType ? _self.latestEventType : latestEventType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

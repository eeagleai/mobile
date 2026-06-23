// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsEventModel {

@JsonKey(name: 'event_type') String? get eventType; String? get endpoint; String? get method; String? get outcome;@JsonKey(name: 'page_url') String? get pageUrl; String? get country; String? get city; String? get region; String? get apikey;@JsonKey(name: 'site_id') String? get siteId;@JsonKey(name: 'visit_id') String? get visitId;@JsonKey(name: 'conversation_id') String? get conversationId;@JsonKey(name: 'conversation_session_id') String? get conversationSessionId; String? get message; String? get preview;@JsonKey(name: 'status_code') int? get statusCode;@JsonKey(name: 'attachment_count') int? get attachmentCount;@JsonKey(name: 'waiting_for_visitor_reply') bool? get waitingForVisitorReply;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'opened_at') DateTime? get openedAt;
/// Create a copy of AnalyticsEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsEventModelCopyWith<AnalyticsEventModel> get copyWith => _$AnalyticsEventModelCopyWithImpl<AnalyticsEventModel>(this as AnalyticsEventModel, _$identity);

  /// Serializes this AnalyticsEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsEventModel&&(identical(other.eventType, eventType) || other.eventType == eventType)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.method, method) || other.method == method)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.pageUrl, pageUrl) || other.pageUrl == pageUrl)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.visitId, visitId) || other.visitId == visitId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.conversationSessionId, conversationSessionId) || other.conversationSessionId == conversationSessionId)&&(identical(other.message, message) || other.message == message)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.attachmentCount, attachmentCount) || other.attachmentCount == attachmentCount)&&(identical(other.waitingForVisitorReply, waitingForVisitorReply) || other.waitingForVisitorReply == waitingForVisitorReply)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.openedAt, openedAt) || other.openedAt == openedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,eventType,endpoint,method,outcome,pageUrl,country,city,region,apikey,siteId,visitId,conversationId,conversationSessionId,message,preview,statusCode,attachmentCount,waitingForVisitorReply,createdAt,openedAt]);

@override
String toString() {
  return 'AnalyticsEventModel(eventType: $eventType, endpoint: $endpoint, method: $method, outcome: $outcome, pageUrl: $pageUrl, country: $country, city: $city, region: $region, apikey: $apikey, siteId: $siteId, visitId: $visitId, conversationId: $conversationId, conversationSessionId: $conversationSessionId, message: $message, preview: $preview, statusCode: $statusCode, attachmentCount: $attachmentCount, waitingForVisitorReply: $waitingForVisitorReply, createdAt: $createdAt, openedAt: $openedAt)';
}


}

/// @nodoc
abstract mixin class $AnalyticsEventModelCopyWith<$Res>  {
  factory $AnalyticsEventModelCopyWith(AnalyticsEventModel value, $Res Function(AnalyticsEventModel) _then) = _$AnalyticsEventModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'event_type') String? eventType, String? endpoint, String? method, String? outcome,@JsonKey(name: 'page_url') String? pageUrl, String? country, String? city, String? region, String? apikey,@JsonKey(name: 'site_id') String? siteId,@JsonKey(name: 'visit_id') String? visitId,@JsonKey(name: 'conversation_id') String? conversationId,@JsonKey(name: 'conversation_session_id') String? conversationSessionId, String? message, String? preview,@JsonKey(name: 'status_code') int? statusCode,@JsonKey(name: 'attachment_count') int? attachmentCount,@JsonKey(name: 'waiting_for_visitor_reply') bool? waitingForVisitorReply,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'opened_at') DateTime? openedAt
});




}
/// @nodoc
class _$AnalyticsEventModelCopyWithImpl<$Res>
    implements $AnalyticsEventModelCopyWith<$Res> {
  _$AnalyticsEventModelCopyWithImpl(this._self, this._then);

  final AnalyticsEventModel _self;
  final $Res Function(AnalyticsEventModel) _then;

/// Create a copy of AnalyticsEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eventType = freezed,Object? endpoint = freezed,Object? method = freezed,Object? outcome = freezed,Object? pageUrl = freezed,Object? country = freezed,Object? city = freezed,Object? region = freezed,Object? apikey = freezed,Object? siteId = freezed,Object? visitId = freezed,Object? conversationId = freezed,Object? conversationSessionId = freezed,Object? message = freezed,Object? preview = freezed,Object? statusCode = freezed,Object? attachmentCount = freezed,Object? waitingForVisitorReply = freezed,Object? createdAt = freezed,Object? openedAt = freezed,}) {
  return _then(_self.copyWith(
eventType: freezed == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as String?,endpoint: freezed == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as String?,pageUrl: freezed == pageUrl ? _self.pageUrl : pageUrl // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,apikey: freezed == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String?,siteId: freezed == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String?,visitId: freezed == visitId ? _self.visitId : visitId // ignore: cast_nullable_to_non_nullable
as String?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,conversationSessionId: freezed == conversationSessionId ? _self.conversationSessionId : conversationSessionId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,attachmentCount: freezed == attachmentCount ? _self.attachmentCount : attachmentCount // ignore: cast_nullable_to_non_nullable
as int?,waitingForVisitorReply: freezed == waitingForVisitorReply ? _self.waitingForVisitorReply : waitingForVisitorReply // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,openedAt: freezed == openedAt ? _self.openedAt : openedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsEventModel].
extension AnalyticsEventModelPatterns on AnalyticsEventModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsEventModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsEventModel value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsEventModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsEventModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'event_type')  String? eventType,  String? endpoint,  String? method,  String? outcome, @JsonKey(name: 'page_url')  String? pageUrl,  String? country,  String? city,  String? region,  String? apikey, @JsonKey(name: 'site_id')  String? siteId, @JsonKey(name: 'visit_id')  String? visitId, @JsonKey(name: 'conversation_id')  String? conversationId, @JsonKey(name: 'conversation_session_id')  String? conversationSessionId,  String? message,  String? preview, @JsonKey(name: 'status_code')  int? statusCode, @JsonKey(name: 'attachment_count')  int? attachmentCount, @JsonKey(name: 'waiting_for_visitor_reply')  bool? waitingForVisitorReply, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'opened_at')  DateTime? openedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsEventModel() when $default != null:
return $default(_that.eventType,_that.endpoint,_that.method,_that.outcome,_that.pageUrl,_that.country,_that.city,_that.region,_that.apikey,_that.siteId,_that.visitId,_that.conversationId,_that.conversationSessionId,_that.message,_that.preview,_that.statusCode,_that.attachmentCount,_that.waitingForVisitorReply,_that.createdAt,_that.openedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'event_type')  String? eventType,  String? endpoint,  String? method,  String? outcome, @JsonKey(name: 'page_url')  String? pageUrl,  String? country,  String? city,  String? region,  String? apikey, @JsonKey(name: 'site_id')  String? siteId, @JsonKey(name: 'visit_id')  String? visitId, @JsonKey(name: 'conversation_id')  String? conversationId, @JsonKey(name: 'conversation_session_id')  String? conversationSessionId,  String? message,  String? preview, @JsonKey(name: 'status_code')  int? statusCode, @JsonKey(name: 'attachment_count')  int? attachmentCount, @JsonKey(name: 'waiting_for_visitor_reply')  bool? waitingForVisitorReply, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'opened_at')  DateTime? openedAt)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsEventModel():
return $default(_that.eventType,_that.endpoint,_that.method,_that.outcome,_that.pageUrl,_that.country,_that.city,_that.region,_that.apikey,_that.siteId,_that.visitId,_that.conversationId,_that.conversationSessionId,_that.message,_that.preview,_that.statusCode,_that.attachmentCount,_that.waitingForVisitorReply,_that.createdAt,_that.openedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'event_type')  String? eventType,  String? endpoint,  String? method,  String? outcome, @JsonKey(name: 'page_url')  String? pageUrl,  String? country,  String? city,  String? region,  String? apikey, @JsonKey(name: 'site_id')  String? siteId, @JsonKey(name: 'visit_id')  String? visitId, @JsonKey(name: 'conversation_id')  String? conversationId, @JsonKey(name: 'conversation_session_id')  String? conversationSessionId,  String? message,  String? preview, @JsonKey(name: 'status_code')  int? statusCode, @JsonKey(name: 'attachment_count')  int? attachmentCount, @JsonKey(name: 'waiting_for_visitor_reply')  bool? waitingForVisitorReply, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'opened_at')  DateTime? openedAt)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsEventModel() when $default != null:
return $default(_that.eventType,_that.endpoint,_that.method,_that.outcome,_that.pageUrl,_that.country,_that.city,_that.region,_that.apikey,_that.siteId,_that.visitId,_that.conversationId,_that.conversationSessionId,_that.message,_that.preview,_that.statusCode,_that.attachmentCount,_that.waitingForVisitorReply,_that.createdAt,_that.openedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsEventModel extends AnalyticsEventModel {
  const _AnalyticsEventModel({@JsonKey(name: 'event_type') this.eventType, this.endpoint, this.method, this.outcome, @JsonKey(name: 'page_url') this.pageUrl, this.country, this.city, this.region, this.apikey, @JsonKey(name: 'site_id') this.siteId, @JsonKey(name: 'visit_id') this.visitId, @JsonKey(name: 'conversation_id') this.conversationId, @JsonKey(name: 'conversation_session_id') this.conversationSessionId, this.message, this.preview, @JsonKey(name: 'status_code') this.statusCode, @JsonKey(name: 'attachment_count') this.attachmentCount, @JsonKey(name: 'waiting_for_visitor_reply') this.waitingForVisitorReply, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'opened_at') this.openedAt}): super._();
  factory _AnalyticsEventModel.fromJson(Map<String, dynamic> json) => _$AnalyticsEventModelFromJson(json);

@override@JsonKey(name: 'event_type') final  String? eventType;
@override final  String? endpoint;
@override final  String? method;
@override final  String? outcome;
@override@JsonKey(name: 'page_url') final  String? pageUrl;
@override final  String? country;
@override final  String? city;
@override final  String? region;
@override final  String? apikey;
@override@JsonKey(name: 'site_id') final  String? siteId;
@override@JsonKey(name: 'visit_id') final  String? visitId;
@override@JsonKey(name: 'conversation_id') final  String? conversationId;
@override@JsonKey(name: 'conversation_session_id') final  String? conversationSessionId;
@override final  String? message;
@override final  String? preview;
@override@JsonKey(name: 'status_code') final  int? statusCode;
@override@JsonKey(name: 'attachment_count') final  int? attachmentCount;
@override@JsonKey(name: 'waiting_for_visitor_reply') final  bool? waitingForVisitorReply;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'opened_at') final  DateTime? openedAt;

/// Create a copy of AnalyticsEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsEventModelCopyWith<_AnalyticsEventModel> get copyWith => __$AnalyticsEventModelCopyWithImpl<_AnalyticsEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsEventModel&&(identical(other.eventType, eventType) || other.eventType == eventType)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.method, method) || other.method == method)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.pageUrl, pageUrl) || other.pageUrl == pageUrl)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.apikey, apikey) || other.apikey == apikey)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.visitId, visitId) || other.visitId == visitId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.conversationSessionId, conversationSessionId) || other.conversationSessionId == conversationSessionId)&&(identical(other.message, message) || other.message == message)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.attachmentCount, attachmentCount) || other.attachmentCount == attachmentCount)&&(identical(other.waitingForVisitorReply, waitingForVisitorReply) || other.waitingForVisitorReply == waitingForVisitorReply)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.openedAt, openedAt) || other.openedAt == openedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,eventType,endpoint,method,outcome,pageUrl,country,city,region,apikey,siteId,visitId,conversationId,conversationSessionId,message,preview,statusCode,attachmentCount,waitingForVisitorReply,createdAt,openedAt]);

@override
String toString() {
  return 'AnalyticsEventModel(eventType: $eventType, endpoint: $endpoint, method: $method, outcome: $outcome, pageUrl: $pageUrl, country: $country, city: $city, region: $region, apikey: $apikey, siteId: $siteId, visitId: $visitId, conversationId: $conversationId, conversationSessionId: $conversationSessionId, message: $message, preview: $preview, statusCode: $statusCode, attachmentCount: $attachmentCount, waitingForVisitorReply: $waitingForVisitorReply, createdAt: $createdAt, openedAt: $openedAt)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsEventModelCopyWith<$Res> implements $AnalyticsEventModelCopyWith<$Res> {
  factory _$AnalyticsEventModelCopyWith(_AnalyticsEventModel value, $Res Function(_AnalyticsEventModel) _then) = __$AnalyticsEventModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'event_type') String? eventType, String? endpoint, String? method, String? outcome,@JsonKey(name: 'page_url') String? pageUrl, String? country, String? city, String? region, String? apikey,@JsonKey(name: 'site_id') String? siteId,@JsonKey(name: 'visit_id') String? visitId,@JsonKey(name: 'conversation_id') String? conversationId,@JsonKey(name: 'conversation_session_id') String? conversationSessionId, String? message, String? preview,@JsonKey(name: 'status_code') int? statusCode,@JsonKey(name: 'attachment_count') int? attachmentCount,@JsonKey(name: 'waiting_for_visitor_reply') bool? waitingForVisitorReply,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'opened_at') DateTime? openedAt
});




}
/// @nodoc
class __$AnalyticsEventModelCopyWithImpl<$Res>
    implements _$AnalyticsEventModelCopyWith<$Res> {
  __$AnalyticsEventModelCopyWithImpl(this._self, this._then);

  final _AnalyticsEventModel _self;
  final $Res Function(_AnalyticsEventModel) _then;

/// Create a copy of AnalyticsEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eventType = freezed,Object? endpoint = freezed,Object? method = freezed,Object? outcome = freezed,Object? pageUrl = freezed,Object? country = freezed,Object? city = freezed,Object? region = freezed,Object? apikey = freezed,Object? siteId = freezed,Object? visitId = freezed,Object? conversationId = freezed,Object? conversationSessionId = freezed,Object? message = freezed,Object? preview = freezed,Object? statusCode = freezed,Object? attachmentCount = freezed,Object? waitingForVisitorReply = freezed,Object? createdAt = freezed,Object? openedAt = freezed,}) {
  return _then(_AnalyticsEventModel(
eventType: freezed == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as String?,endpoint: freezed == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as String?,pageUrl: freezed == pageUrl ? _self.pageUrl : pageUrl // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,apikey: freezed == apikey ? _self.apikey : apikey // ignore: cast_nullable_to_non_nullable
as String?,siteId: freezed == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String?,visitId: freezed == visitId ? _self.visitId : visitId // ignore: cast_nullable_to_non_nullable
as String?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,conversationSessionId: freezed == conversationSessionId ? _self.conversationSessionId : conversationSessionId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,attachmentCount: freezed == attachmentCount ? _self.attachmentCount : attachmentCount // ignore: cast_nullable_to_non_nullable
as int?,waitingForVisitorReply: freezed == waitingForVisitorReply ? _self.waitingForVisitorReply : waitingForVisitorReply // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,openedAt: freezed == openedAt ? _self.openedAt : openedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

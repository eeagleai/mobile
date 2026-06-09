// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_token_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatTokenResponseModel {

 String get token;@JsonKey(name: 'ws_url') String get wsUrl;@JsonKey(name: 'conversation_id') String get conversationId;@JsonKey(name: 'conversation_session_id') String get conversationSessionId;@JsonKey(name: 'route_key') String get routeKey; ChatSessionConfigModel get config;
/// Create a copy of ChatTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatTokenResponseModelCopyWith<ChatTokenResponseModel> get copyWith => _$ChatTokenResponseModelCopyWithImpl<ChatTokenResponseModel>(this as ChatTokenResponseModel, _$identity);

  /// Serializes this ChatTokenResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatTokenResponseModel&&(identical(other.token, token) || other.token == token)&&(identical(other.wsUrl, wsUrl) || other.wsUrl == wsUrl)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.conversationSessionId, conversationSessionId) || other.conversationSessionId == conversationSessionId)&&(identical(other.routeKey, routeKey) || other.routeKey == routeKey)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,wsUrl,conversationId,conversationSessionId,routeKey,config);

@override
String toString() {
  return 'ChatTokenResponseModel(token: $token, wsUrl: $wsUrl, conversationId: $conversationId, conversationSessionId: $conversationSessionId, routeKey: $routeKey, config: $config)';
}


}

/// @nodoc
abstract mixin class $ChatTokenResponseModelCopyWith<$Res>  {
  factory $ChatTokenResponseModelCopyWith(ChatTokenResponseModel value, $Res Function(ChatTokenResponseModel) _then) = _$ChatTokenResponseModelCopyWithImpl;
@useResult
$Res call({
 String token,@JsonKey(name: 'ws_url') String wsUrl,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'conversation_session_id') String conversationSessionId,@JsonKey(name: 'route_key') String routeKey, ChatSessionConfigModel config
});


$ChatSessionConfigModelCopyWith<$Res> get config;

}
/// @nodoc
class _$ChatTokenResponseModelCopyWithImpl<$Res>
    implements $ChatTokenResponseModelCopyWith<$Res> {
  _$ChatTokenResponseModelCopyWithImpl(this._self, this._then);

  final ChatTokenResponseModel _self;
  final $Res Function(ChatTokenResponseModel) _then;

/// Create a copy of ChatTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? wsUrl = null,Object? conversationId = null,Object? conversationSessionId = null,Object? routeKey = null,Object? config = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,wsUrl: null == wsUrl ? _self.wsUrl : wsUrl // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,conversationSessionId: null == conversationSessionId ? _self.conversationSessionId : conversationSessionId // ignore: cast_nullable_to_non_nullable
as String,routeKey: null == routeKey ? _self.routeKey : routeKey // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ChatSessionConfigModel,
  ));
}
/// Create a copy of ChatTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatSessionConfigModelCopyWith<$Res> get config {
  
  return $ChatSessionConfigModelCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatTokenResponseModel].
extension ChatTokenResponseModelPatterns on ChatTokenResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatTokenResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatTokenResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatTokenResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatTokenResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatTokenResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatTokenResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'ws_url')  String wsUrl, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'conversation_session_id')  String conversationSessionId, @JsonKey(name: 'route_key')  String routeKey,  ChatSessionConfigModel config)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatTokenResponseModel() when $default != null:
return $default(_that.token,_that.wsUrl,_that.conversationId,_that.conversationSessionId,_that.routeKey,_that.config);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'ws_url')  String wsUrl, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'conversation_session_id')  String conversationSessionId, @JsonKey(name: 'route_key')  String routeKey,  ChatSessionConfigModel config)  $default,) {final _that = this;
switch (_that) {
case _ChatTokenResponseModel():
return $default(_that.token,_that.wsUrl,_that.conversationId,_that.conversationSessionId,_that.routeKey,_that.config);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token, @JsonKey(name: 'ws_url')  String wsUrl, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'conversation_session_id')  String conversationSessionId, @JsonKey(name: 'route_key')  String routeKey,  ChatSessionConfigModel config)?  $default,) {final _that = this;
switch (_that) {
case _ChatTokenResponseModel() when $default != null:
return $default(_that.token,_that.wsUrl,_that.conversationId,_that.conversationSessionId,_that.routeKey,_that.config);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatTokenResponseModel extends ChatTokenResponseModel {
  const _ChatTokenResponseModel({required this.token, @JsonKey(name: 'ws_url') required this.wsUrl, @JsonKey(name: 'conversation_id') required this.conversationId, @JsonKey(name: 'conversation_session_id') required this.conversationSessionId, @JsonKey(name: 'route_key') required this.routeKey, required this.config}): super._();
  factory _ChatTokenResponseModel.fromJson(Map<String, dynamic> json) => _$ChatTokenResponseModelFromJson(json);

@override final  String token;
@override@JsonKey(name: 'ws_url') final  String wsUrl;
@override@JsonKey(name: 'conversation_id') final  String conversationId;
@override@JsonKey(name: 'conversation_session_id') final  String conversationSessionId;
@override@JsonKey(name: 'route_key') final  String routeKey;
@override final  ChatSessionConfigModel config;

/// Create a copy of ChatTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatTokenResponseModelCopyWith<_ChatTokenResponseModel> get copyWith => __$ChatTokenResponseModelCopyWithImpl<_ChatTokenResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatTokenResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatTokenResponseModel&&(identical(other.token, token) || other.token == token)&&(identical(other.wsUrl, wsUrl) || other.wsUrl == wsUrl)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.conversationSessionId, conversationSessionId) || other.conversationSessionId == conversationSessionId)&&(identical(other.routeKey, routeKey) || other.routeKey == routeKey)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,wsUrl,conversationId,conversationSessionId,routeKey,config);

@override
String toString() {
  return 'ChatTokenResponseModel(token: $token, wsUrl: $wsUrl, conversationId: $conversationId, conversationSessionId: $conversationSessionId, routeKey: $routeKey, config: $config)';
}


}

/// @nodoc
abstract mixin class _$ChatTokenResponseModelCopyWith<$Res> implements $ChatTokenResponseModelCopyWith<$Res> {
  factory _$ChatTokenResponseModelCopyWith(_ChatTokenResponseModel value, $Res Function(_ChatTokenResponseModel) _then) = __$ChatTokenResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String token,@JsonKey(name: 'ws_url') String wsUrl,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'conversation_session_id') String conversationSessionId,@JsonKey(name: 'route_key') String routeKey, ChatSessionConfigModel config
});


@override $ChatSessionConfigModelCopyWith<$Res> get config;

}
/// @nodoc
class __$ChatTokenResponseModelCopyWithImpl<$Res>
    implements _$ChatTokenResponseModelCopyWith<$Res> {
  __$ChatTokenResponseModelCopyWithImpl(this._self, this._then);

  final _ChatTokenResponseModel _self;
  final $Res Function(_ChatTokenResponseModel) _then;

/// Create a copy of ChatTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? wsUrl = null,Object? conversationId = null,Object? conversationSessionId = null,Object? routeKey = null,Object? config = null,}) {
  return _then(_ChatTokenResponseModel(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,wsUrl: null == wsUrl ? _self.wsUrl : wsUrl // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,conversationSessionId: null == conversationSessionId ? _self.conversationSessionId : conversationSessionId // ignore: cast_nullable_to_non_nullable
as String,routeKey: null == routeKey ? _self.routeKey : routeKey // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ChatSessionConfigModel,
  ));
}

/// Create a copy of ChatTokenResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatSessionConfigModelCopyWith<$Res> get config {
  
  return $ChatSessionConfigModelCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on

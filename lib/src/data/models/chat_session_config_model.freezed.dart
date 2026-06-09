// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_session_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatSessionConfigModel {

@JsonKey(name: 'pageCaptureEnabled') bool? get pageCaptureEnabled;@JsonKey(name: 'maxPageContentLength') int? get maxPageContentLength;@JsonKey(name: 'liveEditEnabled') bool? get liveEditEnabled;@JsonKey(name: 'canLiveEdit') bool? get canLiveEdit; int? get remaining;
/// Create a copy of ChatSessionConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatSessionConfigModelCopyWith<ChatSessionConfigModel> get copyWith => _$ChatSessionConfigModelCopyWithImpl<ChatSessionConfigModel>(this as ChatSessionConfigModel, _$identity);

  /// Serializes this ChatSessionConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSessionConfigModel&&(identical(other.pageCaptureEnabled, pageCaptureEnabled) || other.pageCaptureEnabled == pageCaptureEnabled)&&(identical(other.maxPageContentLength, maxPageContentLength) || other.maxPageContentLength == maxPageContentLength)&&(identical(other.liveEditEnabled, liveEditEnabled) || other.liveEditEnabled == liveEditEnabled)&&(identical(other.canLiveEdit, canLiveEdit) || other.canLiveEdit == canLiveEdit)&&(identical(other.remaining, remaining) || other.remaining == remaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageCaptureEnabled,maxPageContentLength,liveEditEnabled,canLiveEdit,remaining);

@override
String toString() {
  return 'ChatSessionConfigModel(pageCaptureEnabled: $pageCaptureEnabled, maxPageContentLength: $maxPageContentLength, liveEditEnabled: $liveEditEnabled, canLiveEdit: $canLiveEdit, remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class $ChatSessionConfigModelCopyWith<$Res>  {
  factory $ChatSessionConfigModelCopyWith(ChatSessionConfigModel value, $Res Function(ChatSessionConfigModel) _then) = _$ChatSessionConfigModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'pageCaptureEnabled') bool? pageCaptureEnabled,@JsonKey(name: 'maxPageContentLength') int? maxPageContentLength,@JsonKey(name: 'liveEditEnabled') bool? liveEditEnabled,@JsonKey(name: 'canLiveEdit') bool? canLiveEdit, int? remaining
});




}
/// @nodoc
class _$ChatSessionConfigModelCopyWithImpl<$Res>
    implements $ChatSessionConfigModelCopyWith<$Res> {
  _$ChatSessionConfigModelCopyWithImpl(this._self, this._then);

  final ChatSessionConfigModel _self;
  final $Res Function(ChatSessionConfigModel) _then;

/// Create a copy of ChatSessionConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageCaptureEnabled = freezed,Object? maxPageContentLength = freezed,Object? liveEditEnabled = freezed,Object? canLiveEdit = freezed,Object? remaining = freezed,}) {
  return _then(_self.copyWith(
pageCaptureEnabled: freezed == pageCaptureEnabled ? _self.pageCaptureEnabled : pageCaptureEnabled // ignore: cast_nullable_to_non_nullable
as bool?,maxPageContentLength: freezed == maxPageContentLength ? _self.maxPageContentLength : maxPageContentLength // ignore: cast_nullable_to_non_nullable
as int?,liveEditEnabled: freezed == liveEditEnabled ? _self.liveEditEnabled : liveEditEnabled // ignore: cast_nullable_to_non_nullable
as bool?,canLiveEdit: freezed == canLiveEdit ? _self.canLiveEdit : canLiveEdit // ignore: cast_nullable_to_non_nullable
as bool?,remaining: freezed == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatSessionConfigModel].
extension ChatSessionConfigModelPatterns on ChatSessionConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatSessionConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatSessionConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatSessionConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatSessionConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatSessionConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatSessionConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'pageCaptureEnabled')  bool? pageCaptureEnabled, @JsonKey(name: 'maxPageContentLength')  int? maxPageContentLength, @JsonKey(name: 'liveEditEnabled')  bool? liveEditEnabled, @JsonKey(name: 'canLiveEdit')  bool? canLiveEdit,  int? remaining)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatSessionConfigModel() when $default != null:
return $default(_that.pageCaptureEnabled,_that.maxPageContentLength,_that.liveEditEnabled,_that.canLiveEdit,_that.remaining);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'pageCaptureEnabled')  bool? pageCaptureEnabled, @JsonKey(name: 'maxPageContentLength')  int? maxPageContentLength, @JsonKey(name: 'liveEditEnabled')  bool? liveEditEnabled, @JsonKey(name: 'canLiveEdit')  bool? canLiveEdit,  int? remaining)  $default,) {final _that = this;
switch (_that) {
case _ChatSessionConfigModel():
return $default(_that.pageCaptureEnabled,_that.maxPageContentLength,_that.liveEditEnabled,_that.canLiveEdit,_that.remaining);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'pageCaptureEnabled')  bool? pageCaptureEnabled, @JsonKey(name: 'maxPageContentLength')  int? maxPageContentLength, @JsonKey(name: 'liveEditEnabled')  bool? liveEditEnabled, @JsonKey(name: 'canLiveEdit')  bool? canLiveEdit,  int? remaining)?  $default,) {final _that = this;
switch (_that) {
case _ChatSessionConfigModel() when $default != null:
return $default(_that.pageCaptureEnabled,_that.maxPageContentLength,_that.liveEditEnabled,_that.canLiveEdit,_that.remaining);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatSessionConfigModel extends ChatSessionConfigModel {
  const _ChatSessionConfigModel({@JsonKey(name: 'pageCaptureEnabled') this.pageCaptureEnabled, @JsonKey(name: 'maxPageContentLength') this.maxPageContentLength, @JsonKey(name: 'liveEditEnabled') this.liveEditEnabled, @JsonKey(name: 'canLiveEdit') this.canLiveEdit, this.remaining}): super._();
  factory _ChatSessionConfigModel.fromJson(Map<String, dynamic> json) => _$ChatSessionConfigModelFromJson(json);

@override@JsonKey(name: 'pageCaptureEnabled') final  bool? pageCaptureEnabled;
@override@JsonKey(name: 'maxPageContentLength') final  int? maxPageContentLength;
@override@JsonKey(name: 'liveEditEnabled') final  bool? liveEditEnabled;
@override@JsonKey(name: 'canLiveEdit') final  bool? canLiveEdit;
@override final  int? remaining;

/// Create a copy of ChatSessionConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatSessionConfigModelCopyWith<_ChatSessionConfigModel> get copyWith => __$ChatSessionConfigModelCopyWithImpl<_ChatSessionConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatSessionConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatSessionConfigModel&&(identical(other.pageCaptureEnabled, pageCaptureEnabled) || other.pageCaptureEnabled == pageCaptureEnabled)&&(identical(other.maxPageContentLength, maxPageContentLength) || other.maxPageContentLength == maxPageContentLength)&&(identical(other.liveEditEnabled, liveEditEnabled) || other.liveEditEnabled == liveEditEnabled)&&(identical(other.canLiveEdit, canLiveEdit) || other.canLiveEdit == canLiveEdit)&&(identical(other.remaining, remaining) || other.remaining == remaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageCaptureEnabled,maxPageContentLength,liveEditEnabled,canLiveEdit,remaining);

@override
String toString() {
  return 'ChatSessionConfigModel(pageCaptureEnabled: $pageCaptureEnabled, maxPageContentLength: $maxPageContentLength, liveEditEnabled: $liveEditEnabled, canLiveEdit: $canLiveEdit, remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class _$ChatSessionConfigModelCopyWith<$Res> implements $ChatSessionConfigModelCopyWith<$Res> {
  factory _$ChatSessionConfigModelCopyWith(_ChatSessionConfigModel value, $Res Function(_ChatSessionConfigModel) _then) = __$ChatSessionConfigModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'pageCaptureEnabled') bool? pageCaptureEnabled,@JsonKey(name: 'maxPageContentLength') int? maxPageContentLength,@JsonKey(name: 'liveEditEnabled') bool? liveEditEnabled,@JsonKey(name: 'canLiveEdit') bool? canLiveEdit, int? remaining
});




}
/// @nodoc
class __$ChatSessionConfigModelCopyWithImpl<$Res>
    implements _$ChatSessionConfigModelCopyWith<$Res> {
  __$ChatSessionConfigModelCopyWithImpl(this._self, this._then);

  final _ChatSessionConfigModel _self;
  final $Res Function(_ChatSessionConfigModel) _then;

/// Create a copy of ChatSessionConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageCaptureEnabled = freezed,Object? maxPageContentLength = freezed,Object? liveEditEnabled = freezed,Object? canLiveEdit = freezed,Object? remaining = freezed,}) {
  return _then(_ChatSessionConfigModel(
pageCaptureEnabled: freezed == pageCaptureEnabled ? _self.pageCaptureEnabled : pageCaptureEnabled // ignore: cast_nullable_to_non_nullable
as bool?,maxPageContentLength: freezed == maxPageContentLength ? _self.maxPageContentLength : maxPageContentLength // ignore: cast_nullable_to_non_nullable
as int?,liveEditEnabled: freezed == liveEditEnabled ? _self.liveEditEnabled : liveEditEnabled // ignore: cast_nullable_to_non_nullable
as bool?,canLiveEdit: freezed == canLiveEdit ? _self.canLiveEdit : canLiveEdit // ignore: cast_nullable_to_non_nullable
as bool?,remaining: freezed == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on

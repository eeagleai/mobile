// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revision_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RevisionHistoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevisionHistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RevisionHistoryEvent()';
}


}

/// @nodoc
class $RevisionHistoryEventCopyWith<$Res>  {
$RevisionHistoryEventCopyWith(RevisionHistoryEvent _, $Res Function(RevisionHistoryEvent) __);
}


/// Adds pattern-matching-related methods to [RevisionHistoryEvent].
extension RevisionHistoryEventPatterns on RevisionHistoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _RollbackRequested value)?  rollbackRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _RollbackRequested() when rollbackRequested != null:
return rollbackRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _RollbackRequested value)  rollbackRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RefreshRequested():
return refreshRequested(_that);case _RollbackRequested():
return rollbackRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _RollbackRequested value)?  rollbackRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _RollbackRequested() when rollbackRequested != null:
return rollbackRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String siteApiKey)?  started,TResult Function()?  refreshRequested,TResult Function( SiteRevision revision)?  rollbackRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.siteApiKey);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _RollbackRequested() when rollbackRequested != null:
return rollbackRequested(_that.revision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String siteApiKey)  started,required TResult Function()  refreshRequested,required TResult Function( SiteRevision revision)  rollbackRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.siteApiKey);case _RefreshRequested():
return refreshRequested();case _RollbackRequested():
return rollbackRequested(_that.revision);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String siteApiKey)?  started,TResult? Function()?  refreshRequested,TResult? Function( SiteRevision revision)?  rollbackRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.siteApiKey);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _RollbackRequested() when rollbackRequested != null:
return rollbackRequested(_that.revision);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements RevisionHistoryEvent {
  const _Started({required this.siteApiKey});


 final  String siteApiKey;

/// Create a copy of RevisionHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.siteApiKey, siteApiKey) || other.siteApiKey == siteApiKey));
}


@override
int get hashCode => Object.hash(runtimeType,siteApiKey);

@override
String toString() {
  return 'RevisionHistoryEvent.started(siteApiKey: $siteApiKey)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $RevisionHistoryEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String siteApiKey
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of RevisionHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? siteApiKey = null,}) {
  return _then(_Started(
siteApiKey: null == siteApiKey ? _self.siteApiKey : siteApiKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RefreshRequested implements RevisionHistoryEvent {
  const _RefreshRequested();







@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RevisionHistoryEvent.refreshRequested()';
}


}




/// @nodoc


class _RollbackRequested implements RevisionHistoryEvent {
  const _RollbackRequested({required this.revision});


 final  SiteRevision revision;

/// Create a copy of RevisionHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RollbackRequestedCopyWith<_RollbackRequested> get copyWith => __$RollbackRequestedCopyWithImpl<_RollbackRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RollbackRequested&&(identical(other.revision, revision) || other.revision == revision));
}


@override
int get hashCode => Object.hash(runtimeType,revision);

@override
String toString() {
  return 'RevisionHistoryEvent.rollbackRequested(revision: $revision)';
}


}

/// @nodoc
abstract mixin class _$RollbackRequestedCopyWith<$Res> implements $RevisionHistoryEventCopyWith<$Res> {
  factory _$RollbackRequestedCopyWith(_RollbackRequested value, $Res Function(_RollbackRequested) _then) = __$RollbackRequestedCopyWithImpl;
@useResult
$Res call({
 SiteRevision revision
});




}
/// @nodoc
class __$RollbackRequestedCopyWithImpl<$Res>
    implements _$RollbackRequestedCopyWith<$Res> {
  __$RollbackRequestedCopyWithImpl(this._self, this._then);

  final _RollbackRequested _self;
  final $Res Function(_RollbackRequested) _then;

/// Create a copy of RevisionHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? revision = null,}) {
  return _then(_RollbackRequested(
revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as SiteRevision,
  ));
}


}

/// @nodoc
mixin _$RevisionHistoryState {

 RevisionHistoryStatus get status; List<SiteRevision> get revisions; bool get isRefreshing; bool get isRollingBack; String? get rollingBackRevisionId; String? get errorMessage; String? get rollbackErrorMessage; SiteRollbackResult? get rollbackResult;
/// Create a copy of RevisionHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevisionHistoryStateCopyWith<RevisionHistoryState> get copyWith => _$RevisionHistoryStateCopyWithImpl<RevisionHistoryState>(this as RevisionHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevisionHistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.revisions, revisions)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isRollingBack, isRollingBack) || other.isRollingBack == isRollingBack)&&(identical(other.rollingBackRevisionId, rollingBackRevisionId) || other.rollingBackRevisionId == rollingBackRevisionId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.rollbackErrorMessage, rollbackErrorMessage) || other.rollbackErrorMessage == rollbackErrorMessage)&&(identical(other.rollbackResult, rollbackResult) || other.rollbackResult == rollbackResult));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(revisions),isRefreshing,isRollingBack,rollingBackRevisionId,errorMessage,rollbackErrorMessage,rollbackResult);

@override
String toString() {
  return 'RevisionHistoryState(status: $status, revisions: $revisions, isRefreshing: $isRefreshing, isRollingBack: $isRollingBack, rollingBackRevisionId: $rollingBackRevisionId, errorMessage: $errorMessage, rollbackErrorMessage: $rollbackErrorMessage, rollbackResult: $rollbackResult)';
}


}

/// @nodoc
abstract mixin class $RevisionHistoryStateCopyWith<$Res>  {
  factory $RevisionHistoryStateCopyWith(RevisionHistoryState value, $Res Function(RevisionHistoryState) _then) = _$RevisionHistoryStateCopyWithImpl;
@useResult
$Res call({
 RevisionHistoryStatus status, List<SiteRevision> revisions, bool isRefreshing, bool isRollingBack, String? rollingBackRevisionId, String? errorMessage, String? rollbackErrorMessage, SiteRollbackResult? rollbackResult
});




}
/// @nodoc
class _$RevisionHistoryStateCopyWithImpl<$Res>
    implements $RevisionHistoryStateCopyWith<$Res> {
  _$RevisionHistoryStateCopyWithImpl(this._self, this._then);

  final RevisionHistoryState _self;
  final $Res Function(RevisionHistoryState) _then;

/// Create a copy of RevisionHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? revisions = null,Object? isRefreshing = null,Object? isRollingBack = null,Object? rollingBackRevisionId = freezed,Object? errorMessage = freezed,Object? rollbackErrorMessage = freezed,Object? rollbackResult = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RevisionHistoryStatus,revisions: null == revisions ? _self.revisions : revisions // ignore: cast_nullable_to_non_nullable
as List<SiteRevision>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isRollingBack: null == isRollingBack ? _self.isRollingBack : isRollingBack // ignore: cast_nullable_to_non_nullable
as bool,rollingBackRevisionId: freezed == rollingBackRevisionId ? _self.rollingBackRevisionId : rollingBackRevisionId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,rollbackErrorMessage: freezed == rollbackErrorMessage ? _self.rollbackErrorMessage : rollbackErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,rollbackResult: freezed == rollbackResult ? _self.rollbackResult : rollbackResult // ignore: cast_nullable_to_non_nullable
as SiteRollbackResult?,
  ));
}

}


/// Adds pattern-matching-related methods to [RevisionHistoryState].
extension RevisionHistoryStatePatterns on RevisionHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevisionHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevisionHistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevisionHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _RevisionHistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevisionHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _RevisionHistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RevisionHistoryStatus status,  List<SiteRevision> revisions,  bool isRefreshing,  bool isRollingBack,  String? rollingBackRevisionId,  String? errorMessage,  String? rollbackErrorMessage,  SiteRollbackResult? rollbackResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevisionHistoryState() when $default != null:
return $default(_that.status,_that.revisions,_that.isRefreshing,_that.isRollingBack,_that.rollingBackRevisionId,_that.errorMessage,_that.rollbackErrorMessage,_that.rollbackResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RevisionHistoryStatus status,  List<SiteRevision> revisions,  bool isRefreshing,  bool isRollingBack,  String? rollingBackRevisionId,  String? errorMessage,  String? rollbackErrorMessage,  SiteRollbackResult? rollbackResult)  $default,) {final _that = this;
switch (_that) {
case _RevisionHistoryState():
return $default(_that.status,_that.revisions,_that.isRefreshing,_that.isRollingBack,_that.rollingBackRevisionId,_that.errorMessage,_that.rollbackErrorMessage,_that.rollbackResult);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RevisionHistoryStatus status,  List<SiteRevision> revisions,  bool isRefreshing,  bool isRollingBack,  String? rollingBackRevisionId,  String? errorMessage,  String? rollbackErrorMessage,  SiteRollbackResult? rollbackResult)?  $default,) {final _that = this;
switch (_that) {
case _RevisionHistoryState() when $default != null:
return $default(_that.status,_that.revisions,_that.isRefreshing,_that.isRollingBack,_that.rollingBackRevisionId,_that.errorMessage,_that.rollbackErrorMessage,_that.rollbackResult);case _:
  return null;

}
}

}

/// @nodoc


class _RevisionHistoryState implements RevisionHistoryState {
  const _RevisionHistoryState({this.status = RevisionHistoryStatus.initial, final  List<SiteRevision> revisions = const [], this.isRefreshing = false, this.isRollingBack = false, this.rollingBackRevisionId, this.errorMessage, this.rollbackErrorMessage, this.rollbackResult}): _revisions = revisions;


@override@JsonKey() final  RevisionHistoryStatus status;
 final  List<SiteRevision> _revisions;
@override@JsonKey() List<SiteRevision> get revisions {
  if (_revisions is EqualUnmodifiableListView) return _revisions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_revisions);
}

@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  bool isRollingBack;
@override final  String? rollingBackRevisionId;
@override final  String? errorMessage;
@override final  String? rollbackErrorMessage;
@override final  SiteRollbackResult? rollbackResult;

/// Create a copy of RevisionHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevisionHistoryStateCopyWith<_RevisionHistoryState> get copyWith => __$RevisionHistoryStateCopyWithImpl<_RevisionHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevisionHistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._revisions, _revisions)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isRollingBack, isRollingBack) || other.isRollingBack == isRollingBack)&&(identical(other.rollingBackRevisionId, rollingBackRevisionId) || other.rollingBackRevisionId == rollingBackRevisionId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.rollbackErrorMessage, rollbackErrorMessage) || other.rollbackErrorMessage == rollbackErrorMessage)&&(identical(other.rollbackResult, rollbackResult) || other.rollbackResult == rollbackResult));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_revisions),isRefreshing,isRollingBack,rollingBackRevisionId,errorMessage,rollbackErrorMessage,rollbackResult);

@override
String toString() {
  return 'RevisionHistoryState(status: $status, revisions: $revisions, isRefreshing: $isRefreshing, isRollingBack: $isRollingBack, rollingBackRevisionId: $rollingBackRevisionId, errorMessage: $errorMessage, rollbackErrorMessage: $rollbackErrorMessage, rollbackResult: $rollbackResult)';
}


}

/// @nodoc
abstract mixin class _$RevisionHistoryStateCopyWith<$Res> implements $RevisionHistoryStateCopyWith<$Res> {
  factory _$RevisionHistoryStateCopyWith(_RevisionHistoryState value, $Res Function(_RevisionHistoryState) _then) = __$RevisionHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 RevisionHistoryStatus status, List<SiteRevision> revisions, bool isRefreshing, bool isRollingBack, String? rollingBackRevisionId, String? errorMessage, String? rollbackErrorMessage, SiteRollbackResult? rollbackResult
});




}
/// @nodoc
class __$RevisionHistoryStateCopyWithImpl<$Res>
    implements _$RevisionHistoryStateCopyWith<$Res> {
  __$RevisionHistoryStateCopyWithImpl(this._self, this._then);

  final _RevisionHistoryState _self;
  final $Res Function(_RevisionHistoryState) _then;

/// Create a copy of RevisionHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? revisions = null,Object? isRefreshing = null,Object? isRollingBack = null,Object? rollingBackRevisionId = freezed,Object? errorMessage = freezed,Object? rollbackErrorMessage = freezed,Object? rollbackResult = freezed,}) {
  return _then(_RevisionHistoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RevisionHistoryStatus,revisions: null == revisions ? _self._revisions : revisions // ignore: cast_nullable_to_non_nullable
as List<SiteRevision>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isRollingBack: null == isRollingBack ? _self.isRollingBack : isRollingBack // ignore: cast_nullable_to_non_nullable
as bool,rollingBackRevisionId: freezed == rollingBackRevisionId ? _self.rollingBackRevisionId : rollingBackRevisionId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,rollbackErrorMessage: freezed == rollbackErrorMessage ? _self.rollbackErrorMessage : rollbackErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,rollbackResult: freezed == rollbackResult ? _self.rollbackResult : rollbackResult // ignore: cast_nullable_to_non_nullable
as SiteRollbackResult?,
  ));
}


}

// dart format on

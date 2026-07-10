// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupEvent {

 String get email; String get password; String get passwordConfirmation; bool get agree;
/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupEventCopyWith<SignupEvent> get copyWith => _$SignupEventCopyWithImpl<SignupEvent>(this as SignupEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation)&&(identical(other.agree, agree) || other.agree == agree));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,passwordConfirmation,agree);

@override
String toString() {
  return 'SignupEvent(email: $email, password: $password, passwordConfirmation: $passwordConfirmation, agree: $agree)';
}


}

/// @nodoc
abstract mixin class $SignupEventCopyWith<$Res>  {
  factory $SignupEventCopyWith(SignupEvent value, $Res Function(SignupEvent) _then) = _$SignupEventCopyWithImpl;
@useResult
$Res call({
 String email, String password, String passwordConfirmation, bool agree
});




}
/// @nodoc
class _$SignupEventCopyWithImpl<$Res>
    implements $SignupEventCopyWith<$Res> {
  _$SignupEventCopyWithImpl(this._self, this._then);

  final SignupEvent _self;
  final $Res Function(SignupEvent) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? passwordConfirmation = null,Object? agree = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,agree: null == agree ? _self.agree : agree // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupEvent].
extension SignupEventPatterns on SignupEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SignupSubmitted value)?  signupSubmitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupSubmitted() when signupSubmitted != null:
return signupSubmitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SignupSubmitted value)  signupSubmitted,}){
final _that = this;
switch (_that) {
case _SignupSubmitted():
return signupSubmitted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SignupSubmitted value)?  signupSubmitted,}){
final _that = this;
switch (_that) {
case _SignupSubmitted() when signupSubmitted != null:
return signupSubmitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password,  String passwordConfirmation,  bool agree)?  signupSubmitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupSubmitted() when signupSubmitted != null:
return signupSubmitted(_that.email,_that.password,_that.passwordConfirmation,_that.agree);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password,  String passwordConfirmation,  bool agree)  signupSubmitted,}) {final _that = this;
switch (_that) {
case _SignupSubmitted():
return signupSubmitted(_that.email,_that.password,_that.passwordConfirmation,_that.agree);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password,  String passwordConfirmation,  bool agree)?  signupSubmitted,}) {final _that = this;
switch (_that) {
case _SignupSubmitted() when signupSubmitted != null:
return signupSubmitted(_that.email,_that.password,_that.passwordConfirmation,_that.agree);case _:
  return null;

}
}

}

/// @nodoc


class _SignupSubmitted implements SignupEvent {
  const _SignupSubmitted({required this.email, required this.password, required this.passwordConfirmation, required this.agree});
  

@override final  String email;
@override final  String password;
@override final  String passwordConfirmation;
@override final  bool agree;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupSubmittedCopyWith<_SignupSubmitted> get copyWith => __$SignupSubmittedCopyWithImpl<_SignupSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupSubmitted&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation)&&(identical(other.agree, agree) || other.agree == agree));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,passwordConfirmation,agree);

@override
String toString() {
  return 'SignupEvent.signupSubmitted(email: $email, password: $password, passwordConfirmation: $passwordConfirmation, agree: $agree)';
}


}

/// @nodoc
abstract mixin class _$SignupSubmittedCopyWith<$Res> implements $SignupEventCopyWith<$Res> {
  factory _$SignupSubmittedCopyWith(_SignupSubmitted value, $Res Function(_SignupSubmitted) _then) = __$SignupSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String passwordConfirmation, bool agree
});




}
/// @nodoc
class __$SignupSubmittedCopyWithImpl<$Res>
    implements _$SignupSubmittedCopyWith<$Res> {
  __$SignupSubmittedCopyWithImpl(this._self, this._then);

  final _SignupSubmitted _self;
  final $Res Function(_SignupSubmitted) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? passwordConfirmation = null,Object? agree = null,}) {
  return _then(_SignupSubmitted(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,agree: null == agree ? _self.agree : agree // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SignupState {

 bool get isLoading; String? get errorMessage; bool get signupSucceeded; String? get successMessage; int get submissionAttempt;
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateCopyWith<SignupState> get copyWith => _$SignupStateCopyWithImpl<SignupState>(this as SignupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.signupSucceeded, signupSucceeded) || other.signupSucceeded == signupSucceeded)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.submissionAttempt, submissionAttempt) || other.submissionAttempt == submissionAttempt));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,signupSucceeded,successMessage,submissionAttempt);

@override
String toString() {
  return 'SignupState(isLoading: $isLoading, errorMessage: $errorMessage, signupSucceeded: $signupSucceeded, successMessage: $successMessage, submissionAttempt: $submissionAttempt)';
}


}

/// @nodoc
abstract mixin class $SignupStateCopyWith<$Res>  {
  factory $SignupStateCopyWith(SignupState value, $Res Function(SignupState) _then) = _$SignupStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? errorMessage, bool signupSucceeded, String? successMessage, int submissionAttempt
});




}
/// @nodoc
class _$SignupStateCopyWithImpl<$Res>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._self, this._then);

  final SignupState _self;
  final $Res Function(SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? signupSucceeded = null,Object? successMessage = freezed,Object? submissionAttempt = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,signupSucceeded: null == signupSucceeded ? _self.signupSucceeded : signupSucceeded // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,submissionAttempt: null == submissionAttempt ? _self.submissionAttempt : submissionAttempt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupState].
extension SignupStatePatterns on SignupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupState value)  $default,){
final _that = this;
switch (_that) {
case _SignupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupState value)?  $default,){
final _that = this;
switch (_that) {
case _SignupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  bool signupSucceeded,  String? successMessage,  int submissionAttempt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.signupSucceeded,_that.successMessage,_that.submissionAttempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  bool signupSucceeded,  String? successMessage,  int submissionAttempt)  $default,) {final _that = this;
switch (_that) {
case _SignupState():
return $default(_that.isLoading,_that.errorMessage,_that.signupSucceeded,_that.successMessage,_that.submissionAttempt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? errorMessage,  bool signupSucceeded,  String? successMessage,  int submissionAttempt)?  $default,) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.signupSucceeded,_that.successMessage,_that.submissionAttempt);case _:
  return null;

}
}

}

/// @nodoc


class _SignupState implements SignupState {
  const _SignupState({this.isLoading = false, this.errorMessage, this.signupSucceeded = false, this.successMessage, this.submissionAttempt = 0});
  

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  bool signupSucceeded;
@override final  String? successMessage;
@override@JsonKey() final  int submissionAttempt;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupStateCopyWith<_SignupState> get copyWith => __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.signupSucceeded, signupSucceeded) || other.signupSucceeded == signupSucceeded)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.submissionAttempt, submissionAttempt) || other.submissionAttempt == submissionAttempt));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,signupSucceeded,successMessage,submissionAttempt);

@override
String toString() {
  return 'SignupState(isLoading: $isLoading, errorMessage: $errorMessage, signupSucceeded: $signupSucceeded, successMessage: $successMessage, submissionAttempt: $submissionAttempt)';
}


}

/// @nodoc
abstract mixin class _$SignupStateCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(_SignupState value, $Res Function(_SignupState) _then) = __$SignupStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? errorMessage, bool signupSucceeded, String? successMessage, int submissionAttempt
});




}
/// @nodoc
class __$SignupStateCopyWithImpl<$Res>
    implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(this._self, this._then);

  final _SignupState _self;
  final $Res Function(_SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? signupSucceeded = null,Object? successMessage = freezed,Object? submissionAttempt = null,}) {
  return _then(_SignupState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,signupSucceeded: null == signupSucceeded ? _self.signupSucceeded : signupSucceeded // ignore: cast_nullable_to_non_nullable
as bool,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,submissionAttempt: null == submissionAttempt ? _self.submissionAttempt : submissionAttempt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

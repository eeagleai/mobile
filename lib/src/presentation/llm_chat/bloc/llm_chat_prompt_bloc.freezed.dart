// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'llm_chat_prompt_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LlmChatPromptEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LlmChatPromptEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LlmChatPromptEvent()';
}


}

/// @nodoc
class $LlmChatPromptEventCopyWith<$Res>  {
$LlmChatPromptEventCopyWith(LlmChatPromptEvent _, $Res Function(LlmChatPromptEvent) __);
}


/// Adds pattern-matching-related methods to [LlmChatPromptEvent].
extension LlmChatPromptEventPatterns on LlmChatPromptEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initialized value)?  initialized,TResult Function( _MicToggled value)?  micToggled,TResult Function( _TextChanged value)?  textChanged,TResult Function( _SpeechResultReceived value)?  speechResultReceived,TResult Function( _SpeechStatusChanged value)?  speechStatusChanged,TResult Function( _SpeechErrorReceived value)?  speechErrorReceived,TResult Function( _SendRequested value)?  sendRequested,TResult Function( _SoundLevelChanged value)?  soundLevelChanged,TResult Function( _PickMediaRequested value)?  pickMediaRequested,TResult Function( _PickFilesRequested value)?  pickFilesRequested,TResult Function( _AttachmentRemoved value)?  attachmentRemoved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initialized() when initialized != null:
return initialized(_that);case _MicToggled() when micToggled != null:
return micToggled(_that);case _TextChanged() when textChanged != null:
return textChanged(_that);case _SpeechResultReceived() when speechResultReceived != null:
return speechResultReceived(_that);case _SpeechStatusChanged() when speechStatusChanged != null:
return speechStatusChanged(_that);case _SpeechErrorReceived() when speechErrorReceived != null:
return speechErrorReceived(_that);case _SendRequested() when sendRequested != null:
return sendRequested(_that);case _SoundLevelChanged() when soundLevelChanged != null:
return soundLevelChanged(_that);case _PickMediaRequested() when pickMediaRequested != null:
return pickMediaRequested(_that);case _PickFilesRequested() when pickFilesRequested != null:
return pickFilesRequested(_that);case _AttachmentRemoved() when attachmentRemoved != null:
return attachmentRemoved(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initialized value)  initialized,required TResult Function( _MicToggled value)  micToggled,required TResult Function( _TextChanged value)  textChanged,required TResult Function( _SpeechResultReceived value)  speechResultReceived,required TResult Function( _SpeechStatusChanged value)  speechStatusChanged,required TResult Function( _SpeechErrorReceived value)  speechErrorReceived,required TResult Function( _SendRequested value)  sendRequested,required TResult Function( _SoundLevelChanged value)  soundLevelChanged,required TResult Function( _PickMediaRequested value)  pickMediaRequested,required TResult Function( _PickFilesRequested value)  pickFilesRequested,required TResult Function( _AttachmentRemoved value)  attachmentRemoved,}){
final _that = this;
switch (_that) {
case _Initialized():
return initialized(_that);case _MicToggled():
return micToggled(_that);case _TextChanged():
return textChanged(_that);case _SpeechResultReceived():
return speechResultReceived(_that);case _SpeechStatusChanged():
return speechStatusChanged(_that);case _SpeechErrorReceived():
return speechErrorReceived(_that);case _SendRequested():
return sendRequested(_that);case _SoundLevelChanged():
return soundLevelChanged(_that);case _PickMediaRequested():
return pickMediaRequested(_that);case _PickFilesRequested():
return pickFilesRequested(_that);case _AttachmentRemoved():
return attachmentRemoved(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initialized value)?  initialized,TResult? Function( _MicToggled value)?  micToggled,TResult? Function( _TextChanged value)?  textChanged,TResult? Function( _SpeechResultReceived value)?  speechResultReceived,TResult? Function( _SpeechStatusChanged value)?  speechStatusChanged,TResult? Function( _SpeechErrorReceived value)?  speechErrorReceived,TResult? Function( _SendRequested value)?  sendRequested,TResult? Function( _SoundLevelChanged value)?  soundLevelChanged,TResult? Function( _PickMediaRequested value)?  pickMediaRequested,TResult? Function( _PickFilesRequested value)?  pickFilesRequested,TResult? Function( _AttachmentRemoved value)?  attachmentRemoved,}){
final _that = this;
switch (_that) {
case _Initialized() when initialized != null:
return initialized(_that);case _MicToggled() when micToggled != null:
return micToggled(_that);case _TextChanged() when textChanged != null:
return textChanged(_that);case _SpeechResultReceived() when speechResultReceived != null:
return speechResultReceived(_that);case _SpeechStatusChanged() when speechStatusChanged != null:
return speechStatusChanged(_that);case _SpeechErrorReceived() when speechErrorReceived != null:
return speechErrorReceived(_that);case _SendRequested() when sendRequested != null:
return sendRequested(_that);case _SoundLevelChanged() when soundLevelChanged != null:
return soundLevelChanged(_that);case _PickMediaRequested() when pickMediaRequested != null:
return pickMediaRequested(_that);case _PickFilesRequested() when pickFilesRequested != null:
return pickFilesRequested(_that);case _AttachmentRemoved() when attachmentRemoved != null:
return attachmentRemoved(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialized,TResult Function()?  micToggled,TResult Function( String text)?  textChanged,TResult Function( String words,  bool isFinal)?  speechResultReceived,TResult Function( String status)?  speechStatusChanged,TResult Function( String message)?  speechErrorReceived,TResult Function()?  sendRequested,TResult Function( double level)?  soundLevelChanged,TResult Function()?  pickMediaRequested,TResult Function()?  pickFilesRequested,TResult Function( String id)?  attachmentRemoved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initialized() when initialized != null:
return initialized();case _MicToggled() when micToggled != null:
return micToggled();case _TextChanged() when textChanged != null:
return textChanged(_that.text);case _SpeechResultReceived() when speechResultReceived != null:
return speechResultReceived(_that.words,_that.isFinal);case _SpeechStatusChanged() when speechStatusChanged != null:
return speechStatusChanged(_that.status);case _SpeechErrorReceived() when speechErrorReceived != null:
return speechErrorReceived(_that.message);case _SendRequested() when sendRequested != null:
return sendRequested();case _SoundLevelChanged() when soundLevelChanged != null:
return soundLevelChanged(_that.level);case _PickMediaRequested() when pickMediaRequested != null:
return pickMediaRequested();case _PickFilesRequested() when pickFilesRequested != null:
return pickFilesRequested();case _AttachmentRemoved() when attachmentRemoved != null:
return attachmentRemoved(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialized,required TResult Function()  micToggled,required TResult Function( String text)  textChanged,required TResult Function( String words,  bool isFinal)  speechResultReceived,required TResult Function( String status)  speechStatusChanged,required TResult Function( String message)  speechErrorReceived,required TResult Function()  sendRequested,required TResult Function( double level)  soundLevelChanged,required TResult Function()  pickMediaRequested,required TResult Function()  pickFilesRequested,required TResult Function( String id)  attachmentRemoved,}) {final _that = this;
switch (_that) {
case _Initialized():
return initialized();case _MicToggled():
return micToggled();case _TextChanged():
return textChanged(_that.text);case _SpeechResultReceived():
return speechResultReceived(_that.words,_that.isFinal);case _SpeechStatusChanged():
return speechStatusChanged(_that.status);case _SpeechErrorReceived():
return speechErrorReceived(_that.message);case _SendRequested():
return sendRequested();case _SoundLevelChanged():
return soundLevelChanged(_that.level);case _PickMediaRequested():
return pickMediaRequested();case _PickFilesRequested():
return pickFilesRequested();case _AttachmentRemoved():
return attachmentRemoved(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialized,TResult? Function()?  micToggled,TResult? Function( String text)?  textChanged,TResult? Function( String words,  bool isFinal)?  speechResultReceived,TResult? Function( String status)?  speechStatusChanged,TResult? Function( String message)?  speechErrorReceived,TResult? Function()?  sendRequested,TResult? Function( double level)?  soundLevelChanged,TResult? Function()?  pickMediaRequested,TResult? Function()?  pickFilesRequested,TResult? Function( String id)?  attachmentRemoved,}) {final _that = this;
switch (_that) {
case _Initialized() when initialized != null:
return initialized();case _MicToggled() when micToggled != null:
return micToggled();case _TextChanged() when textChanged != null:
return textChanged(_that.text);case _SpeechResultReceived() when speechResultReceived != null:
return speechResultReceived(_that.words,_that.isFinal);case _SpeechStatusChanged() when speechStatusChanged != null:
return speechStatusChanged(_that.status);case _SpeechErrorReceived() when speechErrorReceived != null:
return speechErrorReceived(_that.message);case _SendRequested() when sendRequested != null:
return sendRequested();case _SoundLevelChanged() when soundLevelChanged != null:
return soundLevelChanged(_that.level);case _PickMediaRequested() when pickMediaRequested != null:
return pickMediaRequested();case _PickFilesRequested() when pickFilesRequested != null:
return pickFilesRequested();case _AttachmentRemoved() when attachmentRemoved != null:
return attachmentRemoved(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Initialized implements LlmChatPromptEvent {
  const _Initialized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initialized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LlmChatPromptEvent.initialized()';
}


}




/// @nodoc


class _MicToggled implements LlmChatPromptEvent {
  const _MicToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MicToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LlmChatPromptEvent.micToggled()';
}


}




/// @nodoc


class _TextChanged implements LlmChatPromptEvent {
  const _TextChanged(this.text);
  

 final  String text;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextChangedCopyWith<_TextChanged> get copyWith => __$TextChangedCopyWithImpl<_TextChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextChanged&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'LlmChatPromptEvent.textChanged(text: $text)';
}


}

/// @nodoc
abstract mixin class _$TextChangedCopyWith<$Res> implements $LlmChatPromptEventCopyWith<$Res> {
  factory _$TextChangedCopyWith(_TextChanged value, $Res Function(_TextChanged) _then) = __$TextChangedCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class __$TextChangedCopyWithImpl<$Res>
    implements _$TextChangedCopyWith<$Res> {
  __$TextChangedCopyWithImpl(this._self, this._then);

  final _TextChanged _self;
  final $Res Function(_TextChanged) _then;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_TextChanged(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SpeechResultReceived implements LlmChatPromptEvent {
  const _SpeechResultReceived({required this.words, required this.isFinal});
  

 final  String words;
 final  bool isFinal;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeechResultReceivedCopyWith<_SpeechResultReceived> get copyWith => __$SpeechResultReceivedCopyWithImpl<_SpeechResultReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeechResultReceived&&(identical(other.words, words) || other.words == words)&&(identical(other.isFinal, isFinal) || other.isFinal == isFinal));
}


@override
int get hashCode => Object.hash(runtimeType,words,isFinal);

@override
String toString() {
  return 'LlmChatPromptEvent.speechResultReceived(words: $words, isFinal: $isFinal)';
}


}

/// @nodoc
abstract mixin class _$SpeechResultReceivedCopyWith<$Res> implements $LlmChatPromptEventCopyWith<$Res> {
  factory _$SpeechResultReceivedCopyWith(_SpeechResultReceived value, $Res Function(_SpeechResultReceived) _then) = __$SpeechResultReceivedCopyWithImpl;
@useResult
$Res call({
 String words, bool isFinal
});




}
/// @nodoc
class __$SpeechResultReceivedCopyWithImpl<$Res>
    implements _$SpeechResultReceivedCopyWith<$Res> {
  __$SpeechResultReceivedCopyWithImpl(this._self, this._then);

  final _SpeechResultReceived _self;
  final $Res Function(_SpeechResultReceived) _then;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? words = null,Object? isFinal = null,}) {
  return _then(_SpeechResultReceived(
words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as String,isFinal: null == isFinal ? _self.isFinal : isFinal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SpeechStatusChanged implements LlmChatPromptEvent {
  const _SpeechStatusChanged(this.status);
  

 final  String status;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeechStatusChangedCopyWith<_SpeechStatusChanged> get copyWith => __$SpeechStatusChangedCopyWithImpl<_SpeechStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeechStatusChanged&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'LlmChatPromptEvent.speechStatusChanged(status: $status)';
}


}

/// @nodoc
abstract mixin class _$SpeechStatusChangedCopyWith<$Res> implements $LlmChatPromptEventCopyWith<$Res> {
  factory _$SpeechStatusChangedCopyWith(_SpeechStatusChanged value, $Res Function(_SpeechStatusChanged) _then) = __$SpeechStatusChangedCopyWithImpl;
@useResult
$Res call({
 String status
});




}
/// @nodoc
class __$SpeechStatusChangedCopyWithImpl<$Res>
    implements _$SpeechStatusChangedCopyWith<$Res> {
  __$SpeechStatusChangedCopyWithImpl(this._self, this._then);

  final _SpeechStatusChanged _self;
  final $Res Function(_SpeechStatusChanged) _then;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_SpeechStatusChanged(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SpeechErrorReceived implements LlmChatPromptEvent {
  const _SpeechErrorReceived(this.message);
  

 final  String message;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeechErrorReceivedCopyWith<_SpeechErrorReceived> get copyWith => __$SpeechErrorReceivedCopyWithImpl<_SpeechErrorReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeechErrorReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LlmChatPromptEvent.speechErrorReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SpeechErrorReceivedCopyWith<$Res> implements $LlmChatPromptEventCopyWith<$Res> {
  factory _$SpeechErrorReceivedCopyWith(_SpeechErrorReceived value, $Res Function(_SpeechErrorReceived) _then) = __$SpeechErrorReceivedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SpeechErrorReceivedCopyWithImpl<$Res>
    implements _$SpeechErrorReceivedCopyWith<$Res> {
  __$SpeechErrorReceivedCopyWithImpl(this._self, this._then);

  final _SpeechErrorReceived _self;
  final $Res Function(_SpeechErrorReceived) _then;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SpeechErrorReceived(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SendRequested implements LlmChatPromptEvent {
  const _SendRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LlmChatPromptEvent.sendRequested()';
}


}




/// @nodoc


class _SoundLevelChanged implements LlmChatPromptEvent {
  const _SoundLevelChanged(this.level);
  

 final  double level;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SoundLevelChangedCopyWith<_SoundLevelChanged> get copyWith => __$SoundLevelChangedCopyWithImpl<_SoundLevelChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SoundLevelChanged&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,level);

@override
String toString() {
  return 'LlmChatPromptEvent.soundLevelChanged(level: $level)';
}


}

/// @nodoc
abstract mixin class _$SoundLevelChangedCopyWith<$Res> implements $LlmChatPromptEventCopyWith<$Res> {
  factory _$SoundLevelChangedCopyWith(_SoundLevelChanged value, $Res Function(_SoundLevelChanged) _then) = __$SoundLevelChangedCopyWithImpl;
@useResult
$Res call({
 double level
});




}
/// @nodoc
class __$SoundLevelChangedCopyWithImpl<$Res>
    implements _$SoundLevelChangedCopyWith<$Res> {
  __$SoundLevelChangedCopyWithImpl(this._self, this._then);

  final _SoundLevelChanged _self;
  final $Res Function(_SoundLevelChanged) _then;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? level = null,}) {
  return _then(_SoundLevelChanged(
null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _PickMediaRequested implements LlmChatPromptEvent {
  const _PickMediaRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickMediaRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LlmChatPromptEvent.pickMediaRequested()';
}


}




/// @nodoc


class _PickFilesRequested implements LlmChatPromptEvent {
  const _PickFilesRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickFilesRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LlmChatPromptEvent.pickFilesRequested()';
}


}




/// @nodoc


class _AttachmentRemoved implements LlmChatPromptEvent {
  const _AttachmentRemoved(this.id);
  

 final  String id;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttachmentRemovedCopyWith<_AttachmentRemoved> get copyWith => __$AttachmentRemovedCopyWithImpl<_AttachmentRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttachmentRemoved&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'LlmChatPromptEvent.attachmentRemoved(id: $id)';
}


}

/// @nodoc
abstract mixin class _$AttachmentRemovedCopyWith<$Res> implements $LlmChatPromptEventCopyWith<$Res> {
  factory _$AttachmentRemovedCopyWith(_AttachmentRemoved value, $Res Function(_AttachmentRemoved) _then) = __$AttachmentRemovedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$AttachmentRemovedCopyWithImpl<$Res>
    implements _$AttachmentRemovedCopyWith<$Res> {
  __$AttachmentRemovedCopyWithImpl(this._self, this._then);

  final _AttachmentRemoved _self;
  final $Res Function(_AttachmentRemoved) _then;

/// Create a copy of LlmChatPromptEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_AttachmentRemoved(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LlmChatPromptState {

 String get promptText; bool get isListening; bool get isInitializing; bool get isSpeechAvailable; double get soundLevel; List<PromptAttachment> get attachments; String? get errorMessage;
/// Create a copy of LlmChatPromptState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LlmChatPromptStateCopyWith<LlmChatPromptState> get copyWith => _$LlmChatPromptStateCopyWithImpl<LlmChatPromptState>(this as LlmChatPromptState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LlmChatPromptState&&(identical(other.promptText, promptText) || other.promptText == promptText)&&(identical(other.isListening, isListening) || other.isListening == isListening)&&(identical(other.isInitializing, isInitializing) || other.isInitializing == isInitializing)&&(identical(other.isSpeechAvailable, isSpeechAvailable) || other.isSpeechAvailable == isSpeechAvailable)&&(identical(other.soundLevel, soundLevel) || other.soundLevel == soundLevel)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,promptText,isListening,isInitializing,isSpeechAvailable,soundLevel,const DeepCollectionEquality().hash(attachments),errorMessage);

@override
String toString() {
  return 'LlmChatPromptState(promptText: $promptText, isListening: $isListening, isInitializing: $isInitializing, isSpeechAvailable: $isSpeechAvailable, soundLevel: $soundLevel, attachments: $attachments, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LlmChatPromptStateCopyWith<$Res>  {
  factory $LlmChatPromptStateCopyWith(LlmChatPromptState value, $Res Function(LlmChatPromptState) _then) = _$LlmChatPromptStateCopyWithImpl;
@useResult
$Res call({
 String promptText, bool isListening, bool isInitializing, bool isSpeechAvailable, double soundLevel, List<PromptAttachment> attachments, String? errorMessage
});




}
/// @nodoc
class _$LlmChatPromptStateCopyWithImpl<$Res>
    implements $LlmChatPromptStateCopyWith<$Res> {
  _$LlmChatPromptStateCopyWithImpl(this._self, this._then);

  final LlmChatPromptState _self;
  final $Res Function(LlmChatPromptState) _then;

/// Create a copy of LlmChatPromptState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? promptText = null,Object? isListening = null,Object? isInitializing = null,Object? isSpeechAvailable = null,Object? soundLevel = null,Object? attachments = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
promptText: null == promptText ? _self.promptText : promptText // ignore: cast_nullable_to_non_nullable
as String,isListening: null == isListening ? _self.isListening : isListening // ignore: cast_nullable_to_non_nullable
as bool,isInitializing: null == isInitializing ? _self.isInitializing : isInitializing // ignore: cast_nullable_to_non_nullable
as bool,isSpeechAvailable: null == isSpeechAvailable ? _self.isSpeechAvailable : isSpeechAvailable // ignore: cast_nullable_to_non_nullable
as bool,soundLevel: null == soundLevel ? _self.soundLevel : soundLevel // ignore: cast_nullable_to_non_nullable
as double,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<PromptAttachment>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LlmChatPromptState].
extension LlmChatPromptStatePatterns on LlmChatPromptState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LlmChatPromptState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LlmChatPromptState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LlmChatPromptState value)  $default,){
final _that = this;
switch (_that) {
case _LlmChatPromptState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LlmChatPromptState value)?  $default,){
final _that = this;
switch (_that) {
case _LlmChatPromptState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String promptText,  bool isListening,  bool isInitializing,  bool isSpeechAvailable,  double soundLevel,  List<PromptAttachment> attachments,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LlmChatPromptState() when $default != null:
return $default(_that.promptText,_that.isListening,_that.isInitializing,_that.isSpeechAvailable,_that.soundLevel,_that.attachments,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String promptText,  bool isListening,  bool isInitializing,  bool isSpeechAvailable,  double soundLevel,  List<PromptAttachment> attachments,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LlmChatPromptState():
return $default(_that.promptText,_that.isListening,_that.isInitializing,_that.isSpeechAvailable,_that.soundLevel,_that.attachments,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String promptText,  bool isListening,  bool isInitializing,  bool isSpeechAvailable,  double soundLevel,  List<PromptAttachment> attachments,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LlmChatPromptState() when $default != null:
return $default(_that.promptText,_that.isListening,_that.isInitializing,_that.isSpeechAvailable,_that.soundLevel,_that.attachments,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LlmChatPromptState implements LlmChatPromptState {
  const _LlmChatPromptState({this.promptText = '', this.isListening = false, this.isInitializing = false, this.isSpeechAvailable = false, this.soundLevel = 0.0, final  List<PromptAttachment> attachments = const [], this.errorMessage}): _attachments = attachments;
  

@override@JsonKey() final  String promptText;
@override@JsonKey() final  bool isListening;
@override@JsonKey() final  bool isInitializing;
@override@JsonKey() final  bool isSpeechAvailable;
@override@JsonKey() final  double soundLevel;
 final  List<PromptAttachment> _attachments;
@override@JsonKey() List<PromptAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  String? errorMessage;

/// Create a copy of LlmChatPromptState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LlmChatPromptStateCopyWith<_LlmChatPromptState> get copyWith => __$LlmChatPromptStateCopyWithImpl<_LlmChatPromptState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LlmChatPromptState&&(identical(other.promptText, promptText) || other.promptText == promptText)&&(identical(other.isListening, isListening) || other.isListening == isListening)&&(identical(other.isInitializing, isInitializing) || other.isInitializing == isInitializing)&&(identical(other.isSpeechAvailable, isSpeechAvailable) || other.isSpeechAvailable == isSpeechAvailable)&&(identical(other.soundLevel, soundLevel) || other.soundLevel == soundLevel)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,promptText,isListening,isInitializing,isSpeechAvailable,soundLevel,const DeepCollectionEquality().hash(_attachments),errorMessage);

@override
String toString() {
  return 'LlmChatPromptState(promptText: $promptText, isListening: $isListening, isInitializing: $isInitializing, isSpeechAvailable: $isSpeechAvailable, soundLevel: $soundLevel, attachments: $attachments, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LlmChatPromptStateCopyWith<$Res> implements $LlmChatPromptStateCopyWith<$Res> {
  factory _$LlmChatPromptStateCopyWith(_LlmChatPromptState value, $Res Function(_LlmChatPromptState) _then) = __$LlmChatPromptStateCopyWithImpl;
@override @useResult
$Res call({
 String promptText, bool isListening, bool isInitializing, bool isSpeechAvailable, double soundLevel, List<PromptAttachment> attachments, String? errorMessage
});




}
/// @nodoc
class __$LlmChatPromptStateCopyWithImpl<$Res>
    implements _$LlmChatPromptStateCopyWith<$Res> {
  __$LlmChatPromptStateCopyWithImpl(this._self, this._then);

  final _LlmChatPromptState _self;
  final $Res Function(_LlmChatPromptState) _then;

/// Create a copy of LlmChatPromptState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? promptText = null,Object? isListening = null,Object? isInitializing = null,Object? isSpeechAvailable = null,Object? soundLevel = null,Object? attachments = null,Object? errorMessage = freezed,}) {
  return _then(_LlmChatPromptState(
promptText: null == promptText ? _self.promptText : promptText // ignore: cast_nullable_to_non_nullable
as String,isListening: null == isListening ? _self.isListening : isListening // ignore: cast_nullable_to_non_nullable
as bool,isInitializing: null == isInitializing ? _self.isInitializing : isInitializing // ignore: cast_nullable_to_non_nullable
as bool,isSpeechAvailable: null == isSpeechAvailable ? _self.isSpeechAvailable : isSpeechAvailable // ignore: cast_nullable_to_non_nullable
as bool,soundLevel: null == soundLevel ? _self.soundLevel : soundLevel // ignore: cast_nullable_to_non_nullable
as double,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<PromptAttachment>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

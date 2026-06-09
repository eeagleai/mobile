import 'package:eeagle_ai/src/domain/model/chat_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_inbound_event.freezed.dart';

@freezed
sealed class ChatInboundEvent with _$ChatInboundEvent {
  const factory ChatInboundEvent.status({
    required String state,
  }) = ChatInboundStatusEvent;

  const factory ChatInboundEvent.message({
    required ChatMessageRole role,
    required String content,
  }) = ChatInboundMessageEvent;

  const factory ChatInboundEvent.assistantFinished() =
      ChatInboundAssistantFinishedEvent;

  const factory ChatInboundEvent.error({
    required String error,
    String? detail,
  }) = ChatInboundErrorEvent;

  const factory ChatInboundEvent.pong() = ChatInboundPongEvent;
}

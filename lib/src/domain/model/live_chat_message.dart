/// Who sent a live-conversation message.
enum LiveChatSender { visitor, owner }

/// Delivery state of an owner message (visitor messages are always [sent]).
enum LiveChatMessageStatus { sending, queued, sent, failed }

/// A single message in an owner ⇄ visitor live conversation.
class LiveChatMessage {
  const LiveChatMessage({
    required this.id,
    required this.sender,
    required this.text,
    required this.status,
    this.createdAt,
  });

  /// Stable local id (used for optimistic updates / retry).
  final String id;
  final LiveChatSender sender;
  final String text;
  final LiveChatMessageStatus status;
  final DateTime? createdAt;

  bool get isOwner => sender == LiveChatSender.owner;

  bool get isPending =>
      status == LiveChatMessageStatus.sending ||
      status == LiveChatMessageStatus.queued;

  LiveChatMessage copyWith({
    LiveChatMessageStatus? status,
    DateTime? createdAt,
  }) {
    return LiveChatMessage(
      id: id,
      sender: sender,
      text: text,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is LiveChatMessage &&
        other.id == id &&
        other.sender == sender &&
        other.text == text &&
        other.status == status &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => Object.hash(id, sender, text, status, createdAt);
}

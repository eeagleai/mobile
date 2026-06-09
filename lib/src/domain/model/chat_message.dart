enum ChatMessageRole {
  user,
  assistant,
}

class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.role,
    required this.content,
    this.isStreaming = false,
  });

  final String id;
  final ChatMessageRole role;
  final String content;
  final bool isStreaming;

  ChatMessage copyWith({
    String? id,
    ChatMessageRole? role,
    String? content,
    bool? isStreaming,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      role: role ?? this.role,
      content: content ?? this.content,
      isStreaming: isStreaming ?? this.isStreaming,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ChatMessage &&
            id == other.id &&
            role == other.role &&
            content == other.content &&
            isStreaming == other.isStreaming;
  }

  @override
  int get hashCode => Object.hash(id, role, content, isStreaming);
}

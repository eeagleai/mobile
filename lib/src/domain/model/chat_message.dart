import 'package:eeagle_ai/src/domain/model/clickable_page_link.dart';

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
    this.clickablePageLinks = const [],
  });

  final String id;
  final ChatMessageRole role;
  final String content;
  final bool isStreaming;
  final List<ClickablePageLink> clickablePageLinks;

  ChatMessage copyWith({
    String? id,
    ChatMessageRole? role,
    String? content,
    bool? isStreaming,
    List<ClickablePageLink>? clickablePageLinks,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      role: role ?? this.role,
      content: content ?? this.content,
      isStreaming: isStreaming ?? this.isStreaming,
      clickablePageLinks: clickablePageLinks ?? this.clickablePageLinks,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ChatMessage &&
            id == other.id &&
            role == other.role &&
            content == other.content &&
            isStreaming == other.isStreaming &&
            _listEquals(clickablePageLinks, other.clickablePageLinks);
  }

  @override
  int get hashCode => Object.hash(
        id,
        role,
        content,
        isStreaming,
        Object.hashAll(clickablePageLinks),
      );
}

bool _listEquals<T>(List<T> left, List<T> right) {
  if (left.length != right.length) {
    return false;
  }

  for (var index = 0; index < left.length; index++) {
    if (left[index] != right[index]) {
      return false;
    }
  }

  return true;
}

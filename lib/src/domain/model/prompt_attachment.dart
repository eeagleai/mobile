class PromptAttachment {
  const PromptAttachment({
    required this.id,
    required this.name,
    required this.path,
    required this.extension,
    this.sizeBytes,
  });

  final String id;
  final String name;
  final String path;
  final String extension;
  final int? sizeBytes;

  static const _imageExtensions = {
    'jpg',
    'jpeg',
    'png',
    'webp',
    'gif',
    'heic',
  };

  static const _videoExtensions = {
    'mp4',
    'mov',
    'm4v',
    'avi',
    'mkv',
    'webm',
    '3gp',
  };

  bool get isImage => _imageExtensions.contains(extension.toLowerCase());

  bool get isVideo => _videoExtensions.contains(extension.toLowerCase());

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PromptAttachment &&
            runtimeType == other.runtimeType &&
            id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

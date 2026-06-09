class ChatSessionConfig {
  const ChatSessionConfig({
    this.pageCaptureEnabled,
    this.maxPageContentLength,
    this.liveEditEnabled,
    this.canLiveEdit,
    this.remaining,
  });

  final bool? pageCaptureEnabled;
  final int? maxPageContentLength;
  final bool? liveEditEnabled;
  final bool? canLiveEdit;
  final int? remaining;
}

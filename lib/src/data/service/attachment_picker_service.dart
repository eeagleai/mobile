import 'package:eeagle_ai/src/domain/model/prompt_attachment.dart';
import 'package:file_picker/file_picker.dart';

class AttachmentPickerService {
  static const _fileExtensions = [
    'pdf',
    'doc',
    'docx',
    'txt',
    'md',
  ];

  Future<List<PromptAttachment>> pickMedia() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.media,
    );

    return _mapResultToAttachments(result);
  }

  Future<List<PromptAttachment>> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: _fileExtensions,
    );

    return _mapResultToAttachments(result);
  }

  List<PromptAttachment> _mapResultToAttachments(FilePickerResult? result) {
    if (result == null || result.files.isEmpty) {
      return const [];
    }

    final attachments = <PromptAttachment>[];
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    for (var index = 0; index < result.files.length; index++) {
      final file = result.files[index];
      final path = file.path;
      if (path == null) {
        continue;
      }

      final name = file.name;
      final extension = _extensionFromName(name);

      attachments.add(
        PromptAttachment(
          id: '$timestamp-$index-${name.hashCode}',
          name: name,
          path: path,
          extension: extension,
          sizeBytes: file.size,
        ),
      );
    }

    return attachments;
  }

  String _extensionFromName(String name) {
    final dotIndex = name.lastIndexOf('.');
    if (dotIndex == -1 || dotIndex == name.length - 1) {
      return '';
    }

    return name.substring(dotIndex + 1).toLowerCase();
  }
}

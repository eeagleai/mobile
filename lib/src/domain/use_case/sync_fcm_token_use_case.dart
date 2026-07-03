import 'package:eeagle_ai/src/data/service/firebase_messaging_service.dart';

class SyncFcmTokenUseCase {
  SyncFcmTokenUseCase(this._messagingService);

  final FirebaseMessagingService _messagingService;

  Future<void> call() => _messagingService.syncCurrentToken();
}

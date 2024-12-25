
import 'package:openid4vci/src/entities/types/notification_id.dart';

/// Enum representing various events related to credential issuance.
enum CredentialIssuanceEvent {
  /// An event indicating that the credential issuance was accepted.
  accepted(NotificationId id, String? description),
  
  /// An event indicating that the credential issuance failed.
  failed(NotificationId id, String? description),
  
  /// An event indicating that the issued credential was deleted.
  deleted(NotificationId id, String? description);
}

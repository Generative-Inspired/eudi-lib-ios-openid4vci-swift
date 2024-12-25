
import 'package:openid4vci/src/entities/types/notification_id.dart';
import 'package:openid4vci/src/entities/types/transaction_id.dart';
import 'package:openid4vci/src/entities/types/c_nonce.dart';
import 'package:openid4vci/src/entities/errors/credential_issuance_error.dart';

class CredentialIssuanceResponse {
  final List<Result> credentialResponses;
  final CNonce? cNonce;

  CredentialIssuanceResponse({
    required this.credentialResponses,
    this.cNonce,
  });
}

enum Result {
  deferred(TransactionId transactionId),
  issued(String credential, NotificationId? notificationId);
}

enum SubmittedRequest {
  success(CredentialIssuanceResponse response),
  failed(CredentialIssuanceError error),
  invalidProof(CNonce cNonce, String? errorDescription);

  List<String> get credentials {
    switch (this) {
      case SubmittedRequest.success(final response):
        return response.credentialResponses
            .whereType<Result>()
            .where((result) => result is Result.issued)
            .map((result) => (result as Result.issued).credential)
            .toList();
      default:
        return [];
    }
  }
}


import 'package:openid4vci/src/entities/types/single_credential.dart';
import 'package:openid4vci/src/entities/types/issuance_response_encryption_spec.dart';

enum CredentialIssuanceRequest {
  single(SingleCredential credential, IssuanceResponseEncryptionSpec? encryptionSpec),
  batch(List<SingleCredential> credentials, IssuanceResponseEncryptionSpec? encryptionSpec)
}


import 'package:openid4vci/src/entities/types/scope.dart';
import 'package:openid4vci/src/entities/profiles/mso_mdoc_format.dart';
import 'package:openid4vci/src/entities/profiles/w3c_formats.dart';
import 'package:openid4vci/src/entities/profiles/sd_jwt_vc_format.dart';

enum CredentialSupported {
  scope(Scope value),
  msoMdoc(MsoMdocFormat credentialConfiguration),
  w3CSignedJwt(W3CSignedJwtFormat credentialConfiguration),
  w3CJsonLdSignedJwt(W3CJsonLdSignedJwtFormat credentialConfiguration),
  w3CJsonLdDataIntegrity(W3CJsonLdDataIntegrityFormat credentialConfiguration),
  sdJwtVc(SdJwtVcFormat credentialConfiguration);

  final dynamic value;
  const CredentialSupported(this.value);

  String? getScope() {
    switch (this) {
      case scope:
        return value.value;
      case msoMdoc:
        return value.scope;
      case w3CSignedJwt:
        return value.scope;
      case w3CJsonLdSignedJwt:
        return value.scope;
      case w3CJsonLdDataIntegrity:
        return value.scope;
      case sdJwtVc:
        return value.scope;
    }
  }

  Future<CredentialIssuanceRequest> toIssuanceRequest({
    required IssuanceRequesterType requester,
    ClaimSet? claimSet,
    Proof? proof,
    CredentialIdentifier? credentialIdentifier,
    Function(CredentialResponseEncryption)? responseEncryptionSpecProvider,
  }) async {
    switch (this) {
      case msoMdoc:
      case sdJwtVc:
        final issuerEncryption = requester.issuerMetadata.credentialResponseEncryption;
        final responseEncryptionSpec = responseEncryptionSpecProvider?.call(issuerEncryption);

        if (responseEncryptionSpec != null) {
          switch (issuerEncryption) {
            case required(algorithms, methods):
              if (!algorithms.contains(responseEncryptionSpec.algorithm)) {
                throw CredentialIssuanceError('Response encryption algorithm not supported by issuer');
              }
              if (!methods.contains(responseEncryptionSpec.encryptionMethod)) {
                throw CredentialIssuanceError('Response encryption method not supported by issuer');
              }
            default:
              break;
          }
        }

        return value.toIssuanceRequest(
          responseEncryptionSpec: issuerEncryption.notRequired ? null : responseEncryptionSpec,
          claimSet: claimSet,
          proof: proof,
        );
      default:
        throw ValidationError('Unsupported profile for issuance request');
    }
  }
}

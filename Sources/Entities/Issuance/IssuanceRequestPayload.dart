
import 'package:openid4vci/src/entities/types/credential_configuration_identifier.dart';
import 'package:openid4vci/src/entities/types/credential_identifier.dart';
import 'package:openid4vci/src/entities/types/claim_set.dart';

/// Enum representing different types of issuance request payloads.
enum IssuanceRequestPayload {
  /// Payload type for requests based on credential identifiers.
  identifierBased(
    CredentialConfigurationIdentifier credentialConfigurationIdentifier,
    CredentialIdentifier credentialIdentifier,
  ),
  
  /// Payload type for requests based on credential configurations.
  configurationBased(
    CredentialConfigurationIdentifier credentialConfigurationIdentifier,
    ClaimSet? claimSet,
  );

  CredentialConfigurationIdentifier get credentialConfigurationIdentifier {
    switch (this) {
      case IssuanceRequestPayload.identifierBased(final id, _):
        return id;
      case IssuanceRequestPayload.configurationBased(final id, _):
        return id;
    }
  }

  ClaimSet? get claimSet {
    switch (this) {
      case IssuanceRequestPayload.identifierBased:
        return null;
      case IssuanceRequestPayload.configurationBased(_, final claims):
        return claims;
    }
  }
}

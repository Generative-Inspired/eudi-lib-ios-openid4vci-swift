
import 'package:openid4vci/src/entities/credential_issuer/credential_issuer_id.dart';
import 'package:openid4vci/src/entities/credential_issuer/credential_issuer_metadata.dart';
import 'package:openid4vci/src/entities/types/credential_configuration_identifier.dart';
import 'package:openid4vci/src/entities/types/grants.dart';
import 'package:openid4vci/src/entities/access_management/identity_and_access_management_metadata.dart';

class CredentialOffer {
  final CredentialIssuerId credentialIssuerIdentifier;
  final CredentialIssuerMetadata credentialIssuerMetadata;
  final List<CredentialConfigurationIdentifier> credentialConfigurationIdentifiers;
  final Grants? grants;
  final IdentityAndAccessManagementMetadata authorizationServerMetadata;

  CredentialOffer({
    required this.credentialIssuerIdentifier,
    required this.credentialIssuerMetadata,
    required this.credentialConfigurationIdentifiers,
    this.grants,
    required this.authorizationServerMetadata,
  }) {
    if (credentialConfigurationIdentifiers.isEmpty) {
      throw CredentialOfferRequestError('Empty credentials error');
    }
  }
}

class CredentialOfferRequestError implements Exception {
  final String message;
  CredentialOfferRequestError(this.message);
}

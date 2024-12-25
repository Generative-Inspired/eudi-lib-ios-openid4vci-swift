abstract class IssuerType {
  Future<Result<UnauthorizedRequest, Error>> pushAuthorizationCodeRequest({
    required CredentialOffer credentialOffer,
  });

  Future<Result<AuthorizedRequest, Error>> authorizeWithPreAuthorizationCode({
    required CredentialOffer credentialOffer,
    required IssuanceAuthorization authorizationCode,
    required String clientId,
    String? transactionCode,
  });

  Future<Result<UnauthorizedRequest, Error>> handleAuthorizationCode({
    required UnauthorizedRequest parRequested,
    required IssuanceAuthorization authorizationCode,
  });

  Future<Result<AuthorizedRequest, Error>> requestAccessToken({
    required UnauthorizedRequest authorizationCode,
  });

  // Add remaining method signatures...
}

class Issuer implements IssuerType {
  IssuanceResponseEncryptionSpec? deferredResponseEncryptionSpec;

  final IdentityAndAccessManagementMetadata authorizationServerMetadata;
  final CredentialIssuerMetadata issuerMetadata;
  final OpenId4VCIConfig config;

  final AuthorizationServerClientType authorizer;
  final IssuanceRequesterType issuanceRequester;
  final IssuanceRequesterType deferredIssuanceRequester;
  final NotifyIssuerType notifyIssuer;

  // Implement constructor and methods...
}
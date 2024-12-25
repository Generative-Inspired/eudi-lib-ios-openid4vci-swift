
import 'dart:async';
import 'package:result_type/result_type.dart';

const String OPENID_CREDENTIAL = "openid_credential";

abstract class AuthorizationServerClientType {
  Future<Result<(PKCEVerifier, GetAuthorizationCodeURL), Exception>> authorizationRequestUrl({
    required List<Scope> scopes,
    required List<CredentialConfigurationIdentifier> credentialConfigurationIdentifiers,
    required String state,
    String? issuerState,
  });

  Future<Result<(PKCEVerifier, GetAuthorizationCodeURL), Exception>> submitPushedAuthorizationRequest({
    required List<Scope> scopes,
    required List<CredentialConfigurationIdentifier> credentialConfigurationIdentifiers,
    required String state,
    String? issuerState,
    String? resource,
  });

  Future<Result<(IssuanceAccessToken, CNonce?, AuthorizationDetailsIdentifiers?, TokenType?, int?), ValidationError>> requestAccessTokenAuthFlow({
    required String authorizationCode,
    required String codeVerifier,
  });

  Future<Result<(IssuanceAccessToken, CNonce?, AuthorizationDetailsIdentifiers?, int?), ValidationError>> requestAccessTokenPreAuthFlow({
    required String preAuthorizedCode,
    TxCode? txCode,
    required String clientId,
    String? transactionCode,
  });
}

class AuthorizationServerClient implements AuthorizationServerClientType {
  final OpenId4VCIConfig config;
  final AuthorisationServiceType service;
  final PostingType parPoster;
  final PostingType tokenPoster;
  final Uri? parEndpoint;
  final Uri authorizationEndpoint;
  final Uri tokenEndpoint;
  final Uri redirectionURI;
  final String clientId;
  final IdentityAndAccessManagementMetadata authorizationServerMetadata;
  final CredentialIssuerId credentialIssuerIdentifier;
  final DPoPConstructorType? dpopConstructor;

  static const String responseType = "code";
  static const String grantAuthorizationCode = "authorization_code";
  static const String grantPreauthorizationCode = "urn:ietf:params:oauth:grant-type:pre-authorized_code";

  AuthorizationServerClient({
    required this.service,
    required this.parPoster,
    required this.tokenPoster,
    required this.config,
    required this.authorizationServerMetadata,
    required this.credentialIssuerIdentifier,
    this.dpopConstructor,
  }) : 
    redirectionURI = config.authFlowRedirectionURI,
    clientId = config.clientId {
    // Initialize endpoints based on metadata type
    switch (authorizationServerMetadata) {
      case OIDCMetadata metadata:
        if (metadata.tokenEndpoint == null || Uri.tryParse(metadata.tokenEndpoint!) == null) {
          throw ValidationError("Invalid token endpoint");
        }
        tokenEndpoint = Uri.parse(metadata.tokenEndpoint!);
        
        if (metadata.authorizationEndpoint == null || Uri.tryParse(metadata.authorizationEndpoint!) == null) {
          throw ValidationError("Invalid authorization endpoint");
        }
        authorizationEndpoint = Uri.parse(metadata.authorizationEndpoint!);
        
        parEndpoint = metadata.pushedAuthorizationRequestEndpoint != null 
          ? Uri.parse(metadata.pushedAuthorizationRequestEndpoint!)
          : null;
        break;
        
      case OAuthMetadata metadata:
        // Similar initialization for OAuth metadata
        break;
    }
  }

  // Implement remaining methods following the Swift implementation
}

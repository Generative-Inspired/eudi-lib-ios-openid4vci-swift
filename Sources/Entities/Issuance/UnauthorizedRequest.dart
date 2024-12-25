
import 'package:openid4vci/src/entities/types/credential_identifier.dart';
import 'package:openid4vci/src/entities/types/pkce_verifier.dart';
import 'package:openid4vci/src/entities/issuance/issuance_authorization.dart';

class ParRequested {
  final List<CredentialIdentifier> credentials;
  final GetAuthorizationCodeURL getAuthorizationCodeURL;
  final PKCEVerifier pkceVerifier;
  final String state;

  ParRequested({
    required this.credentials,
    required this.getAuthorizationCodeURL,
    required this.pkceVerifier,
    required this.state,
  });
}

class AuthorizationCodeRetrieved {
  final List<CredentialIdentifier> credentials;
  final IssuanceAuthorization authorizationCode;
  final PKCEVerifier pkceVerifier;

  AuthorizationCodeRetrieved({
    required this.credentials,
    required this.authorizationCode,
    required this.pkceVerifier,
  }) {
    if (authorizationCode is! IssuanceAuthorization) {
      throw Exception("IssuanceAuthorization must be authorization code");
    }
  }
}

enum UnauthorizedRequest {
  par(ParRequested request),
  authorizationCode(AuthorizationCodeRetrieved code);
}

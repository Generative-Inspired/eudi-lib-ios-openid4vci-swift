
import 'package:openid4vci/src/entities/types/get_authorization_code_url.dart';
import 'package:openid4vci/src/entities/types/pkce_verifier.dart';
import 'package:openid4vci/src/entities/types/issuance_authorization.dart';
import 'package:openid4vci/src/entities/types/issuance_access_token.dart';
import 'package:openid4vci/src/entities/types/issued_certificate.dart';

enum AuthCodeFlowIssuance {
  parRequested(GetAuthorizationCodeURL getAuthorizationCodeURL, PKCEVerifier pkceVerifier, String state),
  authorized(IssuanceAuthorization authorizationCode, PKCEVerifier pkceVerifier),
  accessTokenRetrieved(IssuanceAccessToken token),
  issued(DateTime issuedAt, IssuedCertificate certificate);
}

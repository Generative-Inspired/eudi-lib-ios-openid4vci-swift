
import 'package:openid4vci/src/entities/issuance/issuance_access_token.dart';
import 'package:openid4vci/src/entities/issuance/issuance_refresh_token.dart';
import 'package:openid4vci/src/entities/types/authorization_details_identifiers.dart';
import 'package:openid4vci/src/entities/types/c_nonce.dart';

abstract class CanExpire {
  double? get expiresIn;
  
  bool isExpired(double issued, double at) {
    if (issued >= at) {
      return true;
    }
    
    if (expiresIn == null) {
      return false;
    }
    
    double expiration = issued + expiresIn!;
    return expiration <= at;
  }
}

enum AuthorizedRequest {
  noProofRequired(
    IssuanceAccessToken accessToken,
    IssuanceRefreshToken? refreshToken,
    AuthorizationDetailsIdentifiers? credentialIdentifiers,
    double timeStamp,
  ),
  proofRequired(
    IssuanceAccessToken accessToken,
    IssuanceRefreshToken? refreshToken,
    CNonce cNonce,
    AuthorizationDetailsIdentifiers? credentialIdentifiers,
    double timeStamp,
  );

  bool isAccessTokenExpired(double clock) {
    final timestamp = this.timeStamp;
    if (timestamp == null) {
      return true;
    }
    return accessToken?.isExpired(issued: timestamp, at: clock) ?? false;
  }

  bool isRefreshTokenExpired(double clock) {
    final timestamp = this.timeStamp;
    if (timestamp == null) {
      return true;
    }
    return accessToken?.isExpired(issued: timestamp, at: clock) ?? false;
  }

  double? get timeStamp {
    switch (this) {
      case AuthorizedRequest.noProofRequired(_, _, _, final timeStamp):
        return timeStamp;
      case AuthorizedRequest.proofRequired(_, _, _, _, final timeStamp):
        return timeStamp;
    }
  }

  IssuanceAccessToken? get noProofToken {
    switch (this) {
      case AuthorizedRequest.noProofRequired(final accessToken, _, _, _):
        return accessToken;
      case AuthorizedRequest.proofRequired:
        return null;
    }
  }

  IssuanceAccessToken? get proofToken {
    switch (this) {
      case AuthorizedRequest.noProofRequired:
        return null;
      case AuthorizedRequest.proofRequired(final accessToken, _, _, _, _):
        return accessToken;
    }
  }

  IssuanceAccessToken? get accessToken {
    switch (this) {
      case AuthorizedRequest.noProofRequired(final accessToken, _, _, _):
        return accessToken;
      case AuthorizedRequest.proofRequired(final accessToken, _, _, _, _):
        return accessToken;
    }
  }

  AuthorizedRequest handleInvalidProof(CNonce cNonce) {
    switch (this) {
      case AuthorizedRequest.noProofRequired(final accessToken, final refreshToken, final credentialIdentifiers, final timeStamp):
        return AuthorizedRequest.proofRequired(
          accessToken,
          refreshToken,
          cNonce,
          credentialIdentifiers,
          timeStamp,
        );
      default:
        throw Exception("Expected .noProofRequired authorization request");
    }
  }
}

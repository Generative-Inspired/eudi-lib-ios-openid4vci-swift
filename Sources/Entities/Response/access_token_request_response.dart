
class AccessTokenRequestResponse {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final String? refreshToken;
  final String? cNonce;
  final int? cNonceExpiresIn;
  final String? authorizationDetails;

  AccessTokenRequestResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.cNonce,
    this.cNonceExpiresIn,
    this.authorizationDetails,
  });

  factory AccessTokenRequestResponse.fromJson(Map<String, dynamic> json) {
    return AccessTokenRequestResponse(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: json['expires_in'] as int?,
      refreshToken: json['refresh_token'] as String?,
      cNonce: json['c_nonce'] as String?,
      cNonceExpiresIn: json['c_nonce_expires_in'] as int?,
      authorizationDetails: json['authorization_details'] as String?,
    );
  }
}

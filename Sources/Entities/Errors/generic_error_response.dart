
class GenericErrorResponse {
  final String error;
  final String? errorDescription;
  final String? cNonce;
  final int? cNonceExpiresInSeconds;
  final int? interval;

  GenericErrorResponse({
    required this.error,
    this.errorDescription,
    this.cNonce,
    this.cNonceExpiresInSeconds,
    this.interval,
  });

  factory GenericErrorResponse.fromJson(Map<String, dynamic> json) {
    return GenericErrorResponse(
      error: json['error'],
      errorDescription: json['error_description'],
      cNonce: json['c_nonce'],
      cNonceExpiresInSeconds: json['c_nonce_expires_in'],
      interval: json['interval'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'error_description': errorDescription,
      'c_nonce': cNonce,
      'c_nonce_expires_in': cNonceExpiresInSeconds,
      'interval': interval,
    };
  }

  CredentialIssuanceError toIssuanceError() {
    switch (error) {
      case 'invalid_proof':
        if (cNonce != null) {
          return CredentialIssuanceError.invalidProof(
            cNonce: cNonce!,
            cNonceExpiresIn: cNonceExpiresInSeconds,
            errorDescription: errorDescription,
          );
        }
        return CredentialIssuanceError.responseUnparsable(
            "Issuer responded with invalid_proof error but no c_nonce was provided");
      case 'issuance_pending':
        return CredentialIssuanceError._('issuance_pending', interval: interval);
      case 'invalid_token':
        return CredentialIssuanceError.invalidToken();
      default:
        return CredentialIssuanceError.issuanceRequestFailed(error, errorDescription);
    }
  }
}

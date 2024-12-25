
class CredentialIssuanceError implements Exception {
  final String error;
  final String? errorDescription;
  final String? cNonce;
  final int? cNonceExpiresIn;
  final int? interval;

  CredentialIssuanceError._(this.error, {
    this.errorDescription,
    this.cNonce,
    this.cNonceExpiresIn,
    this.interval,
  });

  factory CredentialIssuanceError.pushedAuthorizationRequestFailed(String error, String? errorDescription) =>
      CredentialIssuanceError._('pushedAuthorizationRequestFailed', errorDescription: errorDescription);

  factory CredentialIssuanceError.accessTokenRequestFailed(String error, String? errorDescription) =>
      CredentialIssuanceError._('accessTokenRequestFailed', errorDescription: errorDescription);

  factory CredentialIssuanceError.issuerDoesNotSupportBatchIssuance() =>
      CredentialIssuanceError._('issuerDoesNotSupportBatchIssuance');

  factory CredentialIssuanceError.responseUnparsable(String details) =>
      CredentialIssuanceError._('responseUnparsable', errorDescription: details);

  factory CredentialIssuanceError.invalidIssuanceRequest(String details) =>
      CredentialIssuanceError._('invalidIssuanceRequest', errorDescription: details);

  factory CredentialIssuanceError.cryptographicSuiteNotSupported(String name) =>
      CredentialIssuanceError._('cryptographicSuiteNotSupported', errorDescription: name);

  factory CredentialIssuanceError.cryptographicBindingMethodNotSupported() =>
      CredentialIssuanceError._('cryptographicBindingMethodNotSupported');

  factory CredentialIssuanceError.proofTypeNotSupported() =>
      CredentialIssuanceError._('proofTypeNotSupported');

  factory CredentialIssuanceError.cryptographicAlgorithmNotSupported() =>
      CredentialIssuanceError._('cryptographicAlgorithmNotSupported');

  factory CredentialIssuanceError.issuerDoesNotSupportEncryptedResponses() =>
      CredentialIssuanceError._('issuerDoesNotSupportEncryptedResponses');

  factory CredentialIssuanceError.responseEncryptionAlgorithmNotSupportedByIssuer() =>
      CredentialIssuanceError._('responseEncryptionAlgorithmNotSupportedByIssuer');

  factory CredentialIssuanceError.responseEncryptionMethodNotSupportedByIssuer() =>
      CredentialIssuanceError._('responseEncryptionMethodNotSupportedByIssuer');

  factory CredentialIssuanceError.invalidToken() =>
      CredentialIssuanceError._('invalidToken');

  factory CredentialIssuanceError.issuanceRequestFailed(String error, String? errorDescription) =>
      CredentialIssuanceError._('issuanceRequestFailed', errorDescription: errorDescription);

  factory CredentialIssuanceError.invalidProof({
    required String cNonce,
    int? cNonceExpiresIn,
    String? errorDescription,
  }) => CredentialIssuanceError._('invalidProof',
      cNonce: cNonce,
      cNonceExpiresIn: cNonceExpiresIn,
      errorDescription: errorDescription);

  @override
  String toString() => errorDescription ?? error;
}

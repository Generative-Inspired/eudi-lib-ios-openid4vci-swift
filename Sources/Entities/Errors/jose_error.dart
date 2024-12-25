
enum JOSEError implements Exception {
  notSupportedRequest,
  invalidIdTokenRequest,
  invalidPublicKey,
  invalidJWS,
  invalidSigner,
  invalidVerifier,
  invalidDidIdentifier,
  invalidObjectType;

  String get message {
    switch (this) {
      case JOSEError.notSupportedRequest:
        return "Not supported request";
      case JOSEError.invalidIdTokenRequest:
        return "Invalid ID token request";
      case JOSEError.invalidPublicKey:
        return "Invalid public key";
      case JOSEError.invalidJWS:
        return "Invalid JWS";
      case JOSEError.invalidSigner:
        return "Invalid signer";
      case JOSEError.invalidVerifier:
        return "Invalid verifier";
      case JOSEError.invalidDidIdentifier:
        return "Invalid DID identifier";
      case JOSEError.invalidObjectType:
        return "Invalid object type";
    }
  }
}

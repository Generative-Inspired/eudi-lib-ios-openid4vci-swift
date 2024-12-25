
enum CredentialOfferRequestValidationError implements Exception {
  oneOfCredentialOfferOrCredentialOfferUri,
  invalidCredentialOfferUri,
  invalidCredentialIssuerId,
  invalidCredentials,
  invalidGrants;

  String getMessage([String? details]) {
    switch (this) {
      case CredentialOfferRequestValidationError.oneOfCredentialOfferOrCredentialOfferUri:
        return "Must provide either credential offer or credential offer URI";
      case CredentialOfferRequestValidationError.invalidCredentialOfferUri:
        return "Invalid credential offer URI: ${details ?? ''}";
      case CredentialOfferRequestValidationError.invalidCredentialIssuerId:
        return "Invalid credential issuer ID";
      case CredentialOfferRequestValidationError.invalidCredentials:
        return "Invalid credentials";
      case CredentialOfferRequestValidationError.invalidGrants:
        return "Invalid grants";
    }
  }
}

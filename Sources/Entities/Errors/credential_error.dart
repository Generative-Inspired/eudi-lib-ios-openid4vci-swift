
enum CredentialError {
  genericError,
  issuerDoesNotSupportDeferredIssuance,
  extraneousQueryComponents,
  invalidScheme;

  String get message {
    switch (this) {
      case CredentialError.genericError:
        return "Something went wrong";
      case CredentialError.issuerDoesNotSupportDeferredIssuance:
        return "Issuer does not support deferred issuance";
      case CredentialError.extraneousQueryComponents:
        return "Extraneous query components";
      case CredentialError.invalidScheme:
        return "Invalid scheme";
    }
  }
}

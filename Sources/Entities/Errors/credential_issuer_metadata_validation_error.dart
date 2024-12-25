
enum CredentialIssuerMetadataValidationError implements Exception {
  invalidCredentialIssuerId,
  invalidAuthorizationServer,
  invalidCredentialEndpoint,
  invalidBatchCredentialEndpoint,
  invalidDeferredCredentialEndpoint,
  invalidCredentialResponseEncryptionAlgorithmsSupported,
  invalidCredentialResponseEncryptionMethodsSupported,
  credentialResponseEncryptionAlgorithmsRequired,
  invalidCredentialsSupported,
  credentialsSupportedRequired,
  invalidDisplay,
  invalidNotificationEndpoint;

  String getMessage(String? details) {
    switch (this) {
      case CredentialIssuerMetadataValidationError.invalidCredentialIssuerId:
        return "Invalid credential issuer ID: $details";
      case CredentialIssuerMetadataValidationError.invalidAuthorizationServer:
        return "Invalid authorization server: $details";
      case CredentialIssuerMetadataValidationError.invalidCredentialEndpoint:
        return "Invalid credential endpoint: $details";
      case CredentialIssuerMetadataValidationError.invalidBatchCredentialEndpoint:
        return "Invalid batch credential endpoint: $details";
      case CredentialIssuerMetadataValidationError.invalidDeferredCredentialEndpoint:
        return "Invalid deferred credential endpoint: $details";
      case CredentialIssuerMetadataValidationError.invalidCredentialResponseEncryptionAlgorithmsSupported:
        return "Invalid credential response encryption algorithms supported: $details";
      case CredentialIssuerMetadataValidationError.invalidCredentialResponseEncryptionMethodsSupported:
        return "Invalid credential response encryption methods supported: $details";
      case CredentialIssuerMetadataValidationError.credentialResponseEncryptionAlgorithmsRequired:
        return "Credential response encryption algorithms required";
      case CredentialIssuerMetadataValidationError.invalidCredentialsSupported:
        return "Invalid credentials supported: $details";
      case CredentialIssuerMetadataValidationError.credentialsSupportedRequired:
        return "Credentials supported required";
      case CredentialIssuerMetadataValidationError.invalidDisplay:
        return "Invalid display: $details";
      case CredentialIssuerMetadataValidationError.invalidNotificationEndpoint:
        return "Invalid notification endpoint";
    }
  }
}

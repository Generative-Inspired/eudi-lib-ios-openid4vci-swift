
enum CredentialOfferRequestError implements Exception {
  genericError,
  emptyCredentialsError,
  nonParsableCredentialOfferEndpointUrl,
  unableToFetchCredentialOffer,
  nonParseableCredentialOffer,
  unableToResolveCredentialIssuerMetadata,
  unableToResolveAuthorizationServerMetadata;

  String getMessage([String? details]) {
    switch (this) {
      case CredentialOfferRequestError.genericError:
        return "Generic error occurred";
      case CredentialOfferRequestError.emptyCredentialsError:
        return "Empty credentials error";
      case CredentialOfferRequestError.nonParsableCredentialOfferEndpointUrl:
        return "Non-parsable credential offer endpoint URL: ${details ?? ''}";
      case CredentialOfferRequestError.unableToFetchCredentialOffer:
        return "Unable to fetch credential offer: ${details ?? ''}";
      case CredentialOfferRequestError.nonParseableCredentialOffer:
        return "Non-parseable credential offer: ${details ?? ''}";
      case CredentialOfferRequestError.unableToResolveCredentialIssuerMetadata:
        return "Unable to resolve credential issuer metadata: ${details ?? ''}";
      case CredentialOfferRequestError.unableToResolveAuthorizationServerMetadata:
        return "Unable to resolve authorization server metadata: ${details ?? ''}";
    }
  }
}

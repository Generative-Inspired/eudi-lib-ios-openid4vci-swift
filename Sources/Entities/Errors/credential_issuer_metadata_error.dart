
enum CredentialIssuerMetadataError implements Exception {
  unableToFetchCredentialIssuerMetadata,
  nonParseableCredentialIssuerMetadata;

  String get message {
    switch (this) {
      case CredentialIssuerMetadataError.unableToFetchCredentialIssuerMetadata:
        return "Unable to fetch credential issuer metadata";
      case CredentialIssuerMetadataError.nonParseableCredentialIssuerMetadata:
        return "Unable to parse credential issuer metadata";
    }
  }

  CredentialIssuerMetadataException toException() {
    return CredentialIssuerMetadataException(error: this);
  }

  Never raise() {
    throw toException();
  }
}

class CredentialIssuerMetadataException implements Exception {
  final CredentialIssuerMetadataError error;
  CredentialIssuerMetadataException({required this.error});
}

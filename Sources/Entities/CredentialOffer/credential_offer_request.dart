
enum CredentialOfferRequest {
  passByValue(String metaData),
  fetchByReference(Uri url);

  final dynamic value;
  const CredentialOfferRequest.passByValue(this.value);
  const CredentialOfferRequest.fetchByReference(this.value);

  static CredentialOfferRequest fromUrlString(String urlString) {
    final url = _parseUrl(urlString);
    final parameters = url.queryParameters;

    if (parameters.containsKey('credential_offer') && 
        parameters['credential_offer']!.isNotEmpty) {
      return CredentialOfferRequest.passByValue(parameters['credential_offer']!);
    } else if (parameters.containsKey('credential_offer_uri') && 
               parameters['credential_offer_uri']!.isNotEmpty) {
      final reference = Uri.parse(parameters['credential_offer_uri']!);
      if (reference != null) {
        return CredentialOfferRequest.fetchByReference(reference);
      } else {
        throw CredentialOfferRequestValidationError.invalidCredentialOfferUri(
          parameters['credential_offer_uri']!);
      }
    } else {
      return CredentialOfferRequest.fetchByReference(url);
    }
  }

  static Uri _parseUrl(String string) {
    try {
      return Uri.parse(string);
    } catch (e) {
      try {
        return Uri.parse(Uri.encodeFull(string));
      } catch (e) {
        throw CredentialOfferRequestError.nonParsableCredentialOfferEndpointUrl(
          string);
      }
    }
  }
}

class CredentialOfferRequestError implements Exception {
  final String reason;
  CredentialOfferRequestError.nonParsableCredentialOfferEndpointUrl(this.reason);
}

class CredentialOfferRequestValidationError implements Exception {
  final String uri;
  CredentialOfferRequestValidationError.invalidCredentialOfferUri(this.uri);
}

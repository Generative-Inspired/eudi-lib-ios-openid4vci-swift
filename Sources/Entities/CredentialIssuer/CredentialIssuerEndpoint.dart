
import 'dart:core';

class CredentialError implements Exception {
  final String message;
  CredentialError(this.message);
}

class CredentialIssuerEndpoint {
  final Uri url;

  CredentialIssuerEndpoint._internal(this.url);

  factory CredentialIssuerEndpoint.fromString(String string) {
    final uri = Uri.parse(string);
    if (uri.queryParameters.isNotEmpty) {
      throw CredentialError('URL cannot contain query parameters');
    }
    
    if (uri.fragment != null && uri.fragment.isNotEmpty) {
      throw CredentialError('URL cannot contain fragments');
    }
    
    return CredentialIssuerEndpoint._internal(uri);
  }

  Map<String, dynamic> toJson() => {
    'credential_endpoint': url.toString(),
  };

  factory CredentialIssuerEndpoint.fromJson(Map<String, dynamic> json) {
    final urlString = json['credential_endpoint'] as String;
    return CredentialIssuerEndpoint.fromString(urlString);
  }
}

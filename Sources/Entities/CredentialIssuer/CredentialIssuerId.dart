
import 'dart:core';

class CredentialError implements Exception {
  final String message;
  CredentialError(this.message);
}

class CredentialIssuerId {
  final Uri url;

  CredentialIssuerId._internal(this.url);

  factory CredentialIssuerId.fromString(String string) {
    final uri = Uri.parse(string);
    
    if (uri.queryParameters.isNotEmpty) {
      throw CredentialError('URL cannot contain query parameters');
    }

    if (uri.scheme != 'https') {
      throw CredentialError('URL must use HTTPS scheme');
    }

    if (uri.fragment != null && uri.fragment.isNotEmpty) {
      throw CredentialError('URL cannot contain fragments');
    }

    return CredentialIssuerId._internal(uri);
  }

  Map<String, dynamic> toJson() => {
    'credential_issuer': url.toString(),
  };

  factory CredentialIssuerId.fromJson(Map<String, dynamic> json) {
    final urlString = json['credential_issuer'] as String;
    return CredentialIssuerId.fromString(urlString);
  }
}

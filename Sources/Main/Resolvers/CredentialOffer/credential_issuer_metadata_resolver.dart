
import 'dart:async';
import 'package:result_type/result_type.dart';

enum CredentialIssuerSource {
  credentialIssuer,
}

abstract class CredentialIssuerMetadataType {
  Future<Result<CredentialIssuerMetadata, Exception>> resolve({
    required CredentialIssuerSource source,
  });
}

class CredentialIssuerMetadataResolver implements CredentialIssuerMetadataType {
  final Fetcher<CredentialIssuerMetadata> fetcher;

  CredentialIssuerMetadataResolver({
    Fetcher<CredentialIssuerMetadata>? fetcher,
  }) : fetcher = fetcher ?? Fetcher<CredentialIssuerMetadata>();

  @override
  Future<Result<CredentialIssuerMetadata, Exception>> resolve({
    required CredentialIssuerSource source,
  }) async {
    switch (source) {
      case CredentialIssuerSource.credentialIssuer:
        final url = source.issuerId.url
            .replace(pathSegments: [
              ...url.pathSegments,
              ".well-known",
              "openid-credential-issuer"
            ]);
        return await fetcher.fetch(url: url);
    }
  }
}

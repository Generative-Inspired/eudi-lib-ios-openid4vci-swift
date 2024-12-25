import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('CredentialOfferResolver Tests', () {
    test('Successful resolution of credential offer', () async {
      final resolver = CredentialOfferRequestResolver();
      final resolution = await resolver.resolve(
        source: Source.fromString('https://credential-issuer.example.com')
      );

      expect(resolution.isSuccess, true);
      
      final result = resolution.get();
      expect(result.credentialIssuerIdentifier.url.toString(), 'https://credential-issuer.example.com');
      expect(
        result.credentialIssuerMetadata.batchCredentialEndpoint?.url.toString(), 
        'https://credential-issuer.example.com/credentials/batch'
      );
      expect(
        result.credentialIssuerMetadata.deferredCredentialEndpoint?.url.toString(), 
        'https://credential-issuer.example.com/credentials/deferred'
      );
    });

    test('Failed resolution with invalid URL', () async {
      final resolver = CredentialOfferRequestResolver();
      final resolution = await resolver.resolve(
        source: Source.fromString('invalid-url')
      );

      expect(resolution.isSuccess, false);
    });

    test('Resolution with empty URL fails', () async {
      final resolver = CredentialOfferRequestResolver();
      expect(
        () async => await resolver.resolve(source: Source.fromString('')),
        throwsException
      );
    });
  });
}
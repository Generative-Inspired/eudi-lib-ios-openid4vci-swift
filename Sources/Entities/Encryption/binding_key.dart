
import 'dart:typed_data';
import 'package:jose/jose.dart';
import 'package:openid4vci/src/entities/types/x509_certificate.dart';

abstract class SigningKeyProxy {
  Future<Uint8List> signAsync(Uint8List signingInput);
}

enum BindingKey {
  jwk(
    String algorithm, 
    JsonWebKey jwk,
    SigningKeyProxy privateKey,
    String? issuer
  ),
  did(String identity),
  x509(X509Certificate certificate);

  final dynamic value;
  const BindingKey(this.value);

  Future<Proof> toSupportedProof({
    required IssuanceRequesterType issuanceRequester,
    required CredentialSupported credentialSpec,
    String? cNonce,
  }) async {
    switch (this) {
      case jwk:
        final algorithm = value.algorithm;
        final jwk = value.jwk;
        final privateKey = value.privateKey;
        final issuer = value.issuer;

        switch (credentialSpec) {
          case msoMdoc:
          case sdJwtVc:
            final spec = credentialSpec.value;
            
            if (!spec.proofTypesSupported?['jwt']?.algorithms.contains(algorithm) ?? false) {
              throw CredentialIssuanceError('Cryptographic suite not supported: $algorithm');
            }

            if (!spec.proofTypesSupported?.containsKey('jwt') ?? false) {
              throw CredentialIssuanceError('Proof type not supported');
            }

            final aud = issuanceRequester.issuerMetadata.credentialIssuerIdentifier.url.toString();
            
            final header = {
              'typ': 'openid4vci-proof+jwt',
              'alg': algorithm,
              'jwk': jwk.toJson()
            };

            final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
            final payload = {
              'iat': now,
              'aud': aud,
              if (cNonce != null) 'nonce': cNonce,
              if (issuer != null) 'iss': issuer
            };

            final input = utf8.encode('${base64Url.encode(jsonEncode(header))}.${base64Url.encode(jsonEncode(payload))}');
            final signature = await privateKey.signAsync(input);

            return Proof.jwt('${base64Url.encode(jsonEncode(header))}.${base64Url.encode(jsonEncode(payload))}.${base64Url.encode(signature)}');

          default:
            throw ValidationError('TODO');
        }

      case did:
        throw ValidationError('TODO: did not implemented');
      
      case x509:
        throw ValidationError('TODO: x509 not implemented');
    }
  }
}

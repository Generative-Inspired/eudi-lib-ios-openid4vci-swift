
import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';

class KeyController {
  static AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateRSAKeyPair() {
    final secureRandom = SecureRandom('Fortuna')
      ..seed(KeyParameter(Platform.instance.platformEntropySource().getBytes(32)));
    
    final keyGen = RSAKeyGenerator()
      ..init(ParametersWithRandom(
        RSAKeyGenerationParameters(BigInt.parse('65537'), 2048, 64),
        secureRandom,
      ));

    return keyGen.generateKeyPair();
  }

  static ECKeyPair generateECDHKeyPair() {
    final ecDomain = ECDomainParameters('P-256');
    final keyGen = ECKeyGenerator()
      ..init(ECKeyGeneratorParameters(ecDomain));
    
    return keyGen.generateKeyPair();
  }

  static String convertRSAPrivateKeyToPEM(RSAPrivateKey privateKey) {
    final asn1Sequence = ASN1Sequence();
    // Add ASN.1 encoding for RSA private key
    final bytes = asn1Sequence.encode();
    final base64 = base64Encode(bytes);
    
    return '''-----BEGIN RSA PRIVATE KEY-----
${base64.replaceAllMapped(RegExp('.{64}'), (match) => '${match.group(0)}\n')}
-----END RSA PRIVATE KEY-----''';
  }
}

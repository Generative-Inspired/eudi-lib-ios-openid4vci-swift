
import 'package:jose/jose.dart';

class CredentialResponseEncryptionSpecTO {
  final JsonWebKey jwk;
  final String encryptionAlgorithm;
  final String encryptionMethod;

  CredentialResponseEncryptionSpecTO({
    required this.jwk,
    required this.encryptionAlgorithm,
    required this.encryptionMethod,
  });

  Map<String, dynamic> toJson() => {
    'jwk': jwk.toJson(),
    'alg': encryptionAlgorithm,
    'enc': encryptionMethod,
  };

  factory CredentialResponseEncryptionSpecTO.fromJson(Map<String, dynamic> json) {
    return CredentialResponseEncryptionSpecTO(
      jwk: JsonWebKey.fromJson(json['jwk']),
      encryptionAlgorithm: json['alg'],
      encryptionMethod: json['enc'],
    );
  }
}

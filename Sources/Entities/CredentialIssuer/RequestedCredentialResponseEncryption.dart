
import 'dart:core';

enum EncryptionMethod {
  a128cbcHs256,
  a192cbcHs384,
  a256cbcHs512,
  a128gcm,
  a192gcm,
  a256gcm
}

enum Algorithm {
  rsaOaep,
  rsaOaep256,
  rsaOaep384,
  rsaOaep512,
  ecdh1Pu,
  ecdhEs,
  ecdhEsA128kw,
  ecdhEsA192kw,
  ecdhEsA256kw
}

class RequestedCredentialResponseEncryption {
  final Algorithm alg;
  final EncryptionMethod enc;
  final bool required;

  const RequestedCredentialResponseEncryption({
    required this.alg,
    required this.enc,
    this.required = false,
  });

  factory RequestedCredentialResponseEncryption.fromJson(Map<String, dynamic> json) {
    return RequestedCredentialResponseEncryption(
      alg: _algorithmFromString(json['alg'] as String),
      enc: _encryptionMethodFromString(json['enc'] as String),
      required: json['required'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'alg': _algorithmToString(alg),
    'enc': _encryptionMethodToString(enc),
    'required': required,
  };

  static Algorithm _algorithmFromString(String value) {
    switch (value) {
      case 'RSA-OAEP': return Algorithm.rsaOaep;
      case 'RSA-OAEP-256': return Algorithm.rsaOaep256;
      case 'RSA-OAEP-384': return Algorithm.rsaOaep384;
      case 'RSA-OAEP-512': return Algorithm.rsaOaep512;
      case 'ECDH-1PU': return Algorithm.ecdh1Pu;
      case 'ECDH-ES': return Algorithm.ecdhEs;
      case 'ECDH-ES+A128KW': return Algorithm.ecdhEsA128kw;
      case 'ECDH-ES+A192KW': return Algorithm.ecdhEsA192kw;
      case 'ECDH-ES+A256KW': return Algorithm.ecdhEsA256kw;
      default: throw FormatException('Unknown algorithm: $value');
    }
  }

  static String _algorithmToString(Algorithm alg) {
    switch (alg) {
      case Algorithm.rsaOaep: return 'RSA-OAEP';
      case Algorithm.rsaOaep256: return 'RSA-OAEP-256';
      case Algorithm.rsaOaep384: return 'RSA-OAEP-384';
      case Algorithm.rsaOaep512: return 'RSA-OAEP-512';
      case Algorithm.ecdh1Pu: return 'ECDH-1PU';
      case Algorithm.ecdhEs: return 'ECDH-ES';
      case Algorithm.ecdhEsA128kw: return 'ECDH-ES+A128KW';
      case Algorithm.ecdhEsA192kw: return 'ECDH-ES+A192KW';
      case Algorithm.ecdhEsA256kw: return 'ECDH-ES+A256KW';
    }
  }

  static EncryptionMethod _encryptionMethodFromString(String value) {
    switch (value) {
      case 'A128CBC-HS256': return EncryptionMethod.a128cbcHs256;
      case 'A192CBC-HS384': return EncryptionMethod.a192cbcHs384;
      case 'A256CBC-HS512': return EncryptionMethod.a256cbcHs512;
      case 'A128GCM': return EncryptionMethod.a128gcm;
      case 'A192GCM': return EncryptionMethod.a192gcm;
      case 'A256GCM': return EncryptionMethod.a256gcm;
      default: throw FormatException('Unknown encryption method: $value');
    }
  }

  static String _encryptionMethodToString(EncryptionMethod enc) {
    switch (enc) {
      case EncryptionMethod.a128cbcHs256: return 'A128CBC-HS256';
      case EncryptionMethod.a192cbcHs384: return 'A192CBC-HS384';
      case EncryptionMethod.a256cbcHs512: return 'A256CBC-HS512';
      case EncryptionMethod.a128gcm: return 'A128GCM';
      case EncryptionMethod.a192gcm: return 'A192GCM';
      case EncryptionMethod.a256gcm: return 'A256GCM';
    }
  }
}

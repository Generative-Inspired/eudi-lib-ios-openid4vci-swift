
enum CryptographicBindingMethod {
  jwk,
  x5c,
  coseKey,
  mso;

  static CryptographicBindingMethod? fromDid(String method) {
    if (method.startsWith('did')) {
      return null; // In Dart we'll handle DID methods differently
    }
    throw ValidationError('Unknown cryptographic binding method: $method');
  }

  String toJson() {
    switch (this) {
      case CryptographicBindingMethod.jwk:
        return 'jwk';
      case CryptographicBindingMethod.x5c:
        return 'x5c';
      case CryptographicBindingMethod.coseKey:
        return 'cose_key';
      case CryptographicBindingMethod.mso:
        return 'mso';
    }
  }

  static CryptographicBindingMethod fromJson(String method) {
    switch (method) {
      case 'jwk':
        return CryptographicBindingMethod.jwk;
      case 'x5c':
        return CryptographicBindingMethod.x5c;
      case 'cose_key':
        return CryptographicBindingMethod.coseKey;
      case 'mso':
        return CryptographicBindingMethod.mso;
      default:
        if (method.startsWith('did')) {
          throw ValidationError('DID methods should be handled separately');
        }
        throw ValidationError('Unknown cryptographic binding method: $method');
    }
  }
}

class ValidationError implements Exception {
  final String reason;
  ValidationError(this.reason);
}

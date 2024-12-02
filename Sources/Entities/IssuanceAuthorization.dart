// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

enum IssuanceAuthorizationType {
  authorizationCode,
  preAuthorizationCode,
}

class IssuanceAuthorization {
  final String code;
  final TxCode? txCode;
  final IssuanceAuthorizationType type;

  IssuanceAuthorization._internal(this.code, this.txCode, this.type);

  factory IssuanceAuthorization.authorizationCode(String authorizationCode) {
    if (authorizationCode.isEmpty) {
      throw CredentialError('Generic error');
    }
    return IssuanceAuthorization._internal(
      authorizationCode,
      null,
      IssuanceAuthorizationType.authorizationCode,
    );
  }

  factory IssuanceAuthorization.preAuthorizationCode(
    String? preAuthorizationCode,
    TxCode? txCode,
  ) {
    if (preAuthorizationCode == null) {
      throw ValidationError('Missing preAuthorizationCode');
    }
    if (preAuthorizationCode.isEmpty) {
      throw CredentialError('Generic error');
    }
    return IssuanceAuthorization._internal(
      preAuthorizationCode,
      txCode,
      IssuanceAuthorizationType.preAuthorizationCode,
    );
  }
}

class CredentialError implements Exception {
  final String message;
  CredentialError(this.message);
}

// TxCode class would need to be implemented based on requirements
class TxCode {
  // Implementation details needed
}
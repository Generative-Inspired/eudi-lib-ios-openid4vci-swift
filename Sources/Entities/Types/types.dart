
import 'package:jose/jose.dart';

typedef JWT = String;

class IssuanceResponseEncryptionSpec {
  final JsonWebKey? jwk;
  final dynamic privateKey;  // Platform-specific private key type
  final String algorithm;
  final String encryptionMethod;

  IssuanceResponseEncryptionSpec({
    this.jwk,
    required this.privateKey,
    required this.algorithm,
    required this.encryptionMethod,
  });
}

enum Proof {
  jwt(String jwt),
  cwt(String cwt);

  final String value;
  const Proof(this.value);

  String type() {
    switch (this) {
      case jwt:
        return 'jwt';
      case cwt:
        return 'cwt';
    }
  }

  Map<String, String> toDictionary() {
    switch (this) {
      case jwt(final jwt):
        return {
          'proof_type': 'jwt',
          'jwt': jwt,
        };
      case cwt:
        throw ValidationError(reason: "CWT not supported yet");
    }
  }
}

class Scope {
  final String value;

  Scope(String? value) {
    if (value == null) {
      throw ValidationError(reason: "Scope cannot be nil");
    }
    if (value.isEmpty) {
      throw ValidationError(reason: "Scope cannot be empty");
    }
    this.value = value;
  }
}

enum ContentType {
  form('application/x-www-form-urlencoded'),
  json('application/json');

  final String value;
  const ContentType(this.value);

  static const String key = 'Content-Type';
}

class AccessToken {
  final String value;

  AccessToken(String? value) {
    if (value == null) {
      throw ValidationError(reason: "Nil access token");
    }
    if (value.isEmpty) {
      throw ValidationError(reason: "Empty access token");
    }
    this.value = value;
  }
}

class RefreshToken {
  final String value;

  RefreshToken(String? value) {
    if (value == null) {
      throw ValidationError(reason: "Nil refresh token");
    }
    if (value.isEmpty) {
      throw ValidationError(reason: "Empty refresh token");
    }
    this.value = value;
  }
}

class CNonce {
  final String value;
  final int? expiresInSeconds;

  CNonce({required this.value, this.expiresInSeconds = 5}) {
    if (value.isEmpty) {
      throw ValidationError(reason: "CNonce cannot be empty");
    }
  }
}

class BatchIssuanceSuccessResponse {
  final List<CertificateIssuanceResponse> credentialResponses;
  final String? cNonce;
  final int? cNonceExpiresInSeconds;

  BatchIssuanceSuccessResponse({
    required this.credentialResponses,
    this.cNonce,
    this.cNonceExpiresInSeconds,
  });
}

class Claim {
  final bool? mandatory;
  final String? valueType;
  final List<Display>? display;

  Claim({
    this.mandatory,
    this.valueType,
    this.display,
  });
}

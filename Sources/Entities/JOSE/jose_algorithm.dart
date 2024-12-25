
enum JOSEAlgorithm {
  ES256('ES256'),
  ES384('ES384'),
  ES512('ES512'),
  RS256('RS256'),
  RS384('RS384'),
  RS512('RS512');

  final String name;
  const JOSEAlgorithm(this.name);
}

enum JOSEEncryptionMethod {
  A128CBC_HS256('A128CBC-HS256'),
  A192CBC_HS384('A192CBC-HS384'),
  A256CBC_HS512('A256CBC-HS512');

  final String name;
  const JOSEEncryptionMethod(this.name);
}

enum JWEAlgorithm {
  RSA_OAEP('RSA-OAEP'),
  RSA_OAEP_256('RSA-OAEP-256'),
  ECDH_ES('ECDH-ES');

  final String name;
  const JWEAlgorithm(this.name);
}

enum JWSAlgorithm {
  ES256('ES256'),
  ES384('ES384'),
  ES512('ES512');

  final String name;
  const JWSAlgorithm(this.name);
}

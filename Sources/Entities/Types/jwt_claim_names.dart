
class JWTClaimNames {
  // RFC 7519 claims
  static const String issuer = "iss";
  static const String subject = "sub";
  static const String audience = "aud";
  static const String expirationTime = "exp";
  static const String notBefore = "nbf";
  static const String issuedAt = "iat";
  static const String jwtId = "jti";

  // Additional claims
  static const String nonce = "nonce";
  static const String htm = "htm";
  static const String htu = "htu";
}

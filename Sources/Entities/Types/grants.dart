
class Grants {
  static class AuthorizationCode {
    final String? issuerState;
    final Uri? authorizationServer;

    AuthorizationCode({
      this.issuerState,
      this.authorizationServer,
    }) {
      if (issuerState != null && issuerState!.isEmpty) {
        throw ValidationError(reason: "issuerState cannot be blank");
      }
    }
  }

  static class PreAuthorizedCode {
    final String? preAuthorizedCode;
    final TxCode? txCode;

    PreAuthorizedCode({
      this.preAuthorizedCode,
      this.txCode,
    });
  }

  final AuthorizationCode? authorizationCode;
  final PreAuthorizedCode? preAuthorizedCode;

  Grants.authorizationCode(AuthorizationCode code)
      : authorizationCode = code,
        preAuthorizedCode = null;

  Grants.preAuthorizedCode(PreAuthorizedCode code)
      : authorizationCode = null,
        preAuthorizedCode = code;

  Grants.both(AuthorizationCode authCode, PreAuthorizedCode preAuthCode)
      : authorizationCode = authCode,
        preAuthorizedCode = preAuthCode;
}


class GrantsDTO {
  final AuthorizationCode? authorizationCode;
  final PreAuthorizationCode? preAuthorizationCode;

  GrantsDTO({
    this.authorizationCode,
    this.preAuthorizationCode,
  });

  Map<String, dynamic> toJson() => {
    'authorization_code': authorizationCode?.toJson(),
    'urn:ietf:params:oauth:grant-type:pre-authorized_code':
        preAuthorizationCode?.toJson(),
  };

  factory GrantsDTO.fromJson(Map<String, dynamic> json) {
    return GrantsDTO(
      authorizationCode: json['authorization_code'] != null
          ? AuthorizationCode.fromJson(json['authorization_code'])
          : null,
      preAuthorizationCode:
          json['urn:ietf:params:oauth:grant-type:pre-authorized_code'] != null
              ? PreAuthorizationCode.fromJson(
                  json['urn:ietf:params:oauth:grant-type:pre-authorized_code'])
              : null,
    );
  }

  static class AuthorizationCode {
    final String? issuerState;
    final String? authorizationServer;

    AuthorizationCode({
      this.issuerState,
      this.authorizationServer,
    });

    Map<String, dynamic> toJson() => {
      'issuer_state': issuerState,
      'authorization_server': authorizationServer,
    };

    factory AuthorizationCode.fromJson(Map<String, dynamic> json) {
      return AuthorizationCode(
        issuerState: json['issuer_state'],
        authorizationServer: json['authorization_server'],
      );
    }
  }

  static class PreAuthorizationCode {
    final String? preAuthorizedCode;
    final TxCode? txCode;

    PreAuthorizationCode({
      this.preAuthorizedCode,
      this.txCode,
    });

    Map<String, dynamic> toJson() => {
      'pre-authorized_code': preAuthorizedCode,
      'tx_code': txCode?.toJson(),
    };

    factory PreAuthorizationCode.fromJson(Map<String, dynamic> json) {
      return PreAuthorizationCode(
        preAuthorizedCode: json['pre-authorized_code'],
        txCode: json['tx_code'] != null ? TxCode.fromJson(json['tx_code']) : null,
      );
    }
  }
}

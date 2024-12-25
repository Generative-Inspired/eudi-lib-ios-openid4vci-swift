
class AuthorizationToken {
  final String value;
  final String? scope;
  final String? credentialConfigurationId;

  AuthorizationToken({
    required this.value,
    this.scope,
    this.credentialConfigurationId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'value': value,
    };
    if (scope != null) map['scope'] = scope;
    if (credentialConfigurationId != null) {
      map['credential_configuration_id'] = credentialConfigurationId;
    }
    return map;
  }

  factory AuthorizationToken.fromJson(Map<String, dynamic> json) {
    return AuthorizationToken(
      value: json['value'] as String,
      scope: json['scope'] as String?,
      credentialConfigurationId: json['credential_configuration_id'] as String?,
    );
  }
}

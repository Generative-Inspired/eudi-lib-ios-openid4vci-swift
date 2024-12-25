
class AuthorizationServerMetadata {
  final String? issuer;
  final String? authorizationEndpoint;
  final String? tokenEndpoint;
  final String? introspectionEndpoint;
  final String? jwksURI;
  final List<String>? grantTypesSupported;
  final List<String>? responseTypesSupported;
  final List<String>? requestObjectSigningAlgValuesSupported;
  final List<String>? requestObjectEncryptionAlgValuesSupported;
  final List<String>? requestObjectEncryptionEncValuesSupported;
  final List<String>? responseModesSupported;
  final String? registrationEndpoint;
  final List<String>? tokenEndpointAuthMethodsSupported;
  final List<String>? tokenEndpointAuthSigningAlgValuesSupported;
  final List<String>? introspectionEndpointAuthMethodsSupported;
  final List<String>? introspectionEndpointAuthSigningAlgValuesSupported;
  final List<String>? authorizationSigningAlgValuesSupported;
  final List<String>? authorizationEncryptionAlgValuesSupported;
  final List<String>? authorizationEncryptionEncValuesSupported;
  final List<String>? scopesSupported;
  final bool? requestParameterSupported;
  final bool? requestURIParameterSupported;
  final bool? requireRequestURIRegistration;
  final List<String>? codeChallengeMethodsSupported;
  final bool? tlsClientCertificateBoundAccessTokens;
  final List<String>? dpopSigningAlgValuesSupported;
  final String? revocationEndpoint;
  final List<String>? revocationEndpointAuthMethodsSupported;
  final List<String>? revocationEndpointAuthSigningAlgValuesSupported;
  final String? deviceAuthorizationEndpoint;
  final List<String>? backchannelTokenDeliveryModesSupported;
  final String? backchannelAuthenticationEndpoint;
  final List<String>? backchannelAuthenticationRequestSigningAlgValuesSupported;
  final bool? requirePushedAuthorizationRequests;
  final String? pushedAuthorizationRequestEndpoint;
  final MtlsEndpointAliases? mtlsEndpointAliases;
  final bool? authorizationResponseIssParameterSupported;

  AuthorizationServerMetadata({
    this.issuer,
    this.authorizationEndpoint,
    this.tokenEndpoint,
    this.introspectionEndpoint,
    this.jwksURI,
    this.grantTypesSupported,
    this.responseTypesSupported,
    this.requestObjectSigningAlgValuesSupported,
    this.requestObjectEncryptionAlgValuesSupported,
    this.requestObjectEncryptionEncValuesSupported,
    this.responseModesSupported,
    this.registrationEndpoint,
    this.tokenEndpointAuthMethodsSupported,
    this.tokenEndpointAuthSigningAlgValuesSupported,
    this.introspectionEndpointAuthMethodsSupported,
    this.introspectionEndpointAuthSigningAlgValuesSupported,
    this.authorizationSigningAlgValuesSupported,
    this.authorizationEncryptionAlgValuesSupported,
    this.authorizationEncryptionEncValuesSupported,
    this.scopesSupported,
    this.requestParameterSupported,
    this.requestURIParameterSupported,
    this.requireRequestURIRegistration,
    this.codeChallengeMethodsSupported,
    this.tlsClientCertificateBoundAccessTokens,
    this.dpopSigningAlgValuesSupported,
    this.revocationEndpoint,
    this.revocationEndpointAuthMethodsSupported,
    this.revocationEndpointAuthSigningAlgValuesSupported,
    this.deviceAuthorizationEndpoint,
    this.backchannelTokenDeliveryModesSupported,
    this.backchannelAuthenticationEndpoint,
    this.backchannelAuthenticationRequestSigningAlgValuesSupported,
    this.requirePushedAuthorizationRequests,
    this.pushedAuthorizationRequestEndpoint,
    this.mtlsEndpointAliases,
    this.authorizationResponseIssParameterSupported,
  });

  Map<String, dynamic> toJson() => {
    'issuer': issuer,
    'authorization_endpoint': authorizationEndpoint,
    'token_endpoint': tokenEndpoint,
    'introspection_endpoint': introspectionEndpoint,
    'jwks_uri': jwksURI,
    'grant_types_supported': grantTypesSupported,
    'response_types_supported': responseTypesSupported,
    'request_object_signing_alg_values_supported': requestObjectSigningAlgValuesSupported,
    'request_object_encryption_alg_values_supported': requestObjectEncryptionAlgValuesSupported,
    'request_object_encryption_enc_values_supported': requestObjectEncryptionEncValuesSupported,
    'response_modes_supported': responseModesSupported,
    'registration_endpoint': registrationEndpoint,
    'token_endpoint_auth_methods_supported': tokenEndpointAuthMethodsSupported,
    'token_endpoint_auth_signing_alg_values_supported': tokenEndpointAuthSigningAlgValuesSupported,
    'introspection_endpoint_auth_methods_supported': introspectionEndpointAuthMethodsSupported,
    'introspection_endpoint_auth_signing_alg_values_supported': introspectionEndpointAuthSigningAlgValuesSupported,
    'authorization_signing_alg_values_supported': authorizationSigningAlgValuesSupported,
    'authorization_encryption_alg_values_supported': authorizationEncryptionAlgValuesSupported,
    'authorization_encryption_enc_values_supported': authorizationEncryptionEncValuesSupported,
    'scopes_supported': scopesSupported,
    'request_parameter_supported': requestParameterSupported,
    'request_uri_parameter_supported': requestURIParameterSupported,
    'require_request_uri_registration': requireRequestURIRegistration,
    'code_challenge_methods_supported': codeChallengeMethodsSupported,
    'tls_client_certificate_bound_access_tokens': tlsClientCertificateBoundAccessTokens,
    'dpop_signing_alg_values_supported': dpopSigningAlgValuesSupported,
    'revocation_endpoint': revocationEndpoint,
    'revocation_endpoint_auth_methods_supported': revocationEndpointAuthMethodsSupported,
    'revocation_endpoint_auth_signing_alg_values_supported': revocationEndpointAuthSigningAlgValuesSupported,
    'device_authorization_endpoint': deviceAuthorizationEndpoint,
    'backchannel_token_delivery_modes_supported': backchannelTokenDeliveryModesSupported,
    'backchannel_authentication_endpoint': backchannelAuthenticationEndpoint,
    'backchannel_authentication_request_signing_alg_values_supported': backchannelAuthenticationRequestSigningAlgValuesSupported,
    'require_pushed_authorization_requests': requirePushedAuthorizationRequests,
    'pushed_authorization_request_endpoint': pushedAuthorizationRequestEndpoint,
    'mtls_endpoint_aliases': mtlsEndpointAliases?.toJson(),
    'authorization_response_iss_parameter_supported': authorizationResponseIssParameterSupported,
  };

  factory AuthorizationServerMetadata.fromJson(Map<String, dynamic> json) {
    return AuthorizationServerMetadata(
      issuer: json['issuer'],
      authorizationEndpoint: json['authorization_endpoint'],
      tokenEndpoint: json['token_endpoint'],
      introspectionEndpoint: json['introspection_endpoint'],
      jwksURI: json['jwks_uri'],
      grantTypesSupported: List<String>.from(json['grant_types_supported'] ?? []),
      responseTypesSupported: List<String>.from(json['response_types_supported'] ?? []),
      requestObjectSigningAlgValuesSupported: List<String>.from(json['request_object_signing_alg_values_supported'] ?? []),
      requestObjectEncryptionAlgValuesSupported: List<String>.from(json['request_object_encryption_alg_values_supported'] ?? []),
      requestObjectEncryptionEncValuesSupported: List<String>.from(json['request_object_encryption_enc_values_supported'] ?? []),
      responseModesSupported: List<String>.from(json['response_modes_supported'] ?? []),
      registrationEndpoint: json['registration_endpoint'],
      tokenEndpointAuthMethodsSupported: List<String>.from(json['token_endpoint_auth_methods_supported'] ?? []),
      tokenEndpointAuthSigningAlgValuesSupported: List<String>.from(json['token_endpoint_auth_signing_alg_values_supported'] ?? []),
      introspectionEndpointAuthMethodsSupported: List<String>.from(json['introspection_endpoint_auth_methods_supported'] ?? []),
      introspectionEndpointAuthSigningAlgValuesSupported: List<String>.from(json['introspection_endpoint_auth_signing_alg_values_supported'] ?? []),
      authorizationSigningAlgValuesSupported: List<String>.from(json['authorization_signing_alg_values_supported'] ?? []),
      authorizationEncryptionAlgValuesSupported: List<String>.from(json['authorization_encryption_alg_values_supported'] ?? []),
      authorizationEncryptionEncValuesSupported: List<String>.from(json['authorization_encryption_enc_values_supported'] ?? []),
      scopesSupported: List<String>.from(json['scopes_supported'] ?? []),
      requestParameterSupported: json['request_parameter_supported'],
      requestURIParameterSupported: json['request_uri_parameter_supported'],
      requireRequestURIRegistration: json['require_request_uri_registration'],
      codeChallengeMethodsSupported: List<String>.from(json['code_challenge_methods_supported'] ?? []),
      tlsClientCertificateBoundAccessTokens: json['tls_client_certificate_bound_access_tokens'],
      dpopSigningAlgValuesSupported: List<String>.from(json['dpop_signing_alg_values_supported'] ?? []),
      revocationEndpoint: json['revocation_endpoint'],
      revocationEndpointAuthMethodsSupported: List<String>.from(json['revocation_endpoint_auth_methods_supported'] ?? []),
      revocationEndpointAuthSigningAlgValuesSupported: List<String>.from(json['revocation_endpoint_auth_signing_alg_values_supported'] ?? []),
      deviceAuthorizationEndpoint: json['device_authorization_endpoint'],
      backchannelTokenDeliveryModesSupported: List<String>.from(json['backchannel_token_delivery_modes_supported'] ?? []),
      backchannelAuthenticationEndpoint: json['backchannel_authentication_endpoint'],
      backchannelAuthenticationRequestSigningAlgValuesSupported: List<String>.from(json['backchannel_authentication_request_signing_alg_values_supported'] ?? []),
      requirePushedAuthorizationRequests: json['require_pushed_authorization_requests'],
      pushedAuthorizationRequestEndpoint: json['pushed_authorization_request_endpoint'],
      mtlsEndpointAliases: json['mtls_endpoint_aliases'] != null ? MtlsEndpointAliases.fromJson(json['mtls_endpoint_aliases']) : null,
      authorizationResponseIssParameterSupported: json['authorization_response_iss_parameter_supported'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorizationServerMetadata &&
          runtimeType == other.runtimeType &&
          authorizationEndpoint == other.authorizationEndpoint;

  @override
  int get hashCode => authorizationEndpoint.hashCode;
}

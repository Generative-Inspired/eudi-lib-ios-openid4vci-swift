
class OIDCProviderMetadata {
  final String? issuer;
  final String? authorizationEndpoint;
  final String? tokenEndpoint;
  final String? introspectionEndpoint;
  final String? userinfoEndpoint;
  final String? endSessionEndpoint;
  final bool? frontchannelLogoutSessionSupported;
  final bool? frontchannelLogoutSupported;
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
  final bool? backchannelLogoutSupported;
  final bool? backchannelLogoutSessionSupported;
  final String? deviceAuthorizationEndpoint;
  final List<String>? backchannelTokenDeliveryModesSupported;
  final String? backchannelAuthenticationEndpoint;
  final List<String>? backchannelAuthenticationRequestSigningAlgValuesSupported;
  final bool? requirePushedAuthorizationRequests;
  final String? pushedAuthorizationRequestEndpoint;
  final dynamic mtlsEndpointAliases;
  final bool? authorizationResponseIssParameterSupported;

  OIDCProviderMetadata({
    this.issuer,
    this.authorizationEndpoint,
    this.tokenEndpoint,
    this.introspectionEndpoint,
    this.userinfoEndpoint,
    this.endSessionEndpoint,
    this.frontchannelLogoutSessionSupported,
    this.frontchannelLogoutSupported,
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
    this.backchannelLogoutSupported,
    this.backchannelLogoutSessionSupported,
    this.deviceAuthorizationEndpoint,
    this.backchannelTokenDeliveryModesSupported,
    this.backchannelAuthenticationEndpoint,
    this.backchannelAuthenticationRequestSigningAlgValuesSupported,
    this.requirePushedAuthorizationRequests,
    this.pushedAuthorizationRequestEndpoint,
    this.mtlsEndpointAliases,
    this.authorizationResponseIssParameterSupported,
  });

  factory OIDCProviderMetadata.fromJson(Map<String, dynamic> json) {
    return OIDCProviderMetadata(
      issuer: json['issuer'] as String?,
      authorizationEndpoint: json['authorization_endpoint'] as String?,
      tokenEndpoint: json['token_endpoint'] as String?,
      introspectionEndpoint: json['introspection_endpoint'] as String?,
      userinfoEndpoint: json['userinfo_endpoint'] as String?,
      endSessionEndpoint: json['end_session_endpoint'] as String?,
      frontchannelLogoutSessionSupported: json['frontchannel_logout_session_supported'] as bool?,
      frontchannelLogoutSupported: json['frontchannel_logout_supported'] as bool?,
      jwksURI: json['jwks_uri'] as String?,
      grantTypesSupported: (json['grant_types_supported'] as List<dynamic>?)?.cast<String>(),
      responseTypesSupported: (json['response_types_supported'] as List<dynamic>?)?.cast<String>(),
      requestObjectSigningAlgValuesSupported: (json['request_object_signing_alg_values_supported'] as List<dynamic>?)?.cast<String>(),
      requestObjectEncryptionAlgValuesSupported: (json['request_object_encryption_alg_values_supported'] as List<dynamic>?)?.cast<String>(),
      requestObjectEncryptionEncValuesSupported: (json['request_object_encryption_enc_values_supported'] as List<dynamic>?)?.cast<String>(),
      responseModesSupported: (json['response_modes_supported'] as List<dynamic>?)?.cast<String>(),
      registrationEndpoint: json['registration_endpoint'] as String?,
      tokenEndpointAuthMethodsSupported: (json['token_endpoint_auth_methods_supported'] as List<dynamic>?)?.cast<String>(),
      tokenEndpointAuthSigningAlgValuesSupported: (json['token_endpoint_auth_signing_alg_values_supported'] as List<dynamic>?)?.cast<String>(),
      introspectionEndpointAuthMethodsSupported: (json['introspection_endpoint_auth_methods_supported'] as List<dynamic>?)?.cast<String>(),
      introspectionEndpointAuthSigningAlgValuesSupported: (json['introspection_endpoint_auth_signing_alg_values_supported'] as List<dynamic>?)?.cast<String>(),
      authorizationSigningAlgValuesSupported: (json['authorization_signing_alg_values_supported'] as List<dynamic>?)?.cast<String>(),
      authorizationEncryptionAlgValuesSupported: (json['authorization_encryption_alg_values_supported'] as List<dynamic>?)?.cast<String>(),
      authorizationEncryptionEncValuesSupported: (json['authorization_encryption_enc_values_supported'] as List<dynamic>?)?.cast<String>(),
      scopesSupported: (json['scopes_supported'] as List<dynamic>?)?.cast<String>(),
      requestParameterSupported: json['request_parameter_supported'] as bool?,
      requestURIParameterSupported: json['request_uri_parameter_supported'] as bool?,
      requireRequestURIRegistration: json['require_request_uri_registration'] as bool?,
      codeChallengeMethodsSupported: (json['code_challenge_methods_supported'] as List<dynamic>?)?.cast<String>(),
      tlsClientCertificateBoundAccessTokens: json['tls_client_certificate_bound_access_tokens'] as bool?,
      dpopSigningAlgValuesSupported: (json['dpop_signing_alg_values_supported'] as List<dynamic>?)?.cast<String>(),
      revocationEndpoint: json['revocation_endpoint'] as String?,
      revocationEndpointAuthMethodsSupported: (json['revocation_endpoint_auth_methods_supported'] as List<dynamic>?)?.cast<String>(),
      revocationEndpointAuthSigningAlgValuesSupported: (json['revocation_endpoint_auth_signing_alg_values_supported'] as List<dynamic>?)?.cast<String>(),
      backchannelLogoutSupported: json['backchannel_logout_supported'] as bool?,
      backchannelLogoutSessionSupported: json['backchannel_logout_session_supported'] as bool?,
      deviceAuthorizationEndpoint: json['device_authorization_endpoint'] as String?,
      backchannelTokenDeliveryModesSupported: (json['backchannel_token_delivery_modes_supported'] as List<dynamic>?)?.cast<String>(),
      backchannelAuthenticationEndpoint: json['backchannel_authentication_endpoint'] as String?,
      backchannelAuthenticationRequestSigningAlgValuesSupported: (json['backchannel_authentication_request_signing_alg_values_supported'] as List<dynamic>?)?.cast<String>(),
      requirePushedAuthorizationRequests: json['require_pushed_authorization_requests'] as bool?,
      pushedAuthorizationRequestEndpoint: json['pushed_authorization_request_endpoint'] as String?,
      mtlsEndpointAliases: json['mtls_endpoint_aliases'],
      authorizationResponseIssParameterSupported: json['authorization_response_iss_parameter_supported'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    if (issuer != null) 'issuer': issuer,
    if (authorizationEndpoint != null) 'authorization_endpoint': authorizationEndpoint,
    if (tokenEndpoint != null) 'token_endpoint': tokenEndpoint,
    if (introspectionEndpoint != null) 'introspection_endpoint': introspectionEndpoint,
    if (userinfoEndpoint != null) 'userinfo_endpoint': userinfoEndpoint,
    if (endSessionEndpoint != null) 'end_session_endpoint': endSessionEndpoint,
    if (frontchannelLogoutSessionSupported != null) 'frontchannel_logout_session_supported': frontchannelLogoutSessionSupported,
    if (frontchannelLogoutSupported != null) 'frontchannel_logout_supported': frontchannelLogoutSupported,
    if (jwksURI != null) 'jwks_uri': jwksURI,
    if (grantTypesSupported != null) 'grant_types_supported': grantTypesSupported,
    if (responseTypesSupported != null) 'response_types_supported': responseTypesSupported,
    if (requestObjectSigningAlgValuesSupported != null) 'request_object_signing_alg_values_supported': requestObjectSigningAlgValuesSupported,
    if (requestObjectEncryptionAlgValuesSupported != null) 'request_object_encryption_alg_values_supported': requestObjectEncryptionAlgValuesSupported,
    if (requestObjectEncryptionEncValuesSupported != null) 'request_object_encryption_enc_values_supported': requestObjectEncryptionEncValuesSupported,
    if (responseModesSupported != null) 'response_modes_supported': responseModesSupported,
    if (registrationEndpoint != null) 'registration_endpoint': registrationEndpoint,
    if (tokenEndpointAuthMethodsSupported != null) 'token_endpoint_auth_methods_supported': tokenEndpointAuthMethodsSupported,
    if (tokenEndpointAuthSigningAlgValuesSupported != null) 'token_endpoint_auth_signing_alg_values_supported': tokenEndpointAuthSigningAlgValuesSupported,
    if (introspectionEndpointAuthMethodsSupported != null) 'introspection_endpoint_auth_methods_supported': introspectionEndpointAuthMethodsSupported,
    if (introspectionEndpointAuthSigningAlgValuesSupported != null) 'introspection_endpoint_auth_signing_alg_values_supported': introspectionEndpointAuthSigningAlgValuesSupported,
    if (authorizationSigningAlgValuesSupported != null) 'authorization_signing_alg_values_supported': authorizationSigningAlgValuesSupported,
    if (authorizationEncryptionAlgValuesSupported != null) 'authorization_encryption_alg_values_supported': authorizationEncryptionAlgValuesSupported,
    if (authorizationEncryptionEncValuesSupported != null) 'authorization_encryption_enc_values_supported': authorizationEncryptionEncValuesSupported,
    if (scopesSupported != null) 'scopes_supported': scopesSupported,
    if (requestParameterSupported != null) 'request_parameter_supported': requestParameterSupported,
    if (requestURIParameterSupported != null) 'request_uri_parameter_supported': requestURIParameterSupported,
    if (requireRequestURIRegistration != null) 'require_request_uri_registration': requireRequestURIRegistration,
    if (codeChallengeMethodsSupported != null) 'code_challenge_methods_supported': codeChallengeMethodsSupported,
    if (tlsClientCertificateBoundAccessTokens != null) 'tls_client_certificate_bound_access_tokens': tlsClientCertificateBoundAccessTokens,
    if (dpopSigningAlgValuesSupported != null) 'dpop_signing_alg_values_supported': dpopSigningAlgValuesSupported,
    if (revocationEndpoint != null) 'revocation_endpoint': revocationEndpoint,
    if (revocationEndpointAuthMethodsSupported != null) 'revocation_endpoint_auth_methods_supported': revocationEndpointAuthMethodsSupported,
    if (revocationEndpointAuthSigningAlgValuesSupported != null) 'revocation_endpoint_auth_signing_alg_values_supported': revocationEndpointAuthSigningAlgValuesSupported,
    if (backchannelLogoutSupported != null) 'backchannel_logout_supported': backchannelLogoutSupported,
    if (backchannelLogoutSessionSupported != null) 'backchannel_logout_session_supported': backchannelLogoutSessionSupported,
    if (deviceAuthorizationEndpoint != null) 'device_authorization_endpoint': deviceAuthorizationEndpoint,
    if (backchannelTokenDeliveryModesSupported != null) 'backchannel_token_delivery_modes_supported': backchannelTokenDeliveryModesSupported,
    if (backchannelAuthenticationEndpoint != null) 'backchannel_authentication_endpoint': backchannelAuthenticationEndpoint,
    if (backchannelAuthenticationRequestSigningAlgValuesSupported != null) 'backchannel_authentication_request_signing_alg_values_supported': backchannelAuthenticationRequestSigningAlgValuesSupported,
    if (requirePushedAuthorizationRequests != null) 'require_pushed_authorization_requests': requirePushedAuthorizationRequests,
    if (pushedAuthorizationRequestEndpoint != null) 'pushed_authorization_request_endpoint': pushedAuthorizationRequestEndpoint,
    if (mtlsEndpointAliases != null) 'mtls_endpoint_aliases': mtlsEndpointAliases,
    if (authorizationResponseIssParameterSupported != null) 'authorization_response_iss_parameter_supported': authorizationResponseIssParameterSupported,
  };
}

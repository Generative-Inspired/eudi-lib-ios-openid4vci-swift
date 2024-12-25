
enum IdentityAndAccessManagementMetadata {
  oidc(OIDCProviderMetadata metadata),
  oauth(AuthorizationServerMetadata metadata);
  
  final dynamic metadata;
  
  const IdentityAndAccessManagementMetadata(this.metadata);
  
  bool get isOidc => this == IdentityAndAccessManagementMetadata.oidc;
  bool get isOauth => this == IdentityAndAccessManagementMetadata.oauth;
}

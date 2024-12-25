
import 'dart:async';
import 'package:result_type/result_type.dart';

enum URLModificationType {
  appendPathComponents,
  insertPathComponents,
}

abstract class AuthorizationServerMetadataResolverType {
  Future<Result<IdentityAndAccessManagementMetadata, Exception>> resolve({
    required Uri url,
  });
}

class AuthorizationServerMetadataResolver implements AuthorizationServerMetadataResolverType {
  final Fetcher<OIDCProviderMetadata> oidcFetcher;
  final Fetcher<AuthorizationServerMetadata> oauthFetcher;

  AuthorizationServerMetadataResolver({
    Fetcher<OIDCProviderMetadata>? oidcFetcher,
    Fetcher<AuthorizationServerMetadata>? oauthFetcher,
  })  : oidcFetcher = oidcFetcher ?? Fetcher<OIDCProviderMetadata>(),
        oauthFetcher = oauthFetcher ?? Fetcher<AuthorizationServerMetadata>();

  @override
  Future<Result<IdentityAndAccessManagementMetadata, Exception>> resolve({
    required Uri url,
  }) async {
    final oidc = await fetchOIDCProviderMetadata(
      fetcher: oidcFetcher,
      url: url,
    );
    
    if (oidc != null) {
      return Result.success(IdentityAndAccessManagementMetadata.oidc(oidc));
    }

    final oauth = await fetchAuthorizationServerMetadata(
      fetcher: oauthFetcher,
      url: url,
    );
    
    if (oauth != null) {
      return Result.success(IdentityAndAccessManagementMetadata.oauth(oauth));
    }

    return Result.failure(ValidationError.error(reason: "Unable to fetch metadata"));
  }

  Future<OIDCProviderMetadata?> fetchOIDCProviderMetadata({
    required Fetcher<OIDCProviderMetadata> fetcher,
    required Uri url,
  }) async {
    try {
      final insertedUrl = modifyURL(
        url: url,
        modificationType: URLModificationType.insertPathComponents,
        component1: ".well-known",
        component2: "openid-configuration",
      );
      
      if (insertedUrl == null) return null;
      
      return await fetcher.fetch(url: insertedUrl).then((result) => result.success);
    } catch (_) {
      final appendedUrl = modifyURL(
        url: url,
        modificationType: URLModificationType.appendPathComponents,
        component1: ".well-known",
        component2: "openid-configuration",
      );
      
      if (appendedUrl == null) return null;
      
      try {
        return await fetcher.fetch(url: appendedUrl).then((result) => result.success);
      } catch (_) {
        return null;
      }
    }
  }

  Future<AuthorizationServerMetadata?> fetchAuthorizationServerMetadata({
    required Fetcher<AuthorizationServerMetadata> fetcher,
    required Uri url,
  }) async {
    try {
      final insertedUrl = modifyURL(
        url: url,
        modificationType: URLModificationType.insertPathComponents,
        component1: ".well-known",
        component2: "oauth-authorization-server",
      );
      
      if (insertedUrl == null) return null;
      
      return await fetcher.fetch(url: insertedUrl).then((result) => result.success);
    } catch (_) {
      final appendedUrl = modifyURL(
        url: url,
        modificationType: URLModificationType.appendPathComponents,
        component1: ".well-known",
        component2: "oauth-authorization-server",
      );
      
      if (appendedUrl == null) return null;
      
      try {
        return await fetcher.fetch(url: appendedUrl).then((result) => result.success);
      } catch (_) {
        return null;
      }
    }
  }

  Uri? modifyURL({
    required Uri url,
    required URLModificationType modificationType,
    required String component1,
    required String component2,
  }) {
    switch (modificationType) {
      case URLModificationType.appendPathComponents:
        return url.replace(
          path: "${url.path}/$component1/$component2",
        );
        
      case URLModificationType.insertPathComponents:
        final pathComponents = url.pathSegments.where((s) => s.isNotEmpty).toList();
        
        if (url.host != null) {
          if (pathComponents.isEmpty) {
            pathComponents.addAll([component1, component2]);
          } else {
            pathComponents.insertAll(0, [component1, component2]);
          }
          return url.replace(pathSegments: pathComponents);
        }
    }
    return null;
  }
}

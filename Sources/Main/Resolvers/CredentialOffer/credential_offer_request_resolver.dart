
import 'dart:async';
import 'package:result_type/result_type.dart';

class CredentialOfferRequestResolver {
  final Fetcher<CredentialOfferRequestObject> fetcher;
  final CredentialIssuerMetadataResolver credentialIssuerMetadataResolver;
  final AuthorizationServerMetadataResolver authorizationServerMetadataResolver;

  CredentialOfferRequestResolver({
    Fetcher<CredentialOfferRequestObject>? fetcher,
    CredentialIssuerMetadataResolver? credentialIssuerMetadataResolver,
    AuthorizationServerMetadataResolver? authorizationServerMetadataResolver,
  })  : fetcher = fetcher ?? Fetcher<CredentialOfferRequestObject>(),
        credentialIssuerMetadataResolver = credentialIssuerMetadataResolver ?? CredentialIssuerMetadataResolver(),
        authorizationServerMetadataResolver = authorizationServerMetadataResolver ?? AuthorizationServerMetadataResolver();

  Future<Result<CredentialOffer, Exception>> resolve({
    CredentialOfferRequest? source,
  }) async {
    if (source == null) {
      return Result.failure(ValidationError.error(reason: "Invalid source"));
    }

    try {
      switch (source) {
        case CredentialOfferRequest.passByValue:
          return await handlePassByValue(value: source.value);
          
        case CredentialOfferRequest.fetchByReference:
          return await handleFetchByReference(url: source.url);
      }
    } catch (error) {
      return Result.failure(ValidationError.error(reason: error.toString()));
    }
  }

  Future<Result<CredentialOffer, Exception>> handlePassByValue({
    required String value,
  }) async {
    final credentialOfferRequestObject = CredentialOfferRequestObject.fromJson(value);
    if (credentialOfferRequestObject == null) {
      return Result.failure(ValidationError.error(reason: "Unable to parse credential offer request"));
    }

    return await resolveMetadataAndCreateOffer(credentialOfferRequestObject);
  }

  Future<Result<CredentialOffer, Exception>> handleFetchByReference({
    required Uri url,
  }) async {
    final result = await fetcher.fetch(url: url);
    final credentialOfferRequestObject = result.success;
    
    if (credentialOfferRequestObject == null) {
      return Result.failure(ValidationError.error(reason: "Unable to fetch credential offer request by reference"));
    }

    return await resolveMetadataAndCreateOffer(credentialOfferRequestObject);
  }

  Future<Result<CredentialOffer, Exception>> resolveMetadataAndCreateOffer(
    CredentialOfferRequestObject credentialOfferRequestObject,
  ) async {
    try {
      final credentialIssuerId = CredentialIssuerId(credentialOfferRequestObject.credentialIssuer);
      final credentialIssuerMetadataResult = await credentialIssuerMetadataResolver.resolve(
        source: CredentialIssuerSource.credentialIssuer(credentialIssuerId),
      );
      
      final credentialIssuerMetadata = credentialIssuerMetadataResult.success;
      if (credentialIssuerMetadata == null) {
        return Result.failure(ValidationError.error(reason: "Invalid credential metadata"));
      }

      final authorizationServer = credentialIssuerMetadata.authorizationServers?.first;
      if (authorizationServer == null) {
        return Result.failure(ValidationError.error(reason: "Invalid authorization metadata"));
      }

      final authorizationServerMetadataResult = await authorizationServerMetadataResolver.resolve(
        url: authorizationServer,
      );
      
      final authorizationServerMetadata = authorizationServerMetadataResult.success;
      if (authorizationServerMetadata == null) {
        return Result.failure(ValidationError.error(reason: "Invalid authorization metadata"));
      }

      return Result.success(await toDomain(
        credentialOfferRequestObject: credentialOfferRequestObject,
        credentialIssuerMetadata: credentialIssuerMetadata,
        authorizationServerMetadata: authorizationServerMetadata,
      ));
    } catch (error) {
      return Result.failure(ValidationError.error(reason: error.toString()));
    }
  }

  Future<CredentialOffer> toDomain({
    required CredentialOfferRequestObject credentialOfferRequestObject,
    required CredentialIssuerMetadata credentialIssuerMetadata,
    required IdentityAndAccessManagementMetadata authorizationServerMetadata,
  }) async {
    final credentialIssuerId = credentialIssuerMetadata.credentialIssuerIdentifier;
    final credentialConfigurationIdentifiers = credentialOfferRequestObject.credentialConfigurationIds
        .map((id) => CredentialConfigurationIdentifier(value: id.toString()))
        .toList();
    final grants = credentialOfferRequestObject.grants?.toDomain();

    return CredentialOffer(
      credentialIssuerIdentifier: credentialIssuerId,
      credentialIssuerMetadata: credentialIssuerMetadata,
      credentialConfigurationIdentifiers: credentialConfigurationIdentifiers,
      grants: grants,
      authorizationServerMetadata: authorizationServerMetadata,
    );
  }
}

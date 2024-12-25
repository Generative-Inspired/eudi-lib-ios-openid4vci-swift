import 'package:json_annotation/json_annotation.dart';

abstract class IssuanceRequesterType {
  CredentialIssuerMetadata get issuerMetadata;

  Future<Result<CredentialIssuanceResponse, Error>> placeIssuanceRequest({
    required IssuanceAccessToken accessToken,
    required SingleCredential request,
  });

  Future<Result<CredentialIssuanceResponse, Error>> placeBatchIssuanceRequest({
    required IssuanceAccessToken accessToken,
    required List<SingleCredential> request,
  });

  Future<Result<DeferredCredentialIssuanceResponse, Error>> placeDeferredCredentialRequest({
    required IssuanceAccessToken accessToken,
    required TransactionId transactionId,
    IssuanceResponseEncryptionSpec? issuanceResponseEncryptionSpec,
  });

  Future<Result<void, Error>> notifyIssuer({
    IssuanceAccessToken? accessToken,
    required NotificationObject notification,
  });
}

class IssuanceRequester implements IssuanceRequesterType {
  @override
  final CredentialIssuerMetadata issuerMetadata;
  final AuthorisationServiceType service;
  final PostingType poster;
  final DPoPConstructorType? dpopConstructor;

  IssuanceRequester({
    required this.issuerMetadata,
    this.service = const AuthorisationService(),
    required this.poster,
    this.dpopConstructor,
  });

  // Implement the remaining methods following the Swift implementation...
  // This includes placeIssuanceRequest, placeBatchIssuanceRequest, 
  // placeDeferredCredentialRequest, and notifyIssuer
}
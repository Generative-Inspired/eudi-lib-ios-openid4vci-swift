import 'package:result_type/result_type.dart';

abstract class NotifyIssuerType {
  Future<Result<void, Exception>> notify({
    required AuthorizedRequest authorizedRequest,
    required NotificationObject notification,
  });
}

class NotifyIssuer implements NotifyIssuerType {
  final IssuanceRequester issuanceRequester;

  NotifyIssuer({
    required CredentialIssuerMetadata issuerMetadata,
    required PostingType poster,
  }) : issuanceRequester = IssuanceRequester(
          issuerMetadata: issuerMetadata,
          poster: poster,
        );

  @override
  Future<Result<void, Exception>> notify({
    required AuthorizedRequest authorizedRequest,
    required NotificationObject notification,
  }) async {
    try {
      return await issuanceRequester.notifyIssuer(
        accessToken: authorizedRequest.accessToken,
        notification: notification,
      );
    } catch (error) {
      return Result.failure(error as Exception);
    }
  }
}
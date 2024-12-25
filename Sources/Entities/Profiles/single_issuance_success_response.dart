
class SingleIssuanceSuccessResponse {
  final String? credential;
  final String? notificationId;
  final String? transactionId;
  final String? format;

  SingleIssuanceSuccessResponse({
    this.credential,
    this.notificationId,
    this.transactionId,
    this.format,
  });

  factory SingleIssuanceSuccessResponse.fromJson(Map<String, dynamic> json) {
    return SingleIssuanceSuccessResponse(
      credential: json['credential'] as String?,
      notificationId: json['notification_id'] as String?,
      transactionId: json['transaction_id'] as String?,
      format: json['format'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (credential != null) 'credential': credential,
      if (notificationId != null) 'notification_id': notificationId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (format != null) 'format': format,
    };
  }
}

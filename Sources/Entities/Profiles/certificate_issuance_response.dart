
class CertificateIssuanceResponse {
  final String? credential;
  final String? transactionId;
  final String? notificationId;

  CertificateIssuanceResponse({
    this.credential,
    this.transactionId,
    this.notificationId,
  });

  Map<String, dynamic> toJson() => {
    'credential': credential,
    'transaction_id': transactionId,
    'notification_id': notificationId,
  };

  factory CertificateIssuanceResponse.fromJson(Map<String, dynamic> json) {
    return CertificateIssuanceResponse(
      credential: json['credential'],
      transactionId: json['transaction_id'],
      notificationId: json['notification_id'],
    );
  }
}

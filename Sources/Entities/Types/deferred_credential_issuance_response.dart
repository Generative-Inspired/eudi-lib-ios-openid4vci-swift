
class DeferredCredentialIssuanceResponse {
  final String transactionId;
  final String? format;

  DeferredCredentialIssuanceResponse({
    required this.transactionId,
    this.format,
  });

  factory DeferredCredentialIssuanceResponse.fromJson(Map<String, dynamic> json) {
    return DeferredCredentialIssuanceResponse(
      transactionId: json['transaction_id'] as String,
      format: json['format'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaction_id': transactionId,
      if (format != null) 'format': format,
    };
  }
}

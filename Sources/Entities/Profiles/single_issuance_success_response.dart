
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
import 'dart:convert';

class SingleIssuanceSuccessResponse {
  final String? credential;
  final String? transactionId;
  final String? notificationId;
  final String? cNonce;
  final int? cNonceExpiresInSeconds;

  SingleIssuanceSuccessResponse({
    this.credential,
    this.transactionId,
    this.notificationId,
    this.cNonce,
    this.cNonceExpiresInSeconds,
  });

  Map<String, dynamic> toJson() => {
    'credential': credential,
    'transaction_id': transactionId,
    'notification_id': notificationId,
    'c_nonce': cNonce,
    'c_nonce_expires_in': cNonceExpiresInSeconds,
  };

  factory SingleIssuanceSuccessResponse.fromJson(Map<String, dynamic> json) {
    return SingleIssuanceSuccessResponse(
      credential: json['credential'],
      transactionId: json['transaction_id'],
      notificationId: json['notification_id'],
      cNonce: json['c_nonce'],
      cNonceExpiresInSeconds: json['c_nonce_expires_in'],
    );
  }

  static SingleIssuanceSuccessResponse? fromJsonString(String jsonString) {
    try {
      final jsonData = json.decode(jsonString);
      return SingleIssuanceSuccessResponse.fromJson(jsonData);
    } catch (e) {
      return null;
    }
  }
}

import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('IssuanceNotification Tests', () {
    test('Notification object creation succeeds', () {
      final notification = NotificationObject(
        event: CredentialIssuanceEvent.credentialIssuanceSuccess,
        transactionId: TransactionId('123'),
        issuedCredentials: ['cred1', 'cred2']
      );

      expect(notification.event, equals(CredentialIssuanceEvent.credentialIssuanceSuccess));
      expect(notification.transactionId.value, equals('123'));
      expect(notification.issuedCredentials?.length, equals(2));
    });

    test('Notification serialization works', () {
      final notification = NotificationObject(
        event: CredentialIssuanceEvent.credentialIssuanceFailure,
        transactionId: TransactionId('456'),
        error: 'Test error'
      );

      final json = notification.toJson();
      expect(json['event'], equals('credential_issuance_failure'));
      expect(json['transaction_id'], equals('456'));
      expect(json['error'], equals('Test error'));
    });
  });
}
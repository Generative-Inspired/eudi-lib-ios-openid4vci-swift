import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('IssuanceEncryption Tests', () {
    test('Encryption parameters are correctly set', () {
      final encryption = CredentialResponseEncryption(
        alg: 'RSA-OAEP-256',
        enc: 'A256GCM',
        recipientKey: 'test-key'
      );

      expect(encryption.alg, equals('RSA-OAEP-256'));
      expect(encryption.enc, equals('A256GCM'));
      expect(encryption.recipientKey, equals('test-key'));
    });

    test('Encryption specification validation succeeds', () {
      final spec = CredentialResponseEncryptionSpec(
        alg: ['RSA-OAEP-256'],
        enc: ['A256GCM']
      );

      expect(spec.alg, contains('RSA-OAEP-256'));
      expect(spec.enc, contains('A256GCM'));
    });
  });
}
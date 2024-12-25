import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('CredentialIssuerId Tests', () {
    test('Valid issuer ID creation succeeds', () {
      final issuerId = CredentialIssuerId.fromString('https://example.com/issuer');
      expect(issuerId, isNotNull);
      expect(issuerId.value, equals('https://example.com/issuer'));
    });

    test('Invalid issuer ID throws error', () {
      expect(
        () => CredentialIssuerId.fromString('invalid-url'),
        throwsException,
      );
    });

    test('Empty issuer ID throws error', () {
      expect(
        () => CredentialIssuerId.fromString(''),
        throwsException,
      );
    });
  });
}
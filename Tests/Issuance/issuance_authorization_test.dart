import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('IssuanceAuthorization Tests', () {
    test('Authorization code creation succeeds', () {
      final auth = IssuanceAuthorization.authorizationCode(authorizationCode: 'test-code');
      expect(auth.authorizationCode, equals('test-code'));
    });

    test('Pre-authorized code creation succeeds', () {
      final auth = IssuanceAuthorization.preAuthorizedCode(preAuthorizedCode: 'pre-auth-code');
      expect(auth.preAuthorizedCode, equals('pre-auth-code'));
    });
  });
}
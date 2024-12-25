import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('IssuanceBatchRequest Tests', () {
    late Issuer issuer;
    late Config config;

    setUp(() {
      config = Config(
        clientId: 'test-client',
        authFlowRedirectionUri: Uri.parse('app://callback'),
      );
    });

    test('Batch request with multiple credentials succeeds', () async {
      final request = IssuanceBatchRequest(
        credentials: [
          CredentialRequest(type: 'VerifiableCredential', format: 'jwt_vc'),
          CredentialRequest(type: 'UniversityDegree', format: 'ldp_vc')
        ],
        accessToken: 'valid-token'
      );

      expect(request.credentials.length, equals(2));
      expect(request.accessToken, equals('valid-token'));
    });
  });
}
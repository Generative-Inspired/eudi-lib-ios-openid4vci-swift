import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('IssuanceFlows Tests', () {
    late Config config;

    setUp(() {
      config = Config(
        clientId: 'test-client',
        authFlowRedirectionUri: Uri.parse('app://callback'),
        authorizeIssuanceConfig: AuthorizeIssuanceConfig.favorScopes,
      );
    });

    test('Authorization code flow initialization succeeds', () {
      final flow = AuthCodeFlowIssuance(config: config);
      expect(flow, isNotNull);
      expect(flow.config.clientId, equals('test-client'));
    });

    test('Credential issuance request creation succeeds', () {
      final request = CredentialIssuanceRequest(
        credentialTypes: ['VerifiableCredential'],
        format: 'jwt_vc',
      );
      expect(request.credentialTypes, contains('VerifiableCredential'));
      expect(request.format, equals('jwt_vc'));
    });
  });
}
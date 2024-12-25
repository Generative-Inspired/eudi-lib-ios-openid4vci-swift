import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('CredentialOfferRequest Tests', () {
    late CredentialOfferRequest offerRequest;

    setUp(() {
      offerRequest = CredentialOfferRequest(
        issuerState: 'test-state',
        credentialIssuer: Uri.parse('https://issuer.example.com'),
        credentialConfigurations: ['config-1', 'config-2'],
        grants: Grants.preAuthorizedCode(PreAuthorizedCode(
          preAuthorizedCode: '12345',
          txCode: TxCode(
            inputMode: 'numeric',
            length: 6,
            description: 'Enter code'
          )
        ))
      );
    });

    test('Valid request creation succeeds', () {
      expect(offerRequest, isNotNull);
      expect(offerRequest.issuerState, equals('test-state'));
      expect(offerRequest.credentialIssuer.toString(), equals('https://issuer.example.com'));
    });

    test('Request serialization works', () {
      final json = offerRequest.toJson();
      expect(json['issuer_state'], equals('test-state'));
      expect(json['credential_issuer'], equals('https://issuer.example.com'));
    });

    test('Request deserialization works', () {
      final json = offerRequest.toJson();
      final deserialized = CredentialOfferRequest.fromJson(json);
      expect(deserialized.issuerState, equals(offerRequest.issuerState));
      expect(deserialized.credentialIssuer, equals(offerRequest.credentialIssuer));
    });
  });
}
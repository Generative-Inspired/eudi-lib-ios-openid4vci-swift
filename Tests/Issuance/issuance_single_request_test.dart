
import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';
import '../Constants/tests_constants.dart';

void main() {
  group('Issuance Single Request Tests', () {
    late OpenId4VCIConfig config;

    setUp(() {
      config = OpenId4VCIConfig(
        clientId: 'wallet-dev',
        authFlowRedirectionUri: Uri.parse('urn:ietf:wg:oauth:2.0:oob'),
        authorizeIssuanceConfig: AuthorizeIssuanceConfig.favorScopes
      );
    });

    test('Format based when issuer responds single credential then credential exists', () async {
      final offer = await TestsConstants.createMockCredentialOfferValidEncryption();
      expect(offer, isNotNull);

      final spec = await IssuanceResponseEncryptionSpec.create(
        algorithm: JWEAlgorithm.rsaOaep256,
        encryptionMethod: JOSEEncryptionMethod.a128CbcHs256
      );

      final issuer = Issuer(
        authorizationServerMetadata: offer!.authorizationServerMetadata,
        issuerMetadata: offer.credentialIssuerMetadata,
        config: config,
        parPoster: Poster(
          session: NetworkingMock(
            path: 'pushed_authorization_request_response',
            extension: 'json'
          )
        ),
        tokenPoster: Poster(
          session: NetworkingMock(
            path: 'access_token_request_response_no_proof',
            extension: 'json'
          )
        ),
        requesterPoster: Poster(
          session: NetworkingMock(
            path: 'single_issuance_success_response_credential',
            extension: 'json'
          )
        )
      );

      final authorizationCode = 'MZqG9bsQ8UALhsGNlY39Yw==';
      final request = TestsConstants.unAuthorizedRequest;
      
      final result = await issuer.handleAuthorizationCode(
        parRequested: request,
        authorizationCode: IssuanceAuthorization.authorizationCode(
          authorizationCode: authorizationCode
        )
      );

      expect(result.isSuccess, isTrue);

      final authorizedRequest = await issuer.requestAccessToken(
        authorizationCode: result.success!
      );

      expect(authorizedRequest.isSuccess, isTrue);
      expect(authorizedRequest.success, isA<AuthorizedRequest>());
      
      final claimSet = MsoMdocFormat.MsoMdocClaimSet(claims: [
        ('org.iso.18013.5.1', 'given_name'),
        ('org.iso.18013.5.1', 'family_name'),
        ('org.iso.18013.5.1', 'birth_date')
      ]);

      final payload = IssuanceRequestPayload.configurationBased(
        credentialConfigurationIdentifier: CredentialConfigurationIdentifier(
          value: 'eu.europa.ec.eudi.pid_mso_mdoc'
        ),
        claimSet: ClaimSet.msoMdoc(claimSet)
      );

      final credentialResult = await issuer.requestSingle(
        noProofRequest: authorizedRequest.success!,
        requestPayload: payload,
        responseEncryptionSpecProvider: (metadata) => spec
      );

      expect(credentialResult.isSuccess, isTrue);
      expect(credentialResult.success!.credentials.isNotEmpty, isTrue);
    });
  });
}

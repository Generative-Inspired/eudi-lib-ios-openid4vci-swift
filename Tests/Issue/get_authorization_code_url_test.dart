import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('GetAuthorizationCodeURL Tests', () {
    late GetAuthorizationCodeURL getAuthCodeURL;

    setUp(() {
      getAuthCodeURL = GetAuthorizationCodeURL(
        url: Uri.parse('https://auth.example.com/authorize'),
        clientId: 'test-client',
        scope: 'openid',
        state: 'test-state',
        redirectUri: Uri.parse('app://callback'),
        codeChallenge: 'test-challenge',
        codeChallengeMethod: 'S256',
      );
    });

    test('URL construction is correct', () {
      final url = getAuthCodeURL.url;
      expect(url.toString(), contains('client_id=test-client'));
      expect(url.toString(), contains('scope=openid'));
      expect(url.toString(), contains('state=test-state'));
      expect(url.toString(), contains('code_challenge=test-challenge'));
      expect(url.toString(), contains('code_challenge_method=S256'));
    });
  });
}
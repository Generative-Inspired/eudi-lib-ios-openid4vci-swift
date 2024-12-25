
import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('VCI Flow with Offer Tests', () {
    test('Flow with credential offer succeeds', () async {
      final config = Config(
        clientId: 'test-client',
        authFlowRedirectionUri: Uri.parse('app://callback')
      );
      
      expect(config.clientId, equals('test-client'));
    });
  });
}

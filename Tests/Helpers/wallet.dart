
import 'package:openid4vci/openid4vci.dart';

class WalletHelper {
  static Config createTestConfig() {
    return Config(
      clientId: 'test-client',
      authFlowRedirectionUri: Uri.parse('app://callback'),
    );
  }
}

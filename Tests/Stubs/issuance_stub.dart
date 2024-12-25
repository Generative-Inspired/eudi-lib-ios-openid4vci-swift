
import 'package:openid4vci/openid4vci.dart';

extension IssuanceStub on Issuance {
  static Issuance stub() {
    return Issuance(
      accessToken: 'test-token',
      format: 'jwt_vc',
      types: ['VerifiableCredential']
    );
  }
}

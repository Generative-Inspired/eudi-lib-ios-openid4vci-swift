
import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('URLModifier Tests', () {
    late AuthorizationServerMetadataResolver resolver;

    setUp(() {
      resolver = AuthorizationServerMetadataResolver();
    });

    test('Append path components', () async {
      final url = Uri.parse('https://keycloak.netcompany.com/realms/pid-issuer-realm');
      final modifiedURL = await resolver.modifyURL(
        url: url,
        modificationType: URLModificationType.appendPathComponents,
        components: ['.well-known', 'openid-configuration']
      );
      expect(
        modifiedURL?.toString(),
        'https://keycloak.netcompany.com/realms/pid-issuer-realm/.well-known/openid-configuration'
      );
    });

    test('Insert path components', () async {
      final url = Uri.parse('https://keycloak.netcompany.com/realms/pid-issuer-realm');
      final modifiedURL = await resolver.modifyURL(
        url: url,
        modificationType: URLModificationType.insertPathComponents,
        components: ['.well-known', 'openid-configuration']
      );
      expect(
        modifiedURL?.toString(),
        'https://keycloak.netcompany.com/.well-known/openid-configuration/realms/pid-issuer-realm'
      );
    });
  });
}

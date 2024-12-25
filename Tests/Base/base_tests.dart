
import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('Base Tests', () {
    setUp(() async {});

    tearDown(() {});

    test('SDK initialization', () {
      final sdk = OpenID4VCI();
      expect(sdk, isNotNull);
    });
  });
}


import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('Entities Tests', () {
    setUp(() async {});

    tearDown(() {});

    test('SDK initialization', () {
      final sdk = OpenID4VCI();
      expect(sdk, isNotNull);
    });
  });
}

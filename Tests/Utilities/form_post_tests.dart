import 'package:test/test.dart';
import 'package:openid4vci/openid4vci.dart';

void main() {
  group('FormPost Tests', () {
    test('Form post data encoding is correct', () {
      final formData = {
        'key1': 'value1',
        'key2': 'value2 with spaces',
      };
      
      final encoded = FormPost.encode(formData);
      expect(encoded, contains('key1=value1'));
      expect(encoded, contains('key2=value2+with+spaces'));
    });

    test('Special characters are properly encoded', () {
      final formData = {
        'special': '!@#\$%^&*()',
      };
      
      final encoded = FormPost.encode(formData);
      expect(encoded.contains('!@#\$%^&*()'), isFalse);
      expect(encoded.contains(RegExp(r'[^A-Za-z0-9+-]')), isTrue);
    });
  });
}
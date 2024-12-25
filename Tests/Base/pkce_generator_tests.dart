
import 'package:test/test.dart';
import 'package:openid4vci/pkce/pkce_generator.dart';
import 'dart:typed_data';

void main() {
  group('PKCE Generator Tests', () {
    test('Generate random data', () {
      final length = 48;
      final randomData = PKCEGenerator.generateRandomData(length);
      expect(randomData, isNotNull);
      expect(randomData?.length, equals(length));
    });

    test('Generate random base64 string', () {
      final length = 48;
      final randomString = PKCEGenerator.generateRandomBase64String(length);
      expect(randomString, isNotNull);
    });

    test('Generate random base64 string of length 43', () {
      final length = 32;
      final randomString = PKCEGenerator.generateRandomBase64String(length);
      expect(randomString, isNotNull);
    });

    test('Generate code challenge', () {
      final codeChallenge = PKCEGenerator.generateCodeChallenge();
      expect(codeChallenge, isNotNull);
      expect(codeChallenge?.length, equals(44)); // Base64-encoded SHA256 hash length
    });
  });
}

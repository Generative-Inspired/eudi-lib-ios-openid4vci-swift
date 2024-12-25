import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class PKCEGenerator {
  static String? codeVerifier() {
    return generateRandomString(length: 43);
  }

  static List<int>? generateRandomData({int length = 48}) {
    final random = Random.secure();
    try {
      return List<int>.generate(length, (i) => random.nextInt(256));
    } catch (e) {
      return null;
    }
  }

  static String? generateRandomString({int length = 48}) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~';
    final data = generateRandomData(length: length);
    if (data == null) return null;

    return data
        .map((byte) => chars[byte % chars.length])
        .join();
  }

  static String? generateRandomBase64String({int length = 48}) {
    final randomString = generateRandomString(length: length);
    if (randomString == null) return null;

    final bytes = utf8.encode(randomString);
    return base64Url.encode(bytes);
  }

  static String? generateCodeChallenge() {
    final verifier = generateRandomBase64String();
    if (verifier == null) return null;
    return generateCodeChallenge(codeVerifier: verifier);
  }

  static String generateCodeChallenge({required String codeVerifier}) {
    final bytes = utf8.encode(codeVerifier);
    final hash = sha256.convert(bytes);
    return base64Url.encode(hash.bytes).replaceAll('=', '');
  }
}

import 'dart:convert';
import 'package:crypto/crypto.dart';

class CodeChallenge {
  final String value;
  
  CodeChallenge(this.value) {
    if (value.isEmpty) {
      throw Exception('Empty code challenge');
    }
  }

  static CodeChallenge createS256(String verifier) {
    final bytes = utf8.encode(verifier);
    final digest = sha256.convert(bytes);
    final base64 = base64Url.encode(digest.bytes).replaceAll('=', '');
    return CodeChallenge(base64);
  }
}

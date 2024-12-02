// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

extension StringUtils on String {
  static String randomBase64URLString(int length) {
    final random = Random.secure();
    final bytes = List<int>.generate(32, (i) => random.nextInt(256));
    final data = Uint8List.fromList(bytes);
    
    final base64String = base64Url.encode(data)
        .replaceAll('+', '-')
        .replaceAll('/', '_')
        .replaceAll('=', '');
    
    return base64String.substring(0, length);
  }

  String removeWhitespaceAndNewlines() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  String utf8UrlEncode() {
    try {
      return Uri.encodeFull(this);
    } catch (e) {
      throw FormatException('Failed to URL encode string');
    }
  }

  String get base64urlEncode {
    final data = utf8.encode(this);
    return base64Url.encode(data);
  }

  static Future<String?> loadStringFileFromBundle(
    String fileName,
    String fileExtension,
  ) async {
    try {
      return await rootBundle.loadString('assets/$fileName.$fileExtension');
    } catch (_) {
      return null;
    }
  }
}
// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

import 'dart:typed_data';
import 'dart:math';
import 'dart:convert';

extension DataExtensions on Uint8List {
  // Generates random data of the specified length
  static Uint8List randomData(int length) {
    final random = Random.secure();
    final bytes = List<int>.generate(length, (i) => random.nextInt(256));
    return Uint8List.fromList(bytes);
  }

  // Encodes the data as a base64 URL-safe string
  String base64URLEncodedString() {
    String base64String = base64Encode(this);
    base64String = base64String.replaceAll('/', '_');
    base64String = base64String.replaceAll('+', '-');
    base64String = base64String.replaceAll('=', '');
    return base64String;
  }
}
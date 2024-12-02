// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

import 'dart:convert';

extension EncodableExtensions on Object {
  Future<Map<String, dynamic>> toDictionary() async {
    try {
      final String jsonString = jsonEncode(this);
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      throw ConversionError('Failed to convert object to dictionary');
    }
  }
}

class ConversionError implements Exception {
  final String message;
  ConversionError(this.message);
}
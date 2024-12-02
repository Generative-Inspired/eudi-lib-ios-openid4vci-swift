// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

import 'dart:convert';
import 'package:flutter/services.dart';

extension DictionaryExtensions on Map<String, dynamic> {
  Future<String> toJsonData() async {
    return jsonEncode(this);
  }

  static Future<Map<String, dynamic>> fromBundle(String name) async {
    try {
      final jsonString = await rootBundle.loadString('assets/$name.json');
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      throw AssetError('File not found: $name');
    }
  }

  T getValue<T>(String key, Exception error) {
    final value = this[key];
    if (value is! T) {
      throw error;
    }
    return value;
  }

  String? toJsonString() {
    try {
      return jsonEncode(this);
    } catch (_) {
      return null;
    }
  }

  Map<String, String> convertToDictionaryOfStrings() {
    final stringMap = <String, String>{};
    forEach((key, value) {
      stringMap[key] = value.toString();
    });
    return stringMap;
  }

  Map<String, String> convertToDictionaryOfStringsExcluding(List<String> excludingKeys) {
    final stringMap = <String, String>{};
    forEach((key, value) {
      if (!excludingKeys.contains(key)) {
        stringMap[key] = value.toString();
      }
    });
    return stringMap;
  }

  bool containsAllKeys(List<String> keys) {
    return keys.every((key) => containsKey(key));
  }
}

class AssetError implements Exception {
  final String message;
  AssetError(this.message);
}
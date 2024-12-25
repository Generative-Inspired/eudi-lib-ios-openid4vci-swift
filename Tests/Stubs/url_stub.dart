
import 'dart:core';
import 'stubbable.dart';

extension URLStub on Uri {
  static Uri stub() {
    return Uri.parse('https://www.example.com/');
  }
}

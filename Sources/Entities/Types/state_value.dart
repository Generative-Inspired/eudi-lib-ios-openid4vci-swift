
import 'dart:convert';
import 'dart:math';

class StateValue {
  final String value;

  StateValue() : value = _generateRandomString(32);

  static String _generateRandomString(int length) {
    var random = Random.secure();
    var values = List<int>.generate(length, (i) => random.nextInt(256));
    return base64Url.encode(values).replaceAll('=', '');
  }
}


import 'dart:convert';

String? convertToJsonString(Map<String, dynamic> dictionary) {
  try {
    return jsonEncode(dictionary);
  } catch (error) {
    print('Error converting dictionary to JSON string: $error');
    return null;
  }
}

T unwrapOrThrow<T>(T? optional, Exception error) {
  if (optional == null) {
    throw error;
  }
  return optional;
}

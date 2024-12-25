import 'dart:convert';

enum ContentType {
  form('application/x-www-form-urlencoded'),
  json('application/json');

  final String value;
  const ContentType(this.value);
  static const key = 'Content-Type';
}

class FormPost implements Request {
  final Uri url;
  final Map<String, String> additionalHeaders;
  final List<int>? body;
  final String method = 'POST';

  FormPost({
    required this.url,
    required ContentType contentType,
    Map<String, String> additionalHeaders = const {},
    required Map<String, dynamic> formData,
  })  : additionalHeaders = {
          ContentType.key: contentType.value,
          ...additionalHeaders,
        },
        body = _encodeBody(contentType, formData);

  static List<int>? _encodeBody(ContentType contentType, Map<String, dynamic> formData) {
    switch (contentType) {
      case ContentType.form:
        return FormURLEncoder.encode(formData).codeUnits;
      case ContentType.json:
        return utf8.encode(json.encode(formData));
    }
  }
}

class FormURLEncoder {
  static String encode(Map<String, dynamic> data) {
    final parts = <String>[];
    data.forEach((key, value) {
      if (value is List) {
        for (final item in value) {
          parts.add('${_encode(key)}=${_encode(item.toString())}');
        }
      } else {
        parts.add('${_encode(key)}=${_encode(value.toString())}');
      }
    });
    return parts.join('&');
  }

  static String _encode(String value) {
    return Uri.encodeComponent(value).replaceAll('%20', '+');
  }
}
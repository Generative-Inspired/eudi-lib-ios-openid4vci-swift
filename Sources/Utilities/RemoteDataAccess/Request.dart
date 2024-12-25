
import 'dart:convert';
import 'dart:io';

class Request {
  final Uri url;
  final String method;
  final Map<String, String> headers;
  final dynamic body;

  Request({
    required this.url,
    required this.method,
    this.headers = const {},
    this.body,
  });

  HttpClient createClient() {
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;
    return client;
  }

  Future<HttpClientResponse> execute() async {
    final client = createClient();
    try {
      final request = await client.openUrl(method, url);
      
      headers.forEach((key, value) {
        request.headers.set(key, value);
      });

      if (body != null) {
        final jsonBody = jsonEncode(body);
        request.headers.contentType = ContentType.json;
        request.write(jsonBody);
      }

      return await request.close();
    } finally {
      client.close();
    }
  }
}

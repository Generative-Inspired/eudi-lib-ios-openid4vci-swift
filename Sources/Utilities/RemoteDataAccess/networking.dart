
import 'dart:typed_data';
import 'package:http/http.dart' as http;

abstract class Networking {
  Future<(Uint8List, http.Response)> getData(Uri url);
  Future<(Uint8List, http.Response)> sendRequest(http.Request request);
}

extension NetworkingExtension on http.Client {
  Future<(Uint8List, http.Response)> getData(Uri url) async {
    final response = await get(url);
    return (response.bodyBytes, response);
  }

  Future<(Uint8List, http.Response)> sendRequest(http.Request request) async {
    final streamedResponse = await send(request);
    final response = await http.Response.fromStream(streamedResponse);
    return (response.bodyBytes, response);
  }
}

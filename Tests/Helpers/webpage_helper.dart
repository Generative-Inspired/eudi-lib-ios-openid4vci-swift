
import 'dart:async';

class WebpageHelper {
  static Future<String?> extractQueryParameter(Uri uri, String parameter) async {
    return uri.queryParameters[parameter];
  }
}

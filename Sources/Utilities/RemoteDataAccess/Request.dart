
enum HTTPMethod {
  GET,
  POST,
  PUT,
  DELETE,
  PATCH
}

abstract class Request<T> {
  HTTPMethod get method;
  Uri get url;
  Map<String, String> get additionalHeaders;
  List<int>? get body;
  
  Request() {
    method = HTTPMethod.GET;
    body = null;
  }
}

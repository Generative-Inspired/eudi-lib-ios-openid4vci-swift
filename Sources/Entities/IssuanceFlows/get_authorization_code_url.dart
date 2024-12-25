
class AuthorizationCodeURLError implements Exception {
  final String message;
  AuthorizationCodeURLError(this.message);
}

class GetAuthorizationCodeURL {
  final Uri url;
  
  static const String PARAM_CLIENT_ID = "client_id";
  static const String PARAM_REQUEST_URI = "request_uri";
  static const String PARAM_REQUEST_STATE = "state";
  
  GetAuthorizationCodeURL._internal(this.url);
  
  factory GetAuthorizationCodeURL(String urlString) {
    final uri = Uri.parse(urlString);
    
    if (uri.scheme != 'https') {
      throw ValidationError('Non HTTPS URL: $urlString');
    }
    
    final parameters = uri.queryParameters;
    if (!parameters.containsKey(PARAM_CLIENT_ID)) {
      throw AuthorizationCodeURLError('Missing query parameters');
    }
    
    return GetAuthorizationCodeURL._internal(uri);
  }
}

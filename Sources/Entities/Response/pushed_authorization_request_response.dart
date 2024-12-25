enum PushedAuthorizationRequestResponse {
  success(String requestURI, int expiresIn),
  failure(String error, String? errorDescription);

  const PushedAuthorizationRequestResponse.success(this.requestURI, this.expiresIn)
      : error = null,
        errorDescription = null;

  const PushedAuthorizationRequestResponse.failure(this.error, this.errorDescription)
      : requestURI = null,
        expiresIn = null;

  final String? requestURI;
  final int? expiresIn;
  final String? error;
  final String? errorDescription;

  Map<String, dynamic> toJson() {
    if (requestURI != null && expiresIn != null) {
      return {
        'request_uri': requestURI,
        'expires_in': expiresIn,
      };
    } else {
      return {
        'error': error,
        'error_description': errorDescription,
      };
    }
  }

  factory PushedAuthorizationRequestResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('request_uri') && json.containsKey('expires_in')) {
      return PushedAuthorizationRequestResponse.success(
        json['request_uri'] as String,
        json['expires_in'] as int,
      );
    } else if (json.containsKey('error')) {
      return PushedAuthorizationRequestResponse.failure(
        json['error'] as String,
        json['error_description'] as String?,
      );
    }
    throw FormatException('Invalid JSON format for PushedAuthorizationRequestResponse');
  }
}
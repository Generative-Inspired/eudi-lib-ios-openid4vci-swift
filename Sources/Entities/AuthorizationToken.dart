// Converted to Dart from Swift using AI by Geninspired Inc. 

class ValidationError implements Exception {
  final String message;
  ValidationError(this.message);
}

enum AuthorizationTokenType {
  bearer,
  dpop,
}

class AuthorizationToken {
  final String accessToken;
  final AuthorizationTokenType type;

  AuthorizationToken._internal(this.accessToken, this.type);

  factory AuthorizationToken({
    required String accessToken,
    required bool useDPoP,
  }) {
    if (accessToken.isEmpty) {
      throw ValidationError('AuthorizationToken access token cannot be empty');
    }

    return AuthorizationToken._internal(
      accessToken,
      useDPoP ? AuthorizationTokenType.dpop : AuthorizationTokenType.bearer,
    );
  }
}
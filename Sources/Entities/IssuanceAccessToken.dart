// Converted to Dart from Swift using AI by Geninspired Inc. 

enum TokenType {
  bearer,
  dpop;

  String get value {
    switch (this) {
      case TokenType.bearer:
        return 'Bearer';
      case TokenType.dpop:
        return 'DPoP';
    }
  }

  factory TokenType.fromString(String? value) {
    if (value == null) return TokenType.bearer;
    return TokenType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => TokenType.bearer,
    );
  }
}

abstract class CanExpire {
  double? get expiresIn;
}

class IssuanceAccessToken implements CanExpire {
  @override
  final double? expiresIn;
  final String accessToken;
  final TokenType? tokenType;

  IssuanceAccessToken({
    required this.accessToken,
    this.tokenType,
    this.expiresIn = 0,
  }) {
    if (accessToken.isEmpty) {
      throw ValidationError('Access token cannot be empty');
    }
  }

  Map<String, String> get authorizationHeader => {
    'Authorization': '${TokenType.bearer.value} $accessToken'
  };

  Map<String, String> getDPoPOrBearerAuthorizationHeader({
    required DPoPConstructor? dpopConstructor,
    required Uri? endpoint,
  }) {
    if (tokenType == TokenType.bearer) {
      return {'Authorization': '${TokenType.bearer.value} $accessToken'};
    } else if (dpopConstructor != null && 
               tokenType == TokenType.dpop && 
               endpoint != null) {
      return {
        'Authorization': '${TokenType.dpop.value} $accessToken',
        TokenType.dpop.value: dpopConstructor.jwt(
          endpoint: endpoint,
          accessToken: accessToken,
        ),
      };
    }
    return {'Authorization': '${TokenType.bearer.value} $accessToken'};
  }
}

// Abstract class for DPoP constructor (implementation would be needed)
abstract class DPoPConstructor {
  String jwt({required Uri endpoint, required String accessToken});
}
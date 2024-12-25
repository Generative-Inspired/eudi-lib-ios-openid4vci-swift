
class AuthorizationRequest {
  final String clientId;
  final String? authorizationDetails;
  final String? scope;
  final String redirectUri;
  final String? state;
  final String responseType;
  final String? nonce;
  final String? codeChallenge;
  final String? codeChallengeMethod;
  final String? request;
  final String? requestUri;

  AuthorizationRequest({
    required this.clientId,
    this.authorizationDetails,
    this.scope,
    required this.redirectUri,
    this.state,
    required this.responseType,
    this.nonce,
    this.codeChallenge,
    this.codeChallengeMethod,
    this.request,
    this.requestUri,
  });

  Map<String, String> toMap() {
    final map = <String, String>{
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'response_type': responseType,
    };

    if (authorizationDetails != null) {
      map['authorization_details'] = authorizationDetails!;
    }
    if (scope != null) map['scope'] = scope!;
    if (state != null) map['state'] = state!;
    if (nonce != null) map['nonce'] = nonce!;
    if (codeChallenge != null) map['code_challenge'] = codeChallenge!;
    if (codeChallengeMethod != null) {
      map['code_challenge_method'] = codeChallengeMethod!;
    }
    if (request != null) map['request'] = request!;
    if (requestUri != null) map['request_uri'] = requestUri!;

    return map;
  }
}

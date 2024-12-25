
class PKCEVerifier {
  final String codeVerifier;
  final String codeVerifierMethod;
  
  PKCEVerifier({
    required this.codeVerifier,
    required this.codeVerifierMethod,
  }) {
    if (codeVerifier.isEmpty || codeVerifierMethod.isEmpty) {
      throw Exception('Invalid code verifier or method');
    }
  }

  Map<String, dynamic> toJson() => {
    'code_verifier': codeVerifier,
    'code_verifier_method': codeVerifierMethod,
  };

  factory PKCEVerifier.fromJson(Map<String, dynamic> json) {
    return PKCEVerifier(
      codeVerifier: json['code_verifier'] as String,
      codeVerifierMethod: json['code_verifier_method'] as String,
    );
  }
}

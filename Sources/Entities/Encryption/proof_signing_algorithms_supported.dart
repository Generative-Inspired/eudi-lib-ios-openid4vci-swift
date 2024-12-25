
class ProofSigningAlgorithmsSupported {
  final List<String> algorithms;

  ProofSigningAlgorithmsSupported({required this.algorithms});

  Map<String, dynamic> toJson() => {
    'proof_signing_alg_values_supported': algorithms,
  };

  factory ProofSigningAlgorithmsSupported.fromJson(Map<String, dynamic> json) {
    return ProofSigningAlgorithmsSupported(
      algorithms: List<String>.from(json['proof_signing_alg_values_supported']),
    );
  }
}

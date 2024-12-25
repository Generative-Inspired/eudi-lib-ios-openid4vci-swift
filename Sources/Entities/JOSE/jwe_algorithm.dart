
import 'jose_algorithm.dart';

class JWEAlgorithm extends JOSEAlgorithm {
  JWEAlgorithm(AlgorithmType type) : super(name: type.name, requirement: type.requirement);
  
  JWEAlgorithm.fromName(String name) : super(name: name);

  factory JWEAlgorithm.parse(String s) {
    final type = AlgorithmType.values.firstWhere(
      (e) => e.name == s,
      orElse: () => throw FormatException('Invalid JWE algorithm type: $s'),
    );
    return JWEAlgorithm(type);
  }
}

enum AlgorithmType {
  RSA1_5('RSA1_5', Requirement.REQUIRED),
  RSA_OAEP('RSA-OAEP', Requirement.OPTIONAL),
  RSA_OAEP_256('RSA-OAEP-256', Requirement.OPTIONAL),
  // Add other algorithm types as needed...

  final String name;
  final Requirement requirement;
  const AlgorithmType(this.name, this.requirement);
}


import 'jose_algorithm.dart';

class JWSAlgorithm extends JOSEAlgorithm {
  JWSAlgorithm(AlgorithmType type) : super(name: type.name, requirement: type.requirement);
  
  JWSAlgorithm.fromName(String name) : super(name: name);

  factory JWSAlgorithm.parse(String s) {
    final type = AlgorithmType.values.firstWhere(
      (e) => e.name == s,
      orElse: () => throw FormatException('Invalid JWS algorithm type: $s'),
    );
    return JWSAlgorithm(type);
  }
}

enum AlgorithmType {
  HS256('HS256', Requirement.REQUIRED),
  HS384('HS384', Requirement.OPTIONAL),
  HS512('HS512', Requirement.OPTIONAL),
  // Add other algorithm types as needed...

  final String name;
  final Requirement requirement;
  const AlgorithmType(this.name, this.requirement);
}

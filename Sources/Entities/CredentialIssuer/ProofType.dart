
enum ProofType {
  jwt,
  cwt,
  ldpVp;

  String toJson() {
    switch (this) {
      case ProofType.jwt:
        return 'JWT';
      case ProofType.cwt:
        return 'CWT';
      case ProofType.ldpVp:
        return 'LDP_VP';
    }
  }

  factory ProofType.fromJson(String json) {
    switch (json.toUpperCase()) {
      case 'JWT':
        return ProofType.jwt;
      case 'CWT':
        return ProofType.cwt;
      case 'LDP_VP':
        return ProofType.ldpVp;
      default:
        throw FormatException('Invalid proof type: $json');
    }
  }

  factory ProofType.fromType(String type) {
    switch (type.toUpperCase()) {
      case 'JWT':
        return ProofType.jwt;
      case 'CWT':
        return ProofType.cwt;
      case 'LDP_VP':
        return ProofType.ldpVp;
      default:
        throw FormatException('Invalid proof type: $type');
    }
  }
}

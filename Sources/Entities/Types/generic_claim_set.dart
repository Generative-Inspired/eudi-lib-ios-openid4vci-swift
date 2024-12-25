
class GenericClaimSet {
  final List<String> claims;

  GenericClaimSet({required this.claims});

  Map<String, dynamic> toJson() => {
    'claims': claims,
  };

  factory GenericClaimSet.fromJson(Map<String, dynamic> json) {
    return GenericClaimSet(
      claims: List<String>.from(json['claims']),
    );
  }
}

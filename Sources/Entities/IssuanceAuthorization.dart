
class IssuanceAuthorization {
  final String code;
  final String? scope;

  IssuanceAuthorization({
    required this.code,
    this.scope,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'code': code,
    };
    if (scope != null) map['scope'] = scope;
    return map;
  }

  factory IssuanceAuthorization.fromJson(Map<String, dynamic> json) {
    return IssuanceAuthorization(
      code: json['code'] as String,
      scope: json['scope'] as String?,
    );
  }
}

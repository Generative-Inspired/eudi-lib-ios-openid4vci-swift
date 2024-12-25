
class AuthorizationType {
  final String type;
  
  AuthorizationType({required this.type});
  
  Map<String, dynamic> toJson() => {
    'type': type,
  };
  
  factory AuthorizationType.fromJson(Map<String, dynamic> json) {
    return AuthorizationType(type: json['type']);
  }
}

class AuthorizationDetail {
  final AuthorizationType type;
  final List<String> locations;
  final String credentialConfigurationId;
  
  AuthorizationDetail({
    required this.type,
    required this.locations,
    required this.credentialConfigurationId,
  });
  
  Map<String, dynamic> toJson() => {
    'type': type.toJson(),
    'locations': locations,
    'credentialConfigurationId': credentialConfigurationId,
  };
  
  factory AuthorizationDetail.fromJson(Map<String, dynamic> json) {
    return AuthorizationDetail(
      type: AuthorizationType.fromJson(json['type']),
      locations: List<String>.from(json['locations']),
      credentialConfigurationId: json['credentialConfigurationId'],
    );
  }
}

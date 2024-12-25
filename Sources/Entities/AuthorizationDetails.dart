
import 'dart:convert';

class AuthorizationDetails {
  final List<Map<String, dynamic>> details;

  AuthorizationDetails({required this.details});

  Map<String, dynamic> toJson() => {
    'authorization_details': details,
  };

  factory AuthorizationDetails.fromJson(Map<String, dynamic> json) {
    final detailsList = json['authorization_details'] as List;
    return AuthorizationDetails(
      details: detailsList.map((e) => e as Map<String, dynamic>).toList(),
    );
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  static AuthorizationDetails? fromJsonString(String jsonString) {
    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return AuthorizationDetails.fromJson(json);
    } catch (_) {
      return null;
    }
  }
}

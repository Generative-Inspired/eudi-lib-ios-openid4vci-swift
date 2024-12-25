
import 'package:json_annotation/json_annotation.dart';
import 'format_profile.dart';

class W3CSignedJwtFormat implements FormatProfile {
  static const String FORMAT = "jwt_vc_json";
  
  final CredentialDefinition credentialDefinition;
  final String? scope;

  W3CSignedJwtFormat({
    required this.credentialDefinition,
    this.scope,
  });

  Map<String, dynamic> toJson() => {
    'credential_definition': credentialDefinition.toJson(),
    'scope': scope,
  };

  factory W3CSignedJwtFormat.fromJson(Map<String, dynamic> json) {
    return W3CSignedJwtFormat(
      credentialDefinition: CredentialDefinition.fromJson(json['credential_definition']),
      scope: json['scope'] as String?,
    );
  }
}


import 'package:json_annotation/json_annotation.dart';
import 'format_profile.dart';

class W3CJsonLdSignedJwtFormat implements FormatProfile {
  static const String FORMAT = "jwt_vc_json-ld";
  
  final CredentialDefinition credentialDefinition;
  final String? scope;
  final List<Uri> content;
  final List<String> type;

  W3CJsonLdSignedJwtFormat({
    required this.credentialDefinition,
    this.scope,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
    'credential_definition': credentialDefinition.toJson(),
    'scope': scope,
    'content': content.map((e) => e.toString()).toList(),
    'type': type,
  };

  factory W3CJsonLdSignedJwtFormat.fromJson(Map<String, dynamic> json) {
    return W3CJsonLdSignedJwtFormat(
      credentialDefinition: CredentialDefinition.fromJson(json['credential_definition']),
      scope: json['scope'] as String?,
      content: (json['content'] as List).map((e) => Uri.parse(e)).toList(),
      type: (json['type'] as List).cast<String>(),
    );
  }
}

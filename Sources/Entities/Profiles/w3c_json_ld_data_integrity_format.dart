
import 'package:json_annotation/json_annotation.dart';
import 'format_profile.dart';

class W3CJsonLdDataIntegrityFormat implements FormatProfile {
  static const String FORMAT = "ldp_vc";
  
  final CredentialDefinition credentialDefinition;
  final String? scope;
  final List<Uri> content;
  final List<String> type;

  W3CJsonLdDataIntegrityFormat({
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

  factory W3CJsonLdDataIntegrityFormat.fromJson(Map<String, dynamic> json) {
    return W3CJsonLdDataIntegrityFormat(
      credentialDefinition: CredentialDefinition.fromJson(json['credential_definition']),
      scope: json['scope'] as String?,
      content: (json['content'] as List).map((e) => Uri.parse(e)).toList(),
      type: (json['type'] as List).cast<String>(),
    );
  }
}

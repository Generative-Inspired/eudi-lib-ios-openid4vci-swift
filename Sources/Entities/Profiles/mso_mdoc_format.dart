
import 'package:json_annotation/json_annotation.dart';
import 'format_profile.dart';

class MsoMdocFormat implements FormatProfile {
  static const String FORMAT = "mso_mdoc";
  
  final String docType;
  final String? scope;
  
  MsoMdocFormat({required this.docType, this.scope});

  Map<String, dynamic> toJson() => {
    'doctype': docType,
    'scope': scope,
  };

  factory MsoMdocFormat.fromJson(Map<String, dynamic> json) {
    return MsoMdocFormat(
      docType: json['doctype'] as String,
      scope: json['scope'] as String?,
    );
  }
}

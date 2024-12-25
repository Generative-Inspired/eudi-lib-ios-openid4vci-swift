
import 'FormatProfile.dart';

class SdJwtVcFormat implements FormatProfile {
  static const String FORMAT = "vc+sd-jwt";
  
  @override
  final String type;
  final String? scope;
  
  SdJwtVcFormat({
    required this.type,
    this.scope,
  });
  
  factory SdJwtVcFormat.fromJson(Map<String, dynamic> json) {
    return SdJwtVcFormat(
      type: json['type'],
      scope: json['scope'],
    );
  }
  
  Map<String, dynamic> toJson() => {
    'type': type,
    'scope': scope,
  };
}

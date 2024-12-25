
import 'dart:convert';
import 'package:openid4vci/src/entities/types/grants_dto.dart';

class CredentialOfferRequestObject {
  final String credentialIssuer;
  final List<Map<String, dynamic>> credentialConfigurationIds;
  final GrantsDTO? grants;

  CredentialOfferRequestObject({
    required this.credentialIssuer,
    required this.credentialConfigurationIds,
    this.grants,
  });

  factory CredentialOfferRequestObject.fromJson(Map<String, dynamic> json) {
    return CredentialOfferRequestObject(
      credentialIssuer: json['credential_issuer'],
      credentialConfigurationIds: 
        List<Map<String, dynamic>>.from(json['credential_configuration_ids']),
      grants: json['grants'] != null ? GrantsDTO.fromJson(json['grants']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'credential_issuer': credentialIssuer,
    'credential_configuration_ids': credentialConfigurationIds,
    'grants': grants?.toJson(),
  };

  static CredentialOfferRequestObject? fromJsonString(String jsonString) {
    try {
      final Map<String, dynamic> json = jsonDecode(jsonString);
      return CredentialOfferRequestObject.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}

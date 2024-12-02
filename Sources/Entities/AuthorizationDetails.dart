// Copyright (c) 2023 European Commission
// Converted to Dart from Swift using AI by Geninspired Inc. 
// Licensed under the Apache License, Version 2.0

// Base protocol converted to abstract class
abstract class OidCredentialAuthorizationDetail {}

// ByCredentialConfiguration class
class ByCredentialConfiguration implements OidCredentialAuthorizationDetail {
  final String credentialConfigurationId;
  final List<String>? credentialIdentifiers;

  ByCredentialConfiguration({
    required this.credentialConfigurationId,
    this.credentialIdentifiers,
  });

  // JSON serialization
  Map<String, dynamic> toJson() => {
    'credentialConfigurationId': credentialConfigurationId,
    'credentialIdentifiers': credentialIdentifiers,
  };

  factory ByCredentialConfiguration.fromJson(Map<String, dynamic> json) {
    return ByCredentialConfiguration(
      credentialConfigurationId: json['credentialConfigurationId'],
      credentialIdentifiers: json['credentialIdentifiers']?.cast<String>(),
    );
  }
}

// ByFormat enum and associated classes
enum ByFormatType {
  msoMdocAuthorizationDetails,
  sdJwtVcAuthorizationDetails,
}

class ByFormat implements OidCredentialAuthorizationDetail {
  final dynamic details;
  final ByFormatType type;

  ByFormat.msoMdocAuthorizationDetails(MsoMdocAuthorizationDetails details)
      : this.details = details,
        this.type = ByFormatType.msoMdocAuthorizationDetails;

  ByFormat.sdJwtVcAuthorizationDetails(SdJwtVcAuthorizationDetails details)
      : this.details = details,
        this.type = ByFormatType.sdJwtVcAuthorizationDetails;

  Map<String, dynamic> toJson() => {
    'type': type.toString(),
    'details': details.toJson(),
  };

  factory ByFormat.fromJson(Map<String, dynamic> json) {
    final type = ByFormatType.values.firstWhere(
      (e) => e.toString() == json['type'],
    );
    
    switch (type) {
      case ByFormatType.msoMdocAuthorizationDetails:
        return ByFormat.msoMdocAuthorizationDetails(
          MsoMdocAuthorizationDetails.fromJson(json['details']),
        );
      case ByFormatType.sdJwtVcAuthorizationDetails:
        return ByFormat.sdJwtVcAuthorizationDetails(
          SdJwtVcAuthorizationDetails.fromJson(json['details']),
        );
    }
  }
}

class MsoMdocAuthorizationDetails {
  final String doctype;

  MsoMdocAuthorizationDetails({required this.doctype});

  Map<String, dynamic> toJson() => {'doctype': doctype};

  factory MsoMdocAuthorizationDetails.fromJson(Map<String, dynamic> json) {
    return MsoMdocAuthorizationDetails(doctype: json['doctype']);
  }
}

class SdJwtVcAuthorizationDetails {
  final String vct;

  SdJwtVcAuthorizationDetails({required this.vct});

  Map<String, dynamic> toJson() => {'vct': vct};

  factory SdJwtVcAuthorizationDetails.fromJson(Map<String, dynamic> json) {
    return SdJwtVcAuthorizationDetails(vct: json['vct']);
  }
}
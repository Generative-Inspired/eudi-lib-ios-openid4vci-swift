// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

class MsoMdocCredential {
  final String format;
  final String docType;

  MsoMdocCredential({
    required this.format,
    required this.docType,
  });

  // JSON serialization
  Map<String, dynamic> toJson() => {
    'format': format,
    'doctype': docType,
  };

  factory MsoMdocCredential.fromJson(Map<String, dynamic> json) {
    return MsoMdocCredential(
      format: json['format'] as String,
      docType: json['doctype'] as String,
    );
  }
}
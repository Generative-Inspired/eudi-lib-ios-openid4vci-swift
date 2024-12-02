// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

class IssuedCertificate {
  final String format;
  final String content;

  IssuedCertificate({
    required this.format,
    required this.content,
  });

  // JSON serialization
  Map<String, dynamic> toJson() => {
    'format': format,
    'content': content,
  };

  factory IssuedCertificate.fromJson(Map<String, dynamic> json) {
    return IssuedCertificate(
      format: json['format'] as String,
      content: json['content'] as String,
    );
  }
}
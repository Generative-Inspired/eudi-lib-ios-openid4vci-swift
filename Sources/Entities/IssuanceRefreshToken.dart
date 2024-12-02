// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

class IssuanceRefreshToken implements CanExpire {
  @override
  final double? expiresIn;
  final String? refreshToken;

  IssuanceRefreshToken({this.refreshToken}) : expiresIn = null;

  // JSON serialization
  Map<String, dynamic> toJson() => {
    'refreshToken': refreshToken,
    'expiresIn': expiresIn,
  };

  factory IssuanceRefreshToken.fromJson(Map<String, dynamic> json) {
    return IssuanceRefreshToken(
      refreshToken: json['refreshToken'] as String?,
    );
  }
}
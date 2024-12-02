// Translated to Dart from Swift using AI by GenInspired Inc
// Date: December 02, 2024
// Original Copyright (c) 2023 European Commission
// Licensed under the Apache License, Version 2.0

extension UriExtensions on Uri {
  Map<String, String> get queryParameters {
    return queryParametersAll.map(
      (key, value) => MapEntry(key, value.first),
    );
  }

  Uri? appendingQueryParameters(Map<String, String> parameters) {
    final queryParams = Map<String, String>.from(queryParameters)
      ..addAll(parameters);
    
    return replace(queryParameters: queryParams);
  }
}
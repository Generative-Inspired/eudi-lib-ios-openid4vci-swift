
enum JsonParseError implements Exception {
  fileNotFound,
  dataInitialization,
  jsonSerialization,
  mappingFail,
  invalidJSON,
  invalidJWT,
  notSupportedOperation;

  String get message {
    switch (this) {
      case JsonParseError.fileNotFound:
        return "File not found";
      case JsonParseError.dataInitialization:
        return "Data initialization failed";
      case JsonParseError.jsonSerialization:
        return "JSON serialization failed";
      case JsonParseError.mappingFail:
        return "Mapping failed";
      case JsonParseError.invalidJSON:
        return "Invalid JSON";
      case JsonParseError.invalidJWT:
        return "Invalid JWT";
      case JsonParseError.notSupportedOperation:
        return "Operation not supported";
    }
  }

  @override
  String toString() => message;
}

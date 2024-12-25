class EmptyResponse {
  EmptyResponse();

  Map<String, dynamic> toJson() => {};

  factory EmptyResponse.fromJson(Map<String, dynamic> json) {
    return EmptyResponse();
  }
}
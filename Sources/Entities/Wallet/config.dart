
class Config {
  final String clientId;
  final Uri redirectUri;

  Config({
    required this.clientId,
    required this.redirectUri,
  });

  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'redirect_uri': redirectUri.toString(),
    };
  }
}

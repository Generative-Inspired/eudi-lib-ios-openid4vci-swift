
import 'dart:io';

class SelfSignedSessionDelegate {
  bool Function(X509Certificate cert, String host, int port)? onBadCertificate;

  SelfSignedSessionDelegate() {
    // Allow self-signed certificates by default
    onBadCertificate = (X509Certificate cert, String host, int port) => true;
  }

  HttpClient createHttpClient() {
    final client = HttpClient();
    client.badCertificateCallback = onBadCertificate;
    return client;
  }
}

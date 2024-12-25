
class CredentialIdentifier {
  final String value;

  CredentialIdentifier({required this.value}) {
    if (value.isEmpty) {
      throw Exception('Value cannot be empty');
    }
  }

  Map<String, dynamic> toJson() => {'credentialId': value};
}

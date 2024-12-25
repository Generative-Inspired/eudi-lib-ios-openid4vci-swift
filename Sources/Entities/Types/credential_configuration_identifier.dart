
class CredentialConfigurationIdentifier {
  final String value;

  CredentialConfigurationIdentifier({required this.value}) {
    if (value.isEmpty) {
      throw Exception('Value cannot be empty');
    }
  }

  Map<String, dynamic> toJson() => {'credentialConfigurationId': value};
}

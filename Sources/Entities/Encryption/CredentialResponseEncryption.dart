
enum CredentialResponseEncryption {
  notRequired,
  required;

  bool get isNotRequired => this == CredentialResponseEncryption.notRequired;

  Map<String, dynamic> toJson() {
    switch (this) {
      case CredentialResponseEncryption.notRequired:
        return {
          'encryption_required': false,
        };
      case CredentialResponseEncryption.required:
        return {
          'encryption_required': true,
          'alg_values_supported': [],
          'enc_values_supported': [],
        };
    }
  }

  factory CredentialResponseEncryption.fromJson(Map<String, dynamic> json) {
    final encryptionRequired = json['encryption_required'] as bool;
    if (!encryptionRequired) {
      return CredentialResponseEncryption.notRequired;
    }
    return CredentialResponseEncryption.required;
  }
}

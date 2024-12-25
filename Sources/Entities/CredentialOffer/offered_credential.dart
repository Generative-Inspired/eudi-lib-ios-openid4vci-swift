
import 'package:openid4vci/src/entities/mso_mdoc_credential.dart';
import 'package:openid4vci/src/entities/w3c_verifiable_credential.dart';

enum OfferedCredential {
  msoMdocCredential(MsoMdocCredential credential),
  w3CVerifiableCredential(W3CVerifiableCredential credential);

  final dynamic credential;
  const OfferedCredential.msoMdocCredential(this.credential);
  const OfferedCredential.w3CVerifiableCredential(this.credential);

  Map<String, dynamic> toJson() {
    switch (this) {
      case msoMdocCredential:
        return {'msoMdocCredential': credential.toJson()};
      case w3CVerifiableCredential:
        return {'w3CVerifiableCredential': credential.toJson()};
    }
  }

  factory OfferedCredential.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('msoMdocCredential')) {
      return OfferedCredential.msoMdocCredential(
        MsoMdocCredential.fromJson(json['msoMdocCredential']));
    } else if (json.containsKey('w3CVerifiableCredential')) {
      return OfferedCredential.w3CVerifiableCredential(
        W3CVerifiableCredential.fromJson(json['w3CVerifiableCredential']));
    }
    throw Exception('Invalid OfferedCredential format');
  }
}

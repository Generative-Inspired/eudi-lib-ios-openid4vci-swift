
import 'jose_algorithm.dart';

class JOSEEncryptionMethod extends JOSEAlgorithm {
  int cekBitLength;

  JOSEEncryptionMethod(EncryptionMethodType type)
      : cekBitLength = type.options.$2,
        super(name: type.name, requirement: type.options.$1);

  JOSEEncryptionMethod.fromName(String name) : cekBitLength = 0, super(name: name);

  factory JOSEEncryptionMethod.parse(String s) {
    final type = EncryptionMethodType.values.firstWhere(
      (e) => e.name == s,
      orElse: () => throw FormatException('Invalid encryption method type: $s'),
    );
    return JOSEEncryptionMethod(type);
  }
}

enum EncryptionMethodType {
  A128CBC_HS256('A128CBC-HS256', (Requirement.REQUIRED, 256)),
  A192CBC_HS384('A192CBC-HS384', (Requirement.OPTIONAL, 384)),
  A256CBC_HS512('A256CBC-HS512', (Requirement.REQUIRED, 512)),
  A128GCM('A128GCM', (Requirement.RECOMMENDED, 128)),
  A192GCM('A192GCM', (Requirement.OPTIONAL, 192)),
  A256GCM('A256GCM', (Requirement.RECOMMENDED, 256)),
  XC20P('XC20P', (Requirement.OPTIONAL, 256));

  final String name;
  final (Requirement, int) options;
  const EncryptionMethodType(this.name, this.options);
}

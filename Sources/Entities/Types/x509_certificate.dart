
class X509Certificate {
  final String value;

  X509Certificate({required this.value}) {
    if (value.isEmpty) {
      throw Exception('Value cannot be empty');
    }
  }
}

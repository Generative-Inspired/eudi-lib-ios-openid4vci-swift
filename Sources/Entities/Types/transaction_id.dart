
class TransactionId {
  final String value;
  final int? interval;

  TransactionId({
    required this.value,
    this.interval,
  }) {
    if (value.isEmpty) {
      throw ValidationError(reason: "Value cannot be empty");
    }
  }

  Map<String, dynamic> toDeferredRequestTO() {
    return {'transactionId': value};
  }
}

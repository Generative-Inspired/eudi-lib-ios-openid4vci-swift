
enum IssuedCredential {
  issued(String format, String credential, String notificationId),
  deferred(TransactionId transactionId)
}

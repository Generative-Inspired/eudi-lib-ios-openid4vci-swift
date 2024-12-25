
class ValidationError implements Exception {
  final String type;
  final String reason;
  final GenericErrorResponse? response;

  ValidationError.error(this.reason) : type = 'error', response = null;
  ValidationError.todo(this.reason) : type = 'todo', response = null;
  ValidationError.nonHttpsUrl(this.reason) : type = 'nonHttpsUrl', response = null;
  ValidationError.invalidUrl(this.reason) : type = 'invalidUrl', response = null;
  ValidationError.response(GenericErrorResponse this.response)
      : type = 'response',
        reason = response.errorDescription ?? '';

  @override
  String toString() {
    return 'ValidationError:$type: $reason';
  }
}

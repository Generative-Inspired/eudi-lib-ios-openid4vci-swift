abstract class ResolverType<InputType, OutputType, ErrorType extends Exception> {
  /// Resolves type asynchronously.
  ///
  /// Parameters:
  ///   fetcher: The fetcher object responsible for fetching data.
  ///   source: The input source for resolving data.
  /// Returns: An asynchronous result containing the resolved data or an error.
  Future<Result<OutputType?, ErrorType>> resolve({
    required Fetcher<OutputType> fetcher,
    InputType? source,
  });
}
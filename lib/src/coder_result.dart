/// A simple wrapper to handle both success and failure responses generically.
class CoderResult<T> {
  final T? data;
  final String? error;

  const CoderResult._({this.data, this.error});

  /// Success constructor
  factory CoderResult.success(T data) => CoderResult._(data: data);

  /// Failure constructor
  factory CoderResult.failure(String error) => CoderResult._(error: error);

  /// Returns true if the request was successful
  bool get isSuccess => data != null;
}

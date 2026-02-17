
sealed class ApiResult<T> {
  const ApiResult();

  /// Maps the [data] of a success result to a new type [R].
  ApiResult<R> map<R>(R Function(T data) transform) {
    return switch (this) {
      ApiSuccess(:final data) => ApiSuccess(transform(data)),
      ApiFailure(:final message) => ApiFailure(message),
    };
  }
  R when<R>({
    required R Function(T data) success,
    required R Function(String message) failure,
  }) {
    return switch (this) {
      ApiSuccess(:final data) => success(data),
      ApiFailure(:final message) => failure(message),
    };
  }
}
class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  const ApiSuccess(this.data);
}

/// Failed result holding an error [message].
class ApiFailure<T> extends ApiResult<T> {
  /// Human-readable error description.
  final String message;

  const ApiFailure(this.message);
}

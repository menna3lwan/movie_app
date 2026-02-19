sealed class ApiResult<T> {
  const ApiResult();

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

class ApiFailure<T> extends ApiResult<T> {
  final String message;
  const ApiFailure(this.message);
}

sealed class ApiResult<T> {
  const ApiResult();

  ApiResult<Result> map<Result>(Result Function(T data) transform) {
    return switch (this) {
      ApiSuccess(:final data) => ApiSuccess(transform(data)),
      ApiFailure(:final message) => ApiFailure(message),
    };
  }

  result when<result>({
    required result Function(T data) success,
    required result Function(String message) failure,
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

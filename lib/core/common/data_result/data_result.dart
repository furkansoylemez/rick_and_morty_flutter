sealed class DataResult<T> {
  const DataResult();
}

final class Success<T> extends DataResult<T> {
  const Success(this.data);
  final T data;
}

final class Error<T> extends DataResult<T> {
  const Error({required this.message, this.exception});
  final String? message;
  final Exception? exception;
}

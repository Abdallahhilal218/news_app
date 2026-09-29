sealed class ResultApi<T> {
  const ResultApi();
}

class Success<T> extends ResultApi<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends ResultApi<T> {
  final String error;
  const Error(this.error);
}

// ignore_for_file: inference_failure_on_function_return_type

import 'package:rick_and_morty/core/common/data_result/data_result.dart';

extension DataResultExtensions<T> on DataResult<T> {
  void onSuccess(Function(T data) handleSuccess) {
    if (this is Success<T>) {
      handleSuccess((this as Success<T>).data);
    }
  }

  void onError(Function(String? message, [Exception? exception]) handleError) {
    if (this is Error<T>) {
      final error = this as Error<T>;
      handleError(error.message, error.exception);
    }
  }
}

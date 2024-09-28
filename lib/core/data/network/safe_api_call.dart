import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/common/data_result/data_result.dart';

Future<DataResult<T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final response = await apiCall;
    return Success(response);
  } on DioException catch (e) {
    return Error<T>(
      message: e.message,
      exception: e,
    );
  } on Exception catch (e) {
    return Error<T>(
      message: e.toString(),
      exception: e,
    );
  } catch (e) {
    return Error<T>(
      message: e.toString(),
    );
  }
}

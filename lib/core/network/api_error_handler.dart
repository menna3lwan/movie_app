import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_result.dart';

abstract class ApiErrorHandler {
  static ApiResult<T> handle<T>(dynamic error) {
    if (error is SocketException) {
      return const ApiFailure('No internet CONNECTION');
    }
    if (error is HttpException) {
      return ApiFailure(error.message);
    }
    if (error is FormatException) {
      return const ApiFailure('Invalid response format');
    }
    return ApiFailure(error.toString());
  }

  static String messageFromStatusCode(int statusCode) {
    return switch (statusCode) {
      400 => 'Bad request',
      401 => 'Unauthorized',
      403 => 'Forbidden',
      404 => 'Not found',
      408 => 'Request timed out',
      500 => 'Internal server error',
      503 => 'Service unavailable',
      _ => 'Something went wrong (status: $statusCode)',
    };
  }

  static ApiResult<T> fromResponse<T>(http.Response response) {
    return ApiFailure(messageFromStatusCode(response.statusCode));
  }
}

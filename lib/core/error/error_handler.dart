import 'package:dio/dio.dart';
import 'exceptions.dart';

class ErrorHandler {
  static Exception handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return ServerException('Connection timeout');
      case DioExceptionType.badResponse:
        return ServerException('Bad server response');
      case DioExceptionType.cancel:
        return ServerException('Request was cancelled');
      case DioExceptionType.unknown:
        return ServerException('No Internet or unexpected error');
      default:
        return ServerException('Unexpected error occurred');
    }
  }
}

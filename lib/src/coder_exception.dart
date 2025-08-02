import 'package:dio/dio.dart';

/// Handles Dio exceptions and maps them to user-friendly error messages.
class CoderException {
  /// Parses Dio exceptions into readable strings.
  static String from(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return "Request timed out";
        case DioExceptionType.badResponse:
          return "Server error: ${error.response?.statusCode}";
        case DioExceptionType.cancel:
          return "Request cancelled";
        default:
          return "Unexpected network error";
      }
    }
    return "Unknown error occurred";
  }
}

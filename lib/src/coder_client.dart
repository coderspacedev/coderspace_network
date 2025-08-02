import 'package:dio/dio.dart';
import 'coder_result.dart';
import 'coder_exception.dart';

/// Main class to make HTTP requests using Dio.
class CoderClient {
  final Dio _dio;

  /// Constructor for initializing the Dio instance.
  ///
  /// [baseUrl]: Base API URL
  /// [headers]: Optional default headers
  /// [timeout]: Optional request timeout
  CoderClient({
    required String baseUrl,
    Map<String, dynamic>? headers,
    Duration timeout = const Duration(seconds: 10),
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: timeout,
           receiveTimeout: timeout,
           headers: headers,
         ),
       );

  /// Performs GET request and parses the response using optional parser.
  Future<CoderResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      final parsed = parser != null ? parser(response.data) : response.data;
      return CoderResult.success(parsed);
    } catch (e) {
      return CoderResult.failure(CoderException.from(e));
    }
  }

  /// Performs POST request and parses the response using optional parser.
  Future<CoderResult<T>> post<T>(
    String path, {
    dynamic data,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final response = await _dio.post(path, data: data);
      final parsed = parser != null ? parser(response.data) : response.data;
      return CoderResult.success(parsed);
    } catch (e) {
      return CoderResult.failure(CoderException.from(e));
    }
  }

  // You can also add PUT, DELETE, PATCH methods similarly here.
}

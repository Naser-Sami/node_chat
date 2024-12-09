import 'dart:developer';
import 'package:dio/dio.dart';

class ApiClient {
  static const String baseUrl = 'http://localhost:3000';
  static String? token;

  // Dio instance
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ),
  );

  // Optional cancel token for request cancellation
  // static CancelToken? cancelToken;

  // Constructor to add interceptors
  ApiClient() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('Request: ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log('Response: [${response.statusCode}] ${response.realUri}');
          return handler.next(response);
        },
        onError: (error, handler) {
          log('Error: [${error.response?.statusCode}] ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }

  /// Cancel any ongoing requests
  // static void cancelOngoingRequests() {
  //   if (cancelToken != null && !cancelToken!.isCancelled) {
  //     cancelToken?.cancel('Request canceled.');
  //   }
  //   cancelToken = CancelToken();
  // }

  /// General HTTP Request Handler
  static Future<T?> request<T>({
    required String path,
    required String method,
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? parser,
  }) async {
    headers ??= dio.options.headers;
    headers['Authorization'] = 'Bearer $token';

    log('Request: $method $path');
    log('Token $token');
    log('Query Parameters: $queryParameters');
    log('Data: $data');
    log('Headers: $headers');

    try {
      // Make HTTP request
      final response = await dio.request(
        path,
        options: Options(method: method, headers: headers),
        queryParameters: queryParameters,
        data: data,
      );

      log('Response: ${response.statusCode} ${response.realUri}');
      log('Response Data: ${response.data}');

      // Parse response using the provided parser
      if (parser != null) {
        return parser(response.data);
      } else {
        return response.data as T;
      }
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      handleError(e);
      throw Exception(e);
    } catch (e) {
      log('Unhandled error: $e');
      throw Exception(e);
    }
  }

  /// GET Method
  static Future<T?> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? parser,
  }) async {
    log('GET DATA: $parser');

    return request(
      path: path,
      method: 'GET',
      queryParameters: queryParameters,
      headers: headers,
      parser: parser,
    );
  }

  /// POST Method
  static Future<T?> post<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? parser,
  }) async {
    return request(
      path: path,
      method: 'POST',
      data: data,
      headers: headers,
      parser: parser,
    );
  }

  /// PUT Method
  static Future<T?> put<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? parser,
  }) async {
    return request(
      path: path,
      method: 'PUT',
      data: data,
      headers: headers,
      parser: parser,
    );
  }

  /// DELETE Method
  static Future<T?> delete<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? parser,
  }) async {
    return request(
      path: path,
      method: 'DELETE',
      data: data,
      headers: headers,
      parser: parser,
    );
  }

  /// Handle Errors Globally
  static void handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        log('Connection timeout: ${error.message}');
        throw Exception('Connection timeout: ${error.message}');
      case DioExceptionType.receiveTimeout:
        log('Receive timeout: ${error.message}');
        throw Exception('Receive timeout: ${error.message}');
      case DioExceptionType.badResponse:
        log('Bad response: ${error.response?.statusCode} ${error.response?.data}');
        throw Exception(error.response?.data['message']);
      default:
        log('Unexpected error: ${error.message}');
        throw Exception('Unexpected error: ${error.message}');
    }
  }
}

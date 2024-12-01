import 'dart:developer';
import 'package:dio/dio.dart';

class ApiClient {
  static const String baseUrl = 'http://localhost:3000';

  // Dio instance
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // Optional cancel token for request cancellation
  static CancelToken? cancelToken;

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
  static void cancelOngoingRequests() {
    if (cancelToken != null && !cancelToken!.isCancelled) {
      cancelToken?.cancel('Request canceled.');
    }
    cancelToken = CancelToken();
  }

  /// General HTTP Request Handler
  static Future<T?> request<T>({
    required String path,
    required String method,
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? headers,
    CancelToken? token,
    T Function(dynamic data)? parser,
  }) async {
    try {
      // Make HTTP request
      final response = await dio.request(
        path,
        options: Options(method: method, headers: headers),
        queryParameters: queryParameters,
        data: data,
        cancelToken: token ?? cancelToken,
      );

      // Parse response using the provided parser
      if (parser != null) {
        return parser(response.data);
      } else {
        return response.data as T;
      }
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      if (CancelToken.isCancel(e)) {
        log('Request canceled');
      } else {
        handleError(e);
      }
      return null;
    } catch (e) {
      log('Unhandled error: $e');
      return null;
    }
  }

  /// GET Method
  static Future<T?> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? token,
    T Function(dynamic data)? parser,
  }) async {
    return request(
      path: path,
      method: 'GET',
      queryParameters: queryParameters,
      headers: headers,
      token: token,
      parser: parser,
    );
  }

  /// POST Method
  static Future<T?> post<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
    CancelToken? token,
    T Function(dynamic data)? parser,
  }) async {
    return request(
      path: path,
      method: 'POST',
      data: data,
      headers: headers,
      token: token,
      parser: parser,
    );
  }

  /// PUT Method
  static Future<T?> put<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
    CancelToken? token,
    T Function(dynamic data)? parser,
  }) async {
    return request(
      path: path,
      method: 'PUT',
      data: data,
      headers: headers,
      token: token,
      parser: parser,
    );
  }

  /// DELETE Method
  static Future<T?> delete<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
    CancelToken? token,
    T Function(dynamic data)? parser,
  }) async {
    return request(
      path: path,
      method: 'DELETE',
      data: data,
      headers: headers,
      token: token,
      parser: parser,
    );
  }

  /// Handle Errors Globally
  static void handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        log('Connection timeout: ${error.message}');
        break;
      case DioExceptionType.receiveTimeout:
        log('Receive timeout: ${error.message}');
        break;
      case DioExceptionType.badResponse:
        log('Bad response: ${error.response?.statusCode} ${error.response?.data}');
        break;
      default:
        log('Unexpected error: ${error.message}');
    }
  }
}

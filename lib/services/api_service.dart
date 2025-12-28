import 'package:dio/dio.dart';
import '../utils/constants.dart';
import '../storage/local_storage.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  late Dio _dio;
  final _storage = LocalStorage();

  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: Duration(seconds: int.parse(AppConstants.apiTimeout)),
      receiveTimeout: Duration(seconds: int.parse(AppConstants.apiTimeout)),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptor for auth token
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = _storage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            // Token expired or invalid
            _storage.clearAll();
          }
          return handler.next(error);
        },
      ),
    );
  }

  // GET Request
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST Request
  Future<Response> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PUT Request
  Future<Response> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PATCH Request
  Future<Response> patch(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE Request
  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Error Handler
  String _handleError(DioException error) {
    String errorMessage = AppStrings.errorOccurred;

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      errorMessage = 'Connection timeout';
    } else if (error.type == DioExceptionType.badResponse) {
      final statusCode = error.response?.statusCode;
      final responseData = error.response?.data;

      if (statusCode == 400) {
        errorMessage = responseData['message'] ?? 'Bad request';
      } else if (statusCode == 401) {
        errorMessage = AppStrings.sessionExpired;
      } else if (statusCode == 404) {
        errorMessage = 'Resource not found';
      } else if (statusCode == 409) {
        errorMessage = responseData['message'] ?? 'Conflict occurred';
      } else if (statusCode == 500) {
        errorMessage = 'Server error occurred';
      } else {
        errorMessage = responseData['message'] ?? AppStrings.errorOccurred;
      }
    } else if (error.type == DioExceptionType.unknown) {
      errorMessage = AppStrings.noInternet;
    }

    return errorMessage;
  }

  // Set custom header
  void setHeader(String key, String value) {
    _dio.options.headers[key] = value;
  }

  // Remove header
  void removeHeader(String key) {
    _dio.options.headers.remove(key);
  }
}

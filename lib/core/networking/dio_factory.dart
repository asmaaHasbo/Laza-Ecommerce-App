import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:laza_ecommerce_app/core/error/error_handler.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration requestTimeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();

      dio!.options.connectTimeout = requestTimeOut;
      dio!.options.receiveTimeout = requestTimeOut;
      addDioHeaders();
      addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() {
    dio!.options.headers = {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1ZmFmMDdhYi0yOGY1LTQ5YmItNTM5Mi0wOGRlMDQ4NTRkODkiLCJqdGkiOiJjYzkyYjE1OS1iNjk0LTQzOTUtYTlhNS1iZDU2MTEyMWUxNmYiLCJlbWFpbCI6ImtyaW1zbGFtYTQxMkBnbWFpbC5jb20iLCJuYW1lIjoiS2FyaW0gU2xhbWEiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3NjAyMzczNTUsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.NIn3XCk0DX2gbXbK652NjjvbJ6GAf_R39x4nHBIT7ts",
    };
  }

  static void addDioInterceptors() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        error: true,
      ),
    );
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
              // جيب الـ token من SharedPreferences
              // SharedPreferences prefs = await SharedPreferences.getInstance();
              // String? token = prefs.getString(SharedPrefKeys.userToken);
              // if (token != null) {
              //   options.headers['Authorization'] = 'Bearer $token';
              // } else {
              //   print('No token found in SharedPreferences');
              // }
              return handler.next(options);
            },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          final errorMessage = handleDioException(e);
          // print('DioError: ${e.response?.statusCode} - ${e.message} - ${e.response?.data}');
          return handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              response: e.response,
              type: e.type,
              error: errorMessage,
            ),
          );
        },
      ),
    );
  }
}

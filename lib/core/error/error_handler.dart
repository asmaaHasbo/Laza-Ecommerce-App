import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:laza_ecommerce_app/core/error/api_error_model/api_error_model.dart';

String handleDioException(DioException e) {
  if (e.response?.data != null) {
    try {
      Map<String, dynamic> jsonData;
      if (e.response!.data is String) {
        // log('Response data is a string: ${e.response!.data}');
        jsonData = {};
        return _getDefaultErrorMessage(
          e.type,
          statusCode: e.response?.statusCode,
        );
      } else {
        jsonData = e.response!.data as Map<String, dynamic>;
        final errorModel = ApiErrorModel.fromJson(jsonData);
        return errorModel.getAllErrorMessages();
      }
    } catch (parseError) {
      log('Parse error: $parseError');
      return _getDefaultErrorMessage(
        e.type,
        statusCode: e.response?.statusCode,
      );
    }
  } else {
    return _getDefaultErrorMessage(e.type, statusCode: e.response?.statusCode);
  }
}

String _getDefaultErrorMessage(DioExceptionType type, {int? statusCode}) {
  if (type == DioExceptionType.badResponse && statusCode != null) {
    switch (statusCode) {
      case 400:
        return 'Please check the following errors:';
      case 401:
        return 'Unauthorized. Please log in again.';
      case 403:
        return 'Forbidden. You don’t have permission to access this resource.';
      case 404:
        return 'Resource not found. Please try again.';
      case 409:
        return 'Conflict. The request could not be completed due to a conflict.';
      case 422:
        return 'Unprocessable entity. Please check your input.';
      case 500:
        return 'An error occurred on the server. Please try again later.';
      case 504:
        return 'Gateway timeout. Please try again later.';
      default:
        return 'Server error (HTTP $statusCode). Please try again later.';
    }
  }
  switch (type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection timeout. Please check your internet connection.';
    case DioExceptionType.sendTimeout:
      return 'Send timeout. Please try again.';
    case DioExceptionType.receiveTimeout:
      return 'Server is taking too long to respond. Please try again.';
    case DioExceptionType.badCertificate:
      return 'Security certificate error. Please contact support.';
    case DioExceptionType.cancel:
      return 'Request was cancelled.';
    case DioExceptionType.connectionError:
      return 'No internet connection. Please check your network.';
    case DioExceptionType.unknown:
      return 'An unexpected error occurred. Please try again.';
    case DioExceptionType.badResponse:
      return 'Server error. Please try again later.';
  }
}

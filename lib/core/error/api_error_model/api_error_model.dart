import 'dart:developer';

class ApiErrorModel {
  int? statusCode;
  String? message;
  Map<String, dynamic>? errors;

  ApiErrorModel({this.statusCode, this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    log('Parsing JSON: $json');
    return ApiErrorModel(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      errors: json['errors'] as Map<String, dynamic>?,
    );
  }

  String getAllErrorMessages() {
    if (errors == null || errors!.isEmpty) {
      log('No errors found, returning message: $message');
      return message ?? 'An error occurred. Please try again.';
    }

    List<String> errorMessages = [];

    errors!.forEach((key, value) {
      log('Processing error for key: $key, value: $value');
      if (value is List) {
        for (var error in value) {
          errorMessages.add('• ${error.toString()}');
        }
      } else {
        errorMessages.add('• ${value.toString()}');
      }
    });

    log('Final error messages: $errorMessages');
    return errorMessages.isNotEmpty
        ? errorMessages.join('\n')
        : message ?? 'An error occurred. Please try again.';
  }
}

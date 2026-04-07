import 'dart:developer';
import 'package:laza_ecommerce_app/core/error/api_error_handler.dart';
import 'package:laza_ecommerce_app/core/networking/api_result.dart';
import 'package:laza_ecommerce_app/features/auth/login/data/api/login_service.dart';
import 'package:laza_ecommerce_app/features/auth/login/data/models/login_response_model.dart';
import 'package:laza_ecommerce_app/features/auth/login/data/models/login_resquest_model.dart';

class LoginRepo {
  final LoginService loginService;
  LoginRepo(this.loginService);

  Future<ApiResult<LoginResponseModel>> loginRepoFunction(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final response = await loginService.loginRequest(loginRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      log('Login error: ${e.toString()}');
      final exception = ApiErrorHandler.handle(e);
      return ApiResult.failure(exception.message);
    }
  }
}

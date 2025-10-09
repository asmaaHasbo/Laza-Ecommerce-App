import 'dart:developer';
import 'package:dio/dio.dart';
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
    } on DioException catch (e) {
      log('DioException caught: ${e.error.toString()}');
      return ApiResult.failure(e.error.toString());
    } catch (e) {
      return ApiResult.failure('يااااااااااااااني');
    }
  }
}

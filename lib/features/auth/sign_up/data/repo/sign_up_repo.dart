import 'dart:developer';
import 'package:laza_ecommerce_app/core/error/api_error_handler.dart';
import 'package:laza_ecommerce_app/core/networking/api_result.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/data/api/sign_up_service.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/data/models/sign_up_request_model.dart';

class SignUpRepo {
  final SignUpServices signUpService;
  SignUpRepo(this.signUpService);

  Future<ApiResult> signUpRepoFunction(
    SignUpRequestModel signUpRequestModel,
  ) async {
    try {
      final response = await signUpService.signUpRequest(signUpRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      log('SignUp error: ${e.toString()}');
      final exception = ApiErrorHandler.handle(e);
      return ApiResult.failure(exception.message);
    }
  }
}

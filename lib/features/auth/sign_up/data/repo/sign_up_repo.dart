import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:laza_ecommerce_app/core/networking/api_result.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/data/api/sign_up_service.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/data/models/sign_up_request_model.dart';

class SignUpRepo {
  final SignUpService signUpService;
  SignUpRepo(this.signUpService);

  Future<ApiResult> signUpRepoFunction(
    SignUpRequestModel signUpRequestModel,
  ) async {
    try {
      final response = await signUpService.signUpRequest(signUpRequestModel);
      return ApiResult.success(response);
    } on DioException catch (e) {
      log('DioException caught: ${e.error.toString()}');
      return ApiResult.failure(e.error.toString());
    } catch (e) {
      return ApiResult.failure('يااااااااااااااني');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:laza_ecommerce_app/core/networking/api_end_pontis.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/data/models/sign_up_request_model.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'sign_up_service.g.dart';

@RestApi(baseUrl: ApiEndPontis.baseUrl)
abstract class SignUpService {
  factory SignUpService(Dio dio) = _SignUpService;

  @POST(ApiEndPontis.signUp)
  Future<SignUpResponseModel> signUpRequest(@Body() SignUpRequestModel signUpRequestModel);
}

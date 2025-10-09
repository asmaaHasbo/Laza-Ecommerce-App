import 'package:dio/dio.dart';
import 'package:laza_ecommerce_app/core/networking/api_end_pontis.dart';
import 'package:laza_ecommerce_app/features/auth/login/data/models/login_response_model.dart';
import 'package:laza_ecommerce_app/features/auth/login/data/models/login_resquest_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'login_service.g.dart';

@RestApi(baseUrl: ApiEndPontis.baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio) = _LoginService;

  @POST(ApiEndPontis.login)
  Future<LoginResponseModel> loginRequest(
    @Body() LoginRequestModel signUpRequestModel,
  );
}

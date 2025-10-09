import 'package:dio/dio.dart';
import 'package:laza_ecommerce_app/core/networking/api_end_pontis.dart';
import 'package:laza_ecommerce_app/features/home/data/models/category_model/categories_model.dart';
import 'package:laza_ecommerce_app/features/home/data/models/products_model/product_resquest_model.dart';
import 'package:laza_ecommerce_app/features/home/data/models/products_model/products_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiEndPontis.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiEndPontis.categories)
  Future<CategoriesModel> getCategories();

  @GET(ApiEndPontis.products)
  Future<ProductsModel> getProducts(
    @Body() ProductResquestModel productResquestModel,
  );
}

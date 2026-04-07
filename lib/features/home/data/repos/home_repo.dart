import 'dart:developer';

import 'package:laza_ecommerce_app/core/error/api_error_handler.dart';
import 'package:laza_ecommerce_app/core/networking/api_result.dart';
import 'package:laza_ecommerce_app/features/home/data/api/home_api_service.dart';
import 'package:laza_ecommerce_app/features/home/data/models/category_model/categories_model.dart';
import 'package:laza_ecommerce_app/features/home/data/models/products_model/product_resquest_model.dart';
import 'package:laza_ecommerce_app/features/home/data/models/products_model/products_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<CategoriesModel>> getCategories() async {
    try {
      final response = await _homeApiService.getCategories();
      return ApiResult.success(response);
    } catch (e) {
      log('Get categories error: ${e.toString()}');
      final exception = ApiErrorHandler.handle(e);
      return ApiResult.failure(exception.message);
    }
  }

  Future<ApiResult<ProductsModel>> getProducts(
    ProductResquestModel productResquestModel,
  ) async {
    try {
      final response = await _homeApiService.getProducts(productResquestModel);
      log("response from repo is ${response.items?.length} ");
      return ApiResult.success(response);
    } catch (e) {
      log('Get products error: ${e.toString()}');
      final exception = ApiErrorHandler.handle(e);
      return ApiResult.failure(exception.message);
    }
  }
}

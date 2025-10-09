import 'dart:developer';

import 'package:dio/dio.dart';
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
    } on DioException catch (e) {
      log('DioException caught: ${e.error.toString()}');
      return ApiResult.failure(e.error.toString());
    } catch (e) {
      return ApiResult.failure('يااااااااااااااني');
    }
  }

  Future<ApiResult<ProductsModel>> getProducts(
    ProductResquestModel productResquestModel,
  ) async {
    try {
      final response = await _homeApiService.getProducts(productResquestModel);
      log("response from repo is ${response.items?.length} ");
      return ApiResult.success(response);
    } on DioException catch (e) {
      log('DioException caught: ${e.error.toString()}');
      return ApiResult.failure(e.error.toString());
    } catch (e) {
      return ApiResult.failure('يااااااااااااااني error is : ${e.toString}');
    }
  }
}

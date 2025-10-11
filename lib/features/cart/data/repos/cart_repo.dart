import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:laza_ecommerce_app/core/networking/api_result.dart';
import 'package:laza_ecommerce_app/features/cart/data/api/cart_api_service.dart';
import 'package:laza_ecommerce_app/features/cart/data/models/add_cart_request_model.dart';
import 'package:laza_ecommerce_app/features/cart/data/models/add_cart_response_model.dart';
import 'package:laza_ecommerce_app/features/cart/data/models/cart_products_model/cart_products_model.dart';

class CartRepo {
  final CartApiService _cartApiService;

  CartRepo(this._cartApiService);
  //========================== add item to cart ==========
  Future<ApiResult<AddCartResponseModel>> addItemToCart(
    AddCartRequestModel addCartRequestModel,
  ) async {
    try {
      final response = await _cartApiService.addProductToCart(
        addCartRequestModel,
      );
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(e.error.toString());
    } catch (e) {
      return ApiResult.failure('يااااااااااااااني error is ${e.toString()}');
    }
  }

  //========================== get item from cart ==========

  Future<ApiResult<CartProductsModel>> getCartProducts(
  ) async {
    try {
      final response = await _cartApiService.getCartProducts();
      log("response from repo is ${response.cartItems?.length} ");
      return ApiResult.success(response);
    } on DioException catch (e) {
      log('DioException caught: ${e.error.toString()}');
      return ApiResult.failure(e.error.toString());
    } catch (e) {
      return ApiResult.failure('يااااااااااااااني error is : ${e.toString}');
    }
  }

  //========================== delete item from cart ==========

 Future<ApiResult> deleteCartProducts( {required String itemId} ) async {
    try {
      await _cartApiService.deleteProduct(itemId , { 'id' : itemId });
      log("item deleted ");
      return ApiResult.success('item deleted successfuly ');
    } on DioException catch (e) {
      log('DioException caught:error is cant deleted ${e.toString()} ');
      return ApiResult.failure('error is cant deleted');
    } catch (e) {
      log(' error is cant deleted ${e.toString()}');
      return ApiResult.failure('يااااااااااااااني error is cant deleted');
    }
  }

}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_ecommerce_app/core/networking/api_result.dart';
import 'package:laza_ecommerce_app/features/cart/data/models/add_cart_request_model.dart';

import 'package:laza_ecommerce_app/features/cart/data/models/add_cart_response_model.dart';
import 'package:laza_ecommerce_app/features/cart/data/models/cart_products_model/cart_products_model.dart';
import 'package:laza_ecommerce_app/features/cart/data/repos/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());

  //===================== add product to cart
  emitAddProductsToCartStates() async {
    emit(AddCartLoading());
    log('loading');
    ApiResult<AddCartResponseModel> response = await cartRepo.addItemToCart(
      AddCartRequestModel(
        productId: "18a909d7-91ae-4d71-a06b-de4bbe5a2c5b",
        quantity: 1,
      ),
    );

    response.when(
      success: (responseModel) {
        log('add carrt item id is ${responseModel.id} ');
        emit(AddCartSuccess(addCartResponseModel: responseModel));
      },
      failure: (err) {
        log('Error: $err');
        emit(AddCartFailure(errMsg: err));
      },
    );
  }

  //========================= get product cart =========
  emitGetProductsCartStates() async {
    emit(AddCartLoading());
    log('loading');
    ApiResult<CartProductsModel> response = await cartRepo.getCartProducts();

    response.when(
      success: (responseModel) {
        log('GET carrt item id is ${responseModel.cartId} ');
        emit(GetCartSuccess(cartProductsModel: responseModel));
      },
      failure: (err) {
        log('Error: $err');
        emit(AddCartFailure(errMsg: err));
      },
    );
  }
}

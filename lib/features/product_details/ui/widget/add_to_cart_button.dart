import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_ecommerce_app/core/shared/screens_bottom_btn.dart';
import 'package:laza_ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensBottomBtn(
      btnName: 'Add to Cart',
      onPressed: () {
        context.read<CartCubit>().emitAddProductsToCartStates();
      },
    );
  }
}

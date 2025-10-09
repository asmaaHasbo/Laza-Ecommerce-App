import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_ecommerce_app/core/themes/app_colors.dart';
import 'package:laza_ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartCubit>(context).emitGetProductsCartStates();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              // size: ScreenUtil.setWidth(100),
              color: AppColors.iconGray,
            ),
            // SizedBox(height: ScreenUtil.setHeight(20)),
            const Text(
              'Your cart is empty',
              // style: AppStyles.font17w600Black,
            ),
            // SizedBox(height: ScreenUtil.setHeight(8)),
            const Text(
              'Add items to get started',
              // style: AppTextStyles.font14w500Black,
            ),
          ],
        ),
      ),
    );
  }
}

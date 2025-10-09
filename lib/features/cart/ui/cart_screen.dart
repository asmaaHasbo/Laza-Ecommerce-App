import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_ecommerce_app/core/themes/app_colors.dart';
import 'package:laza_ecommerce_app/core/themes/app_styles.dart';
import 'package:laza_ecommerce_app/features/cart/data/models/cart_products_model/cart_item.dart';
import 'package:laza_ecommerce_app/features/cart/data/models/cart_products_model/cart_products_model.dart';
import 'package:laza_ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:laza_ecommerce_app/features/cart/ui/widgets/cart_item_widget.dart';

// Main CartScreen widget
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartCubit>(context).emitGetProductsCartStates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CartAppBar(),
      body: const CartContent(),
    );
  }
}

// AppBar widget for CartScreen
class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Center(child: Text('Cart')),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Main content widget for CartScreen
class CartContent extends StatelessWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        log('Cart state is $state');
        return _buildContent(context, state);
      },
    );
  }

  Widget _buildContent(BuildContext context, CartState state) {
    if (state is GetCartLoading) {
      return const CartLoading();
    } else if (state is GetCartFailure) {
      return CartError(errorMessage: state.errMsg);
    } else if (state is GetCartSuccess) {
      return CartItemsView(cartProductsModel: state.cartProductsModel);
    }
    return const SizedBox.shrink();
  }
}

// Widget to display loading state
class CartLoading extends StatelessWidget {
  const CartLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

// Widget to display error state
class CartError extends StatelessWidget {
  final String errorMessage;

  const CartError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}

// Widget to display cart items or empty state
class CartItemsView extends StatefulWidget {
  final CartProductsModel cartProductsModel;

  const CartItemsView({super.key, required this.cartProductsModel});

  @override
  State<CartItemsView> createState() => _CartItemsViewState();
}

class _CartItemsViewState extends State<CartItemsView> {
  void _updateQuantity(String id, int newQuantity) {
    setState(() {
      final index = widget.cartProductsModel.cartItems
          ?.indexWhere((item) => item.productId == id);
      if (index != -1 && newQuantity > 0) {
        widget.cartProductsModel.cartItems?[index!].quantity = newQuantity;
      }
    });
  }

  void _removeItem(String id) {
    setState(() {
      widget.cartProductsModel.cartItems?.removeWhere((item) => item.itemId == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = widget.cartProductsModel.cartItems ?? [];
    if (cartItems.isEmpty) {
      return const EmptyCart();
    }
    return CartItemsList(
      cartItems: cartItems,
      onQuantityChanged: _updateQuantity,
      onRemove: _removeItem,
    );
  }
}

// Widget to display empty cart state
class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.card_travel, color: AppColors.iconGray),
          Text(
            'Your Cart is empty',
            style: AppTextStyles.font17w600Black,
          ),
          Text(
            'Add items you like to your cart',
            style: AppTextStyles.font14w500Black,
          ),
        ],
      ),
    );
  }
}

// Widget to display list of cart items
class CartItemsList extends StatelessWidget {
  final List<CartItemModel> cartItems;
  final void Function(String, int) onQuantityChanged;
  final void Function(String) onRemove;

  const CartItemsList({
    super.key,
    required this.cartItems,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return CartItemWidget(
                cartItem: cartItems[index],
                onQuantityChanged: onQuantityChanged,
                onRemove: onRemove,
              );
            },
          ),
        ),
      ],
    );
  }
}
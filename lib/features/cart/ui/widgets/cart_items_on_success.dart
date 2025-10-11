import 'package:flutter/widgets.dart';
import 'package:laza_ecommerce_app/features/cart/data/models/cart_products_model/cart_products_model.dart';
import 'package:laza_ecommerce_app/features/cart/ui/widgets/cart_items_list_view.dart';
import 'package:laza_ecommerce_app/features/cart/ui/widgets/empty_cart.dart';

class CartItemsOnSuccess extends StatefulWidget {
  final CartProductsModel cartProductsModel;

  const CartItemsOnSuccess({super.key, required this.cartProductsModel});

  @override
  State<CartItemsOnSuccess> createState() => _CartItemsOnSuccessState();
}

class _CartItemsOnSuccessState extends State<CartItemsOnSuccess> {
  // void _updateQuantity(String id, int newQuantity) {
  //   setState(() {
  //     final index = widget.cartProductsModel.cartItems?.indexWhere(
  //       (item) => item.productId == id,
  //     );
  //     if (index != -1 && newQuantity > 0) {
  //       widget.cartProductsModel.cartItems?[index!].quantity = newQuantity;
  //     }
  //   });
  // }

  void _removeItem(String id) {
    setState(() {
      widget.cartProductsModel.cartItems?.removeWhere(
        (item) => item.itemId == id,
      );
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
      onRemove: _removeItem,
      // onDecrement: () {
      //   setState(() {
      //     cartItems;
      //   });
      // },
      // onIncrement: () {},
    );
  }
}

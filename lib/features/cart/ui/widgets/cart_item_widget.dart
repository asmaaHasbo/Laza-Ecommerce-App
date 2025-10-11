import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_ecommerce_app/features/cart/data/models/cart_products_model/cart_item.dart';
import 'package:laza_ecommerce_app/features/cart/ui/widgets/add_and_minus_btns.dart';
import 'package:laza_ecommerce_app/features/cart/ui/widgets/delete_btn.dart';
import 'product_image_widget.dart';
import 'product_details_widget.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel cartItemModel;
  final Function(String, int) onQuantityChanged;
  final Function(String) onRemove;

  const CartItemWidget({
    super.key,
    required this.cartItemModel,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),

      child: Row(
        children: [
          //================= img =============
          ProductImageWidget(imageUrl: cartItemModel.productCoverUrl!),
          SizedBox(width: 12.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //================== info ================
              ProductDetailsWidget(cartItem: cartItemModel),
              SizedBox(height: 8.h),

              //================== add and minus =========
              Row(
                children: [
                  AddAndMinusBtns(
                    quantity: cartItemModel.quantity!,
                    onIncrement: () => onQuantityChanged(
                      cartItemModel.itemId!,
                      cartItemModel.quantity! + 1,
                    ),
                    onDecrement: () => onQuantityChanged(
                      cartItemModel.itemId!,
                      cartItemModel.quantity! - 1,
                    ),
                  ),
                  SizedBox(width: 50.h),
                  DeleteButton(onTap: () => onRemove(cartItemModel.itemId!)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

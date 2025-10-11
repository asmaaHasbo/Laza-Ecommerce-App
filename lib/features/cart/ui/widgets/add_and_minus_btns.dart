// widgets/quantity_control_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_ecommerce_app/core/themes/app_colors.dart';
import 'package:laza_ecommerce_app/core/themes/app_styles.dart';
import 'package:laza_ecommerce_app/features/cart/ui/widgets/quantity_button.dart';

class AddAndMinusBtns extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const AddAndMinusBtns({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuantityButton(icon: Icons.remove, onTap: onDecrement),
        SizedBox(width: 10.w),
        Text(
          quantity.toString(),
          style: AppTextStyles.font17W600white.copyWith(
            color: AppColors.mainColor,
          ),
        ),
        SizedBox(width: 10.w),
        QuantityButton(icon: Icons.add, onTap: onIncrement),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:laza_ecommerce_app/core/themes/app_colors.dart';
import 'package:laza_ecommerce_app/core/themes/app_styles.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  const AlreadyHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppTextStyles.font15W400lightGray,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Signin',
            style: AppTextStyles.font15W400lightGray.copyWith(
              color: AppColors.darkBlack,
            ),
          ),
        ),
      ],
    );
  }
}

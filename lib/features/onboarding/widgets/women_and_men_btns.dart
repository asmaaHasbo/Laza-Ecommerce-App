import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_ecommerce_app/core/shared/custom_elevated_btn.dart';
import 'package:laza_ecommerce_app/core/themes/app_colors.dart';
import 'package:laza_ecommerce_app/core/themes/app_styles.dart';

class WomenAndMenBtn extends StatelessWidget {
  const WomenAndMenBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // زر Men
        Expanded(
          child: CustomElevatedBtn(
            height: 60.h,
            backgroundColor: AppColors.lighterGray,
            btnName: 'Men',
            textStyle: AppTextStyles.font17W500lightGray.copyWith(
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(width: 16.w),

        // زر Women
        Expanded(
          child: CustomElevatedBtn(
            height: 60.h,
            backgroundColor: AppColors.mainColor,
            btnName: 'Women',
            textStyle: AppTextStyles.font17W500lightGray.copyWith(
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

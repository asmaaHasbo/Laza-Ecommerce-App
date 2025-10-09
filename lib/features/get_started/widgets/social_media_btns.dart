import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_ecommerce_app/core/shared/custom_elevated_btn.dart';
import 'package:laza_ecommerce_app/core/themes/app_colors.dart';
import 'package:laza_ecommerce_app/core/themes/app_styles.dart';

class SocialMediaBtns extends StatelessWidget {
  const SocialMediaBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedBtn(
              width: double.infinity,
              height: 50.h,
              backgroundColor: AppColors.blue,
              btnName: 'Facebook',
              raduis: 10.r,
              icon: Icons.facebook_sharp,
              textStyle: AppTextStyles.font17W600white,
              onPressed: () {},
            ),
            SizedBox(height: 10.h),

            CustomElevatedBtn(
              width: double.infinity,
              height: 50.h,
              backgroundColor: AppColors.ligtBlue,
              btnName: 'Twitter',
              raduis: 10,
              icon: Icons.ac_unit_sharp,
              textStyle: AppTextStyles.font17W600white,
              onPressed: () {},
            ),
            SizedBox(height: 10.h),
            CustomElevatedBtn(
              width: double.infinity,
              height: 50.h,
              backgroundColor: AppColors.orange,
              btnName: 'Google',
              raduis: 10.r,
              icon: Icons.g_mobiledata_rounded,
              textStyle: AppTextStyles.font17W600white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

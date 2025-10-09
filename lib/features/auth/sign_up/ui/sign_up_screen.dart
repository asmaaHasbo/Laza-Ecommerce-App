import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_ecommerce_app/core/themes/app_styles.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/ui/widgets/rememper_me_row.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/ui/widgets/sign_up_bloc_builder.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/ui/widgets/sign_up_btn.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/ui/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 80.h), // مساحة للـ button
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: AppTextStyles.font25W600darkBlack.copyWith(
                        fontSize: 28.sp,
                      ),
                    ),

                    SizedBox(height: 30.h),

                    SignUpForm(formKey: formKey),

                    RememperMeRow(),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),

            // الـ button ثابت تحت
            SignUpBtn(formKey: formKey),
            SignUpBlocListener(),
          ],
        ),
      ),
    );
  }
}

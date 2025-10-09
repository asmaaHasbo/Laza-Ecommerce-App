import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_ecommerce_app/features/auth/login/ui/widgets/login_bloc_listener.dart';
import 'package:laza_ecommerce_app/features/auth/login/ui/widgets/login_btn.dart';
import 'package:laza_ecommerce_app/features/auth/login/ui/widgets/login_form.dart';
import 'package:laza_ecommerce_app/features/auth/login/ui/widgets/term_and_condition.dart';
import 'package:laza_ecommerce_app/features/auth/login/ui/widgets/welcome_text.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/ui/widgets/rememper_me_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WelcomeText(),

                    SizedBox(height: 100.h),

                    LoginForm(),

                    RememperMeRow(),
                  ],
                ),
              ),
            ),

            TermAndCondition(),

            SizedBox(height: 30.h),

            LoginBtn(),

            LoginBlocListener(),
          ],
        ),
      ),
    );
  }
}

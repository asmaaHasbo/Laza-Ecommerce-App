import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_ecommerce_app/core/di/dependency_injection.dart';
import 'package:laza_ecommerce_app/core/routing/routes.dart';
import 'package:laza_ecommerce_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:laza_ecommerce_app/features/auth/login/ui/login_screen.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:laza_ecommerce_app/features/get_started/get_started_screen.dart';
import 'package:laza_ecommerce_app/features/home/logic/cubit/home_cubit.dart';
import 'package:laza_ecommerce_app/features/home/ui/main_screen.dart';
import 'package:laza_ecommerce_app/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.getStartedScreen:
        return MaterialPageRoute(builder: (_) => GetStartedScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpCubit(getIt()),
            child: SignUpScreen(),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: LoginScreen(),
          ),
        );

      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = HomeCubit(getIt());
              cubit.emitGetCategories(); // استدعاء emitGetCategories
              cubit.emitGetProducts(); // استدعاء emitGetProducts
              return cubit;
            },
            child: MainScreen(),
          ),
        );

      // case Routes.productDetailsScreen:
      // return MaterialPageRoute(builder: (_) => ProductDetailsScreen());

      default:
        // Unknown route
        return null;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:laza_ecommerce_app/core/networking/dio_factory.dart';
import 'package:laza_ecommerce_app/features/auth/login/data/api/login_service.dart';
import 'package:laza_ecommerce_app/features/auth/login/data/repo/login_repo.dart';
import 'package:laza_ecommerce_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/data/api/sign_up_service.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:laza_ecommerce_app/features/cart/data/api/cart_api_service.dart';
import 'package:laza_ecommerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:laza_ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:laza_ecommerce_app/features/home/data/api/home_api_service.dart';
import 'package:laza_ecommerce_app/features/home/data/repos/home_repo.dart';
import 'package:laza_ecommerce_app/features/home/logic/cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  // ============ login ===============
  getIt.registerLazySingleton<LoginService>(() => LoginService(dio));

  // registerLazySingleton => دي عشان يعمل اوبجكت واحد واستدعيه في كل التبيق
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  //---registerFactory => logincupit دي عشان يعمل اوبجكت جديد في كل مره استدعي فيها ال
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // api service  بتعود علي  signUpRepo اللي في القوسين بتوع ال  get it  ال
  //cupit وكذلك مع ال  api service  عاوزه  login repo conctructor  لان ال

  //==================== sign up ====================
  getIt.registerLazySingleton<SignUpServices>(() => SignUpServices(dio));
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  //=============== home ==================
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  //================= cart ===============
  getIt.registerLazySingleton<CartApiService>(() => CartApiService(dio));
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
}

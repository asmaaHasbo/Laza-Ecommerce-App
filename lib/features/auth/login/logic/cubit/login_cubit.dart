import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_ecommerce_app/core/helper/constant.dart';
import 'package:laza_ecommerce_app/core/helper/shared_preferences.dart';
import 'package:laza_ecommerce_app/core/networking/api_result.dart';
import 'package:laza_ecommerce_app/features/auth/login/data/models/login_resquest_model.dart';
import 'package:laza_ecommerce_app/features/auth/login/data/repo/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  emitLoginState() async {
    log('LOADING');
    emit(LoginLoading());
    final result = await loginRepo.loginRepoFunction(
      LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    result.when(
      success: (data) async {
        log('LoginSuccess state');
        await saveUserToken(userToken: data.accessToken ?? '');
        emit(LoginSuccess(data));
      },
      failure: (e) {
        log('LoginFailure state with error: $e');
        emit(LoginFailure(errMsg: e));
      },
    );
  }

  saveUserToken({required String userToken}) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, userToken);
  }
}

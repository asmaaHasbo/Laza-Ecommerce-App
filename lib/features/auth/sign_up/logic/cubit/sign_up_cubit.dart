import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_ecommerce_app/core/networking/api_result.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/data/models/sign_up_request_model.dart';
import 'package:laza_ecommerce_app/features/auth/sign_up/data/repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpRepo signUpRepo;
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  emitSignUpState() async {
    log('LOADING');
    emit(SignUpLoading());
    final result = await signUpRepo.signUpRepoFunction(
      SignUpRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    result.when(
      success: (data) {
        log('SignUpSuccess state');

        emit(SignUpSuccess(data));
      },
      failure: (e) {
        log('SignUpFailure state with error: $e');
        emit(SignUpFailure(errMsg: e));
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/core/DI/dependency_injection.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  void signup() async {
    emit(SignupLoadingState());
    try {
      await getIt<FirebaseHelper>()
          .signUpUser(email.text.trim(), password.text.trim());
      emit(SignupSuccessState());
    } catch (e) {
      emit(SignupFailureState(errMessage: e.toString()));
    }
  }
}

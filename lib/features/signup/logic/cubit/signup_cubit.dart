import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final FirebaseHelper firebaseHelper;
  SignupCubit(this.firebaseHelper) : super(SignupInitial());

   TextEditingController name  = TextEditingController();
   TextEditingController email = TextEditingController();
   TextEditingController password = TextEditingController();
   TextEditingController rePassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  void signup() async {
    emit(SignupLoadingState());
    try {
      await firebaseHelper.signUpUser(email.text.trim(), password.text.trim());
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailureState());
    }
  }
}

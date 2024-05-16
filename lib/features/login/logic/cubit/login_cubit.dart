import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseHelper firebaseHelper;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginCubit(this.firebaseHelper) : super(LoginInitial());

  login() async {
    emit(LoginLoadingState());

    try {
      await firebaseHelper
          .loginUser(
              emailController.text.trim(), passwordController.text.trim())
          .then((value) {
        emit(LoginSuccessState());
      });
    } catch (e) {
      emit(LoginFailureState());
    }
  }
}

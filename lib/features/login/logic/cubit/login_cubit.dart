import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:mahfazty/core/DI/dependency_injection.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginCubit() : super(LoginInitial());

  login() async {
    emit(LoginLoadingState());

    try {
      await getIt<FirebaseHelper>()
          .loginUser(
              emailController.text.trim(), passwordController.text.trim())
          .then((value) {
        emit(LoginSuccessState());
      });
    } catch (e) {
      emit(LoginFailureState(errMessage:  e.toString()));
    }
  }
}

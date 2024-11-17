import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/app_colors.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/features/login/ui/widgets/build_bloc_listener.dart';
import 'package:mahfazty/features/login/ui/widgets/email_password.dart';
import '../../../../core/widgets/my_button.dart';
import '../../logic/cubit/login_cubit.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/terms_and_continuing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.blackColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(150),
              EmailAndPassword(),
              verticalSpace(20),
              MyButton(
                onPressed: () {
                  validateThenLogin();
                },
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.0, 1.0],
                    colors: [ColorsApp.orangeColor, ColorsApp.yellowColor]),
                child: Text("Login", style: FontHelper.font18BoldWhite),
              ),
              verticalSpace(20),
              TermsAndContinuing(),
              verticalSpace(20),
              DontHaveAnAccount(),
              BuildBlocListener(),
            ],
          ),
        ),
      )),
    );
  }

  validateThenLogin() {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}

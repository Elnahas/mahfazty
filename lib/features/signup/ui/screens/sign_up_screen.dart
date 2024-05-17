import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/app_colors.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/core/widgets/my_button.dart';
import 'package:mahfazty/features/signup/logic/cubit/signup_cubit.dart';

import '../widgets/build_bloc_listener_signup.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(150),
                const SignUpForm(),
                verticalSpace(20),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "By continuing, you agree to our Terms \n of Use and Privacy Policy",
                      style: FontHelper.font13WhiteW300,
                      textAlign: TextAlign.center,
                    )),
                verticalSpace(20),
                MyButton(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0],
                        colors: [ColorsApp.orangeColor, ColorsApp.yellowColor]),
                    onPressed: () {
                      if(context.read<SignupCubit>().formKey.currentState!.validate()){
                        context.read<SignupCubit>().signup();
                      }
                    },
                    child: Text("Sign Up", style: FontHelper.font18BoldWhite)),
                   const BuildBlocListenerSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
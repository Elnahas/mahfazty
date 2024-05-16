import 'package:flutter/material.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/app_colors.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/core/widgets/my_text_from_field.dart';
import '../../../../core/widgets/my_button.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/terms_and_continuing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

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
              Text(
                "Welcome Back!",
                style: FontHelper.font28SemiBoldWhite,
              ),
              verticalSpace(20),
              Text(
                "Email",
                style: FontHelper.font18BoldWhite,
              ),
              verticalSpace(10),
              const MyTextFormField(
                hintText: "Enter your email",
              ),
              verticalSpace(20),
              Text(
                "Password",
                style: FontHelper.font18BoldWhite,
              ),
              verticalSpace(10),
              MyTextFormField(
                hintText: "Enter your password",
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility)),
                obscureText: obscureText,
              ),
              verticalSpace(20),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: FontHelper.font18BoldWhite,
                  )),
              verticalSpace(20),
              MyButton(
                onPressed: () {},
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
              DontHaveAnAccount()
            ],
          ),
        ),
      )),
    );
  }
}

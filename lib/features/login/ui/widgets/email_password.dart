import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/widgets/my_text_from_field.dart';
import '../../logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({
    super.key,
  });

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool obscureText = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,

        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        MyTextFormField(
          hintText: "Enter your email",
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your email";
            }
          },
        ),
        verticalSpace(20),
        Text(
          "Password",
          style: FontHelper.font18BoldWhite,
        ),
        verticalSpace(10),
        MyTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your password";
            }
          },
          hintText: "Enter your password",
          controller: passwordController,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon:
                  Icon(obscureText ? Icons.visibility_off : Icons.visibility)),
          obscureText: obscureText,
        ),
        verticalSpace(20),
        Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot Password?",
              style: FontHelper.font18BoldWhite,
            )),
      ],
    ));
  }
}
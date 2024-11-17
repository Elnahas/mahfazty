import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/widgets/my_text_from_field.dart';
import '../../logic/cubit/signup_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

late TextEditingController emailController;
late TextEditingController nameController;
late TextEditingController passwordController;
late TextEditingController rePasswordController; 

  bool obscureTextPassword = true;
  bool obscureTextRePassword = true;


  @override
  void initState() {
    emailController = context.read<SignupCubit>().email;
    nameController = context.read<SignupCubit>().name;
    passwordController = context.read<SignupCubit>().password;
    rePasswordController = context.read<SignupCubit>().rePassword;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome To Mahfazty!",
            style: FontHelper.font28SemiBoldWhite,
          ),
          verticalSpace(30),
          Text(
            "Name",
            style: FontHelper.font18BoldWhite,
          ),
          verticalSpace(10),
          MyTextFormField(
            hintText: "Enter your name",
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
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
              return null;
            },
          ),
          verticalSpace(20),
          Text(
            "Password",
            style: FontHelper.font18BoldWhite,
          ),
          verticalSpace(10),
          MyTextFormField(
            hintText: "Enter your password",
            controller: passwordController,
            obscureText: obscureTextPassword,
            validator: (value) {
              if(value == null || value.isEmpty){
                return "Please enter your password";
              }
              return null;
            },
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureTextPassword = !obscureTextPassword;
                  });
                },
                icon: Icon(obscureTextPassword
                    ? Icons.visibility
                    : Icons.visibility_off)),
          ),
          verticalSpace(20),
          Text(
            "Password Confirmation",
            style: FontHelper.font18BoldWhite,
          ),
          verticalSpace(10),
          MyTextFormField(
              hintText: "Re-enter your password",
              controller: rePasswordController,
              obscureText: obscureTextRePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please re-enter your password";
                } else if(value != passwordController.text){
                  return "Password doesn't match";
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureTextRePassword = !obscureTextRePassword;
                  });
                },
                icon: Icon(obscureTextRePassword
                    ? Icons.visibility
                    : Icons.visibility_off),
              )),
        ],
      ),
    );
  }
}

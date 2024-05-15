import 'package:flutter/material.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/app_colors.dart';
import 'package:mahfazty/core/theming/fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.blackColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            verticalSpace(150),
            Text(
              "Welcome Back!",
              style: FontHelper.font28SemiBoldWhite,
            ) , 
            verticalSpace(20),
            Text("Email" , style: FontHelper.font18BoldWhite,),
            verticalSpace(10),
            TextFormField(
              
            )
                    ],
                  ),
          )),
    );
  }
}

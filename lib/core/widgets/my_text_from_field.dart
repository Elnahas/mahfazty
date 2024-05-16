import 'package:flutter/material.dart';
import 'package:mahfazty/core/theming/app_colors.dart';
import 'package:mahfazty/core/theming/fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  const MyTextFormField({super.key, required this.hintText, this.suffixIcon,  this.obscureText = false});
  

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
              style: FontHelper.font18GreyW300,
              obscureText: obscureText,
              decoration: InputDecoration(
                suffixIcon: suffixIcon ,
                hintText: hintText,
                hintStyle: FontHelper.font18GreyW300,
                filled: true,
                fillColor: ColorsApp.greyColor,
                focusColor: Colors.white,
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),

                )
              ),
              
            );
  }
}
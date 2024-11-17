import 'package:flutter/material.dart';
import 'package:mahfazty/core/theming/app_colors.dart';
import 'package:mahfazty/core/theming/fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool obscureText;
  final bool readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;

  const MyTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      this.controller,
      this.validator,
      this.prefixIcon,
      this.readOnly = false,
      this.onTap,
      this.fillColor = ColorsApp.greyColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      validator: validator,
      controller: controller,
      style: FontHelper.font18GreyW300,
      obscureText: obscureText,
      decoration: InputDecoration(
          isDense: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: FontHelper.font18GreyW300,
          filled: true,
          fillColor: fillColor,
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );
  }
}

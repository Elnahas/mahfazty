import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/core/theming/fonts.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Dont have an account? ",
          style: FontHelper.font13WhiteW300,
          children: [
            TextSpan(
                text: "Sign up",
                style: FontHelper.font14BlueW300,
                recognizer: TapGestureRecognizer()..onTap = () {})
          ],
        ),
      ),
    );
  }
}

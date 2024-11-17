import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

class MyButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final void Function()? onPressed;

  const MyButton({
    super.key,
    required this.child,
    this.gradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        colors: [ColorsApp.orangeColor, ColorsApp.yellowColor]),
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60.0,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

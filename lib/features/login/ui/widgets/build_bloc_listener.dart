import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/features/login/logic/cubit/login_cubit.dart';

class BuildBlocListener extends StatelessWidget {
  const BuildBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSuccessState ||
          current is LoginLoadingState ||
          current is LoginFailureState,
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          Navigator.pop(context);
          await Navigator.pushReplacementNamed(context, Routes.home).then(
            (value) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Logged in successfully"),
                backgroundColor: Colors.green,
              ));
            },
          );
        } else if (state is LoginFailureState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Wrong email or password"),
            backgroundColor: Colors.red,
          ));
        } else if (state is LoginLoadingState) {
          showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

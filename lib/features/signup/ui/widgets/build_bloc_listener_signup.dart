import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/features/signup/logic/cubit/signup_cubit.dart';

class BuildBlocListenerSignUp extends StatelessWidget {
  const BuildBlocListenerSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) {
        return current is SignupSuccessState ||
            current is SignupFailureState ||
            current is SignupLoadingState;
      },
      listener: (context, state) {
        if (state is SignupSuccessState) {
          Navigator.of(context).pop();
        } else if (state is SignupFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Signup Failed"),
            backgroundColor: Colors.red,
          ));
        } else if (state is SignupLoadingState) {
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

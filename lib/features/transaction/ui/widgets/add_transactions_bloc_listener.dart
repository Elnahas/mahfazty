import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/features/transaction/logic/cubit/transaction_cubit.dart';

class AddTransactionsBlocListener extends StatelessWidget {
  const AddTransactionsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionCubit, TransactionState>(
      listenWhen: (previous, current) =>
          current is TransactionSuccessState ||
          current is TransactionLoadingState ||
          current is TransactionDateChangedState ||
          current is TransactionFailureState,
      listener: (context, state) async {
        if (state is TransactionSuccessState) {
          Navigator.pop(context);

          await Navigator.pushReplacementNamed(context, Routes.home);

        } else if (state is TransactionFailureState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
            backgroundColor: Colors.red,
          ));
        } else if (state is TransactionLoadingState) {
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

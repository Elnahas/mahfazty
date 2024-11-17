import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/app_colors.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/core/widgets/my_button.dart';
import 'package:mahfazty/features/transaction/ui/widgets/add_transactions_form.dart';
import '../../logic/cubit/transaction_cubit.dart';
import '../widgets/add_transactions_bloc_listener.dart';

class AddTransactionsScreen extends StatelessWidget {
  const AddTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorsApp.navBarColor,
      appBar: AppBar(
        title: Text(
          "Add Transaction",
          style: FontHelper.font18BoldWhite,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            verticalSpace(20),
            const AddTransactionsForm(),
            verticalSpace(20),
            MyButton(
                child: Text("Save", style: FontHelper.font18BoldWhite),
                onPressed: () {
                  context.read<TransactionCubit>().addTransaction();
                }),
                const AddTransactionsBlocListener()
          ],
        ),
      ),
    );

    
  }

  
}



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/my_text_from_field.dart';
import '../../logic/cubit/transaction_cubit.dart';

class AddTransactionsForm extends StatefulWidget {
  const AddTransactionsForm({super.key});

  @override
  State<AddTransactionsForm> createState() => _AddTransactionsFormState();
}

class _AddTransactionsFormState extends State<AddTransactionsForm> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController dateController;

  @override
  void initState() {
    nameController = context.read<TransactionCubit>().nameController;
    priceController = context.read<TransactionCubit>().priceController;
    dateController = context.read<TransactionCubit>().dateController;

    dateController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextFormField(
          controller: nameController,
          hintText: "Name",
          prefixIcon: Icon(
            Icons.abc,
            color: Colors.white,
          ),
        ),
        verticalSpace(20),
        MyTextFormField(
            controller: priceController,
            hintText: "Price",
            prefixIcon: Icon(Icons.price_change, color: Colors.white)),
        verticalSpace(20),
        MyTextFormField(
            controller: dateController,
            onTap: () =>
                context.read<TransactionCubit>().myShowDatePicker(context),
            hintText: context.read<TransactionCubit>().selectedDate == null
                ? context.read<TransactionCubit>().selectedDate.toString()
                : "Date",
            readOnly: true,
            prefixIcon: Icon(Icons.date_range, color: Colors.white)),
      ],
    );
  }
}

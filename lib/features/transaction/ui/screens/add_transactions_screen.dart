import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
import 'package:mahfazty/core/theming/app_colors.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/core/widgets/my_button.dart';
import 'package:mahfazty/core/widgets/my_text_from_field.dart';

import '../../data/transaction_model.dart';

class AddTransactionsScreen extends StatefulWidget {
  const AddTransactionsScreen({super.key});

  @override
  State<AddTransactionsScreen> createState() => _AddTransactionsScreenState();
}

class _AddTransactionsScreenState extends State<AddTransactionsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate!);
      });
    }
  }

  @override
  void initState() {
    dateController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    super.initState();
  }

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
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            verticalSpace(20),
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
                onTap: () => _selectDate(context),
                hintText:
                    selectedDate == null ? selectedDate.toString() : "Date",
                readOnly: true,
                prefixIcon: Icon(Icons.date_range, color: Colors.white)),
            verticalSpace(20),
            MyButton(
                child: Text("Save", style: FontHelper.font18BoldWhite),
                onPressed: () {
                  FirebaseHelper().addTransaction(TransactionModel(
                      id: FirebaseHelper().getCurrentUser()!.uid,
                      name: nameController.text,
                      price: priceController.text,
                      date: dateController.text));
                })
          ],
        ),
      ),
    );
  }
}

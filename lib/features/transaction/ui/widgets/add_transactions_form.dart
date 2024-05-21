import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:mahfazty/core/theming/app_colors.dart';
import 'package:mahfazty/core/widgets/my_button.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/fonts.dart';
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
            controller: priceController,
            hintText: "Price",
            prefixIcon: Icon(Icons.price_change, color: Colors.white)),
        verticalSpace(20),
        MyTextFormField(
          controller: nameController,
          hintText: "Category",
          prefixIcon: Icon(
            Icons.abc,
            color: Colors.white,
          ),
          readOnly: true,
          suffixIcon: IconButton(
              onPressed: () {

                
                List<String> myCategoriesIcons = [
                  'entertainment',
                  'food',
                  'home',
                  'pet',
                  'shopping',
                  'tech',
                  'travel'
                ];

                bool isExpended = false;
                String iconSelected = '';
                Color categoryColor = Colors.white;

                showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                          backgroundColor: ColorsApp.navyColor,
                          title: Text("Create a Category",
                              style: FontHelper.font28SemiBoldWhite),
                          content: SingleChildScrollView(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  const MyTextFormField(
                                      hintText: "Name",
                                      prefixIcon: Icon(Icons.price_change,
                                          color: Colors.white)),
                                  verticalSpace(20),
                                  MyTextFormField(
                                    readOnly: true,
                                    hintText: "Icon",
                                    prefixIcon: Icon(Icons.price_change,
                                        color: Colors.white),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isExpended = !isExpended;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        )),
                                  ),
                                  isExpended
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.all(20),
                                          height: 200,
                                          decoration: const BoxDecoration(
                                              color: ColorsApp.greyColor,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(12))),
                                          child: GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 5,
                                                      crossAxisSpacing: 5),
                                              itemCount:
                                                  myCategoriesIcons.length,
                                              itemBuilder: (context, int i) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      iconSelected =
                                                          myCategoriesIcons[i];
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    margin: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            width: 3,
                                                            color: iconSelected ==
                                                                    myCategoriesIcons[
                                                                        i]
                                                                ? Colors.green
                                                                : Colors.grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/${myCategoriesIcons[i]}.png'),
                                                        )),
                                                  ),
                                                );
                                              }))
                                      : Container(),
                                  verticalSpace(20),
                                  MyTextFormField(
                                      readOnly: true,
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ColorPicker(
                                                      pickerColor:
                                                          categoryColor,
                                                      onColorChanged: (value) {
                                                        setState(() {
                                                          categoryColor = value;
                                                        });
                                                      },
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      height: 50,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          style: TextButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors.black,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12))),
                                                          child: const Text(
                                                            'Save Color',
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      hintText: "Color",
                                      prefixIcon: Icon(Icons.price_change,
                                          color: Colors.white) , fillColor: categoryColor,),
                                  verticalSpace(40),
                                  MyButton(
                                      child: Text("Save",
                                          style: FontHelper.font18BoldWhite),
                                      onPressed: () {})
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    });
              },
              icon: Icon(Icons.add),
              color: Colors.white),
        ),
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

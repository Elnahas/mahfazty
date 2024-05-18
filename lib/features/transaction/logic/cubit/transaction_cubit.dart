import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mahfazty/core/DI/dependency_injection.dart';
import 'package:mahfazty/features/transaction/data/transaction_model.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/firebase_helper.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime? selectedDate;
  Future<void> myShowDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)));

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate!);

      emit(TransactionDateChangedState());
    }
  }

  Future addTransaction() async {
    emit(TransactionLoadingState());

    await getIt<FirebaseHelper>()
        .addTransaction(TransactionModel(
            id: getIt<FirebaseHelper>().getCurrentUser()!.uid,
            name: nameController.text,
            price: priceController.text,
            date: dateController.text))
        .then((value) {
      emit(TransactionSuccessState());
    }).catchError((onError) {
      emit(TransactionFailureState(errMessage: onError.toString()));
    });
  }
}

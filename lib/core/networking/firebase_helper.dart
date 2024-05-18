import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/core/utils/app_constants.dart';

import '../../features/transaction/data/transaction_model.dart';

class FirebaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firesore = FirebaseFirestore.instance;

  Future loginUser(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future signUpUser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future signOut() async {
    await auth.signOut();
  }

  User? getCurrentUser() {
    return auth.currentUser;
  }

  Future addTransaction(TransactionModel transactionModel) async {

    try
    {
    await firesore
        .collection(ConstantsApp.TRANSACTIONS_COLLECTION)
        .doc(transactionModel.id)
        .collection(ConstantsApp.TRANSACTIONS_COLLECTION)
        .add(transactionModel.toJson());
    }
    catch(e){
      debugPrint("Errrrrrrrrrrrrro : " + e.toString());
    }

  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/firebase_options.dart';
import 'package:mahfazty/my_app.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

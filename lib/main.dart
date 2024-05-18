import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/DI/dependency_injection.dart';
import 'package:mahfazty/core/helpers/my_bloc_observer.dart';
import 'package:mahfazty/core/routing/routing.dart';
import 'package:mahfazty/firebase_options.dart';
import 'package:mahfazty/my_app.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();

  runApp(MyApp(
    routing: Routing(),
  ));
}

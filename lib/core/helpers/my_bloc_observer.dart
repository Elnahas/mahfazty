import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver implements BlocObserver {

  @override
  void onClose(BlocBase bloc) {
    debugPrint("${bloc}");
  }
  
  @override
  void onCreate(BlocBase bloc) {
    debugPrint("${bloc}");
  }
  
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("${bloc} + $error");
  }
  
  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }
  
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("${bloc} + $change");
  }
  
  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("${bloc}");
  }

}
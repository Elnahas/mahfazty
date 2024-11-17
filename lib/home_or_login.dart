import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/features/home/ui/screens/home_screen.dart';
import 'package:mahfazty/features/login/ui/screens/login_screen.dart';

class HomeOrLogin extends StatelessWidget {
  const HomeOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return const LoginScreen();
            
          }else{
            return const HomeScreen();
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

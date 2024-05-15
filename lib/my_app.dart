import 'package:flutter/material.dart';
import 'package:mahfazty/features/login/ui/screens/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        return ScreenUtilInit(
          designSize: Size(390, 844),
          minTextAdapt: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
                title: 'Mahfazty',
                theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
                ),
                home: const LoginScreen(),
              ),
        );
  }
}
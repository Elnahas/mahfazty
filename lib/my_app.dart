import 'package:flutter/material.dart';
import 'package:mahfazty/features/login/ui/screens/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/routes.dart';
import 'core/routing/routing.dart';

class MyApp extends StatelessWidget {
  final Routing routing ;
  const MyApp({super.key, required this.routing});

  @override
  Widget build(BuildContext context) {
        return ScreenUtilInit(
          designSize: Size(390, 844),
          minTextAdapt: true,
          child: MaterialApp(
            initialRoute: Routes.login,
            onGenerateRoute: routing.generateRoute,
            debugShowCheckedModeBanner: false,
                title: 'Mahfazty',
                theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
                ),
              ),
        );
  }
}
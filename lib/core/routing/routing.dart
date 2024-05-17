import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/features/home/ui/screens/home_screen.dart';
import 'package:mahfazty/features/signup/logic/cubit/signup_cubit.dart';
import 'package:mahfazty/features/signup/ui/screens/sign_up_screen.dart';

import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/login/ui/screens/login_screen.dart';

class Routing {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(FirebaseHelper()),
                  child: LoginScreen(),
                ));
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignupCubit(FirebaseHelper()),
            child: SignUpScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            "No route defined for ${ModalRoute.of(context)!.settings.name}"),
      ),
    );
  }
}

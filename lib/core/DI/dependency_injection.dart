import 'package:get_it/get_it.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
import 'package:mahfazty/features/login/logic/cubit/login_cubit.dart';
import 'package:mahfazty/features/signup/logic/cubit/signup_cubit.dart';
import 'package:mahfazty/features/transaction/logic/cubit/transaction_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  var firebase_helper = FirebaseHelper();

  getIt.registerSingleton<FirebaseHelper>(FirebaseHelper());
  getIt.registerSingleton<LoginCubit>(LoginCubit());
  getIt.registerSingleton<SignupCubit>(SignupCubit());
  getIt.registerFactory<TransactionCubit>(() => TransactionCubit());
}

part of 'login_cubit.dart';


abstract class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginSuccessState extends LoginState {}
final class LoginFailureState extends LoginState {

final String errMessage;

  LoginFailureState({required this.errMessage});
}

part of 'transaction_cubit.dart';

@immutable
sealed class TransactionState {}

final class TransactionInitial extends TransactionState {}

final class TransactionLoadingState extends TransactionState {}

final class TransactionSuccessState extends TransactionState {}
final class TransactionDateChangedState extends TransactionState {}

final class TransactionFailureState extends TransactionState {
  final String errMessage;

  TransactionFailureState({required this.errMessage});
}

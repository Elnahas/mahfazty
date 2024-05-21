part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryToggleExpandedState extends CategoryState {
  final bool isExpanded;

  CategoryToggleExpandedState({required this.isExpanded});
}
final class CategorySelectIconState extends CategoryState {
   final String iconSelected;

  CategorySelectIconState({required this.iconSelected});
}
final class CategorySelectColorState extends CategoryState {
  final Color categoryColor;

  CategorySelectColorState({required this.categoryColor});
}

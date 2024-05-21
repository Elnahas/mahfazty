import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  late bool isExpanded;
  late String iconSelected;
  late Color categoryColor;

  final List<String> myCategoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];

  CategoryCubit() : super(CategoryInitial());

  void toggleExpanded() {
    emit(CategoryToggleExpandedState(isExpanded: !isExpanded));
  }

  void selectIcon(String icon) {
    emit(CategorySelectIconState(iconSelected: iconSelected));
  }

  void selectColor(Color color) {
    emit(CategorySelectColorState(categoryColor: categoryColor));
  }
}

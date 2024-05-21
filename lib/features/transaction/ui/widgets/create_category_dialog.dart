import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/features/transaction/logic/cubit/category/category_cubit.dart';
import 'package:mahfazty/features/transaction/ui/widgets/show_color_picker_dialog.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/my_text_from_field.dart';


Future<String?> createCategoryDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return BlocProvider<CategoryCubit>(
        create: (context) => CategoryCubit(),
        child: CreateCategoryDialog(),
      );
    },
  );
}

class CreateCategoryDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      title: Text("Create a Category",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const MyTextFormField(
                hintText: "Name",
                prefixIcon: Icon(Icons.price_change, color: Colors.white),
              ),
              verticalSpace(20),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      MyTextFormField(
                        readOnly: true,
                        hintText: "Icon",
                        prefixIcon: Icon(Icons.price_change, color: Colors.white),
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<CategoryCubit>().toggleExpanded();
                          },
                          icon: Icon(
                            context.read()<CategoryCubit>().isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      context.read()<CategoryCubit>().isExpanded
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(20),
                              height: 200,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                              ),
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                ),
                                itemCount: 6, // Replace with your actual icons count
                                itemBuilder: (context, int i) {
                                  // Replace with your actual icon fetching logic
                                  String iconName = 'icon_$i';
                                  return GestureDetector(
                                    onTap: () {
                                      context.read<CategoryCubit>().selectIcon(iconName);
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 3,
                                          color: context.read()<CategoryCubit>().iconSelected == iconName ? Colors.green : Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        // Replace with your actual icon fetching logic
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/$iconName.png'),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(),
                    ],
                  );
                },
              ),
              verticalSpace(20),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  return MyTextFormField(
                    readOnly: true,
                    onTap: () async {
                      Color? pickedColor = await showColorPickerDialog(context);
                      if (pickedColor != null) {
                        context.read<CategoryCubit>().selectColor(pickedColor);
                      }
                    },
                    hintText: "Color",
                    prefixIcon: Icon(Icons.price_change, color: Colors.white),
                    fillColor: context.read()<CategoryCubit>().categoryColor,
                  );
                },
              ),
              verticalSpace(40),
              MyButton(
                child: Text("Save", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.pop(context, context.read<CategoryCubit>().iconSelected);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Future<String?> createCategoryDialog(BuildContext context) {
//   bool isExpended = false;
//   String iconSelected = '';
//   Color categoryColor = Colors.white;

//   return showDialog<String>(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setState) {
//           return BlocProvider(
//             create: (context) => CategoryCubit(),
//             child: AlertDialog(
//               backgroundColor: ColorsApp.navyColor,
//               title: Text("Create a Category",
//                   style: FontHelper.font28SemiBoldWhite),
//               content: SingleChildScrollView(
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   child: Column(
//                     children: [
//                       const MyTextFormField(
//                           hintText: "Name",
//                           prefixIcon:
//                               Icon(Icons.price_change, color: Colors.white)),
//                       verticalSpace(20),
//                       MyTextFormField(
//                         readOnly: true,
//                         hintText: "Icon",
//                         prefixIcon:
//                             Icon(Icons.price_change, color: Colors.white),
//                         suffixIcon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 isExpended = !isExpended;
//                               });
//                             },
//                             icon: Icon(
//                               Icons.arrow_drop_down,
//                               color: Colors.white,
//                             )),
//                       ),
//                       isExpended
//                           ? Container(
//                               width: MediaQuery.of(context).size.width,
//                               padding: EdgeInsets.all(20),
//                               height: 200,
//                               decoration: const BoxDecoration(
//                                   color: ColorsApp.greyColor,
//                                   borderRadius: BorderRadius.vertical(
//                                       bottom: Radius.circular(12))),
//                               child: GridView.builder(
//                                   gridDelegate:
//                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 3,
//                                           mainAxisSpacing: 5,
//                                           crossAxisSpacing: 5),
//                                   itemCount: context.read()<CategoryCubit>().myCategoriesIcons.length,
//                                   itemBuilder: (context, int i) {
//                                     return GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           iconSelected = context.read()<CategoryCubit>().myCategoriesIcons[i];
//                                         });
//                                       },
//                                       child: Container(
//                                         width: 50,
//                                         height: 50,
//                                         margin: EdgeInsets.all(4),
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             border: Border.all(
//                                                 width: 3,
//                                                 color: iconSelected ==
//                                                         context.read()<CategoryCubit>().myCategoriesIcons[i]
//                                                     ? Colors.green
//                                                     : Colors.grey),
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   'assets/images/${context.read()<CategoryCubit>().myCategoriesIcons[i]}.png'),
//                                             )),
//                                       ),
//                                     );
//                                   }))
//                           : Container(),
//                       verticalSpace(20),
//                       MyTextFormField(
//                         readOnly: true,
//                         onTap: () async {
//                           Color? pickedColor =
//                               await showColorPickerDialog(context);

//                           if (pickedColor != null) {
//                             setState(() {
//                               categoryColor = pickedColor;
//                             });
//                           }
//                         },
//                         hintText: "Color",
//                         prefixIcon:
//                             Icon(Icons.price_change, color: Colors.white),
//                         fillColor: categoryColor,
//                       ),
//                       verticalSpace(40),
//                       MyButton(
//                           child:
//                               Text("Save", style: FontHelper.font18BoldWhite),
//                           onPressed: () {
//                             Navigator.pop(context, iconSelected);
//                           })
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//       });
// }

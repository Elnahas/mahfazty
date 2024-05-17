
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/theming/app_colors.dart';

import '../../../../core/theming/fonts.dart';

class TransactionsItem extends StatelessWidget {
  const TransactionsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: ColorsApp.navBarColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
         mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListTile(
              title: Text("Today", style: FontHelper.font18BoldWhite),
              subtitle:
                  Text("March 6 , 2024", style: FontHelper.font13GreyW300),
              trailing: Text("10.00 LE", style: FontHelper.font18BoldWhite),
            ),
          ),
          Container(
            height: 85.h,
            width: 15.w,
            decoration: const BoxDecoration(
                color: ColorsApp.orangeColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
          )
        ],
      ),
    );
  }
}

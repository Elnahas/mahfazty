import 'package:flutter/material.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/features/home/ui/widgets/transactions_Item.dart';

import '../../../../core/theming/fonts.dart';

class TransactionsSection extends StatelessWidget {
  const TransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Transactions",
              style: FontHelper.font18BoldWhite,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.addTransaction);
                },
                icon: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                ))
          ],
        ),
        verticalSpace(20),
        ListView.separated(
            itemBuilder: (context, index) {
              return const TransactionsItem();
            },
            itemCount: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return verticalSpace(20);
            }),
      ],
    );
  }
}

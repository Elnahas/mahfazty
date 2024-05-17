import 'package:flutter/material.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/features/home/ui/widgets/transactions_Item.dart';

import '../../../../core/theming/fonts.dart';

class LatestTransactionsSection extends StatelessWidget {
  const LatestTransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Latest Transactions",
              style: FontHelper.font18BoldWhite,
            )),
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

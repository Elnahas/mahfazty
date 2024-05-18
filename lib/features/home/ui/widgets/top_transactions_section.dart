import 'package:flutter/material.dart';
import 'package:mahfazty/features/home/ui/widgets/percents_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/fonts.dart';

class TopTransactionsSection extends StatelessWidget {
  const TopTransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Top Transactions",
              style: FontHelper.font18BoldWhite,
            )),
        verticalSpace(20),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          PercentsWidget(
            centerText: "100",
            footerText: "Bills",
            percent: 1,
            progressColor: Colors.green,
          ),
          PercentsWidget(
            centerText: "25",
            footerText: "Internet",
            percent: 0.25,
            progressColor: Colors.yellow,
          ),
          PercentsWidget(
            centerText: "70",
            footerText: "Bills",
            percent: 0.7,
            progressColor: Colors.blue,
          ),
        ])
      ],
    );
  }
}

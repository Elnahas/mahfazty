import 'package:flutter/material.dart';
import 'package:mahfazty/features/home/ui/widgets/balance_widget.dart';
import 'package:mahfazty/features/home/ui/widgets/latest_transactions_section.dart';
import 'package:mahfazty/features/home/ui/widgets/my_app_bar.dart';
import 'package:mahfazty/features/home/ui/widgets/top_transactions_section.dart';

import '../../../../core/helpers/spacing.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                verticalSpace(10),
                const MyAppBar(),
                verticalSpace(20),
                const BalanceWidget(),
                verticalSpace(20),
                const TopTransactionsSection(),
                verticalSpace(20),
                const LatestTransactionsSection(),
         
              ],
            ),
          ),
        ),
      ),
    );
  }
}

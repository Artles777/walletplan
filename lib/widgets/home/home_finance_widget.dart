import "package:flutter/material.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/widgets/home/card/card_list_widget.dart";
import "package:walletplan/widgets/home/finance/finance_buttons_widget.dart";

class HomeFinanceWidget extends StatelessWidget {
  const HomeFinanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CardListWidget(),
        Divider(
          height: 1,
          indent: 16,
          endIndent: 16,
          color: SecondaryColors.secondary90,
        ),
        FinanceButtonsWidget(),
      ],
    );
  }
}

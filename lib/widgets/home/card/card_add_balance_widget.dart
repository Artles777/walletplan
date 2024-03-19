import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/helpers/variables/sizes.dart";
import "package:walletplan/store/home.dart";
import "package:walletplan/store/home/home_cards.dart";

class CardAddBalanceWidget extends StatelessWidget {
  const CardAddBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);
    final HomeCardsState cardsState = state.cards;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 80,
        child: Align(
          alignment: Alignment.centerLeft,
          child: DottedBorder(
            radius: const Radius.circular(4.0),
            borderPadding: const EdgeInsets.all(1),
            borderType: BorderType.RRect,
            color: PrimaryColors.primary30,
            strokeWidth: 1,
            child: IconButton(
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                backgroundColor: PrimaryColors.primary95,
                minimumSize: const Size.fromWidth(120),
              ),
              onPressed: () => cardsState.navigateNewCardAddScreen(context),
              icon: const Icon(
                Icons.add,
                color: PrimaryColors.primary30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

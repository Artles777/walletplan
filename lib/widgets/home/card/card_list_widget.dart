import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";
import "package:walletplan/store/home.dart";
import "package:walletplan/store/home/home_cards.dart";
import "package:walletplan/widgets/home/card/card_add_balance_widget.dart";
import "package:walletplan/widgets/home/card/card_balance_widget.dart";

class CardListWidget extends StatelessWidget {
  const CardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);
    final HomeCardsState cards = state.cards;

    return Column(
      children: [
        ExpansionTile(
          title: const Text("Счета"),
          initiallyExpanded: cards.showCards,
          iconColor: Colors.black,
          textColor: Colors.black,
          children: [
            SizedBox(
              height: 134,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Observer(
                  builder: (_) => ListView.builder(
                    itemCount: cards.cardCount,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == cards.cardsList.length) {
                        return const CardAddBalanceWidget();
                      } else {
                        return CardBalanceWidget(card: cards.cardsList[index]);
                      }
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

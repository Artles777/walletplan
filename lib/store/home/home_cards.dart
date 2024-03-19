import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:mobx/mobx.dart";
import "package:walletplan/helpers/enums/router_enums.dart";
import "package:walletplan/helpers/variables/colors.dart";

part "home_cards.g.dart";

class CardDTO {
  CardDTO({
    required this.id,
    required this.title,
    required this.number,
    required this.balance,
    required this.color,
    required this.textColor,
    required this.currencyColor,
    required this.currency,
  });

  String id;
  String title;
  String number;
  double balance;
  LinearGradient color;
  Color textColor;
  Color currencyColor;
  String currency;
}

class HomeCardsState = _HomeCardsState with _$HomeCardsState;

abstract class _HomeCardsState with Store {
  @observable
  ObservableList<CardDTO> cardsList = ObservableList<CardDTO>.of([
    CardDTO(
      id: "1",
      title: "МИР",
      number: "•• 0017",
      balance: 120000000.60,
      color: LinearColors.greenGradient,
      textColor: SecondaryColors.secondary40,
      currencyColor: SecondaryColors.secondary10,
      currency: "RUB",
    ),
    CardDTO(
      id: "2",
      title: "МИР",
      number: "•• 0017",
      balance: 1200.00,
      color: LinearColors.greenGradient,
      textColor: SecondaryColors.secondary40,
      currencyColor: SecondaryColors.secondary10,
      currency: "USD",
    ),
  ]);

  @observable
  bool isShowCards = true;

  @computed
  int? get cardCount => cardsList.length + 1;

  @action
  void navigateNewCardAddScreen(BuildContext context) {
    context.goNamed("${HomeRouterNames.addCard}");
  }

  @action
  void navigateEditAccountScreen(BuildContext context) {
    context.goNamed("${HomeRouterNames.editAccount}");
  }
}

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:mobx/mobx.dart";
import "package:walletplan/store/home/home_adds_state.dart";
import "package:walletplan/store/home/home_cards.dart";
import "package:walletplan/store/home/home_finance.dart";
import "package:walletplan/store/home/home_panel_state.dart";

part "home.g.dart";

class CardListDTO {
  CardListDTO({required this.id, required this.title});

  final String id;
  final String title;
}

class HomeState = _HomeState with _$HomeState;

abstract class _HomeState with Store {
  final cards = HomeCardsState();
  final finance = HomeFinanceState();
  final panel = HomePanelState();
  final adds = HomeAddsState();

  static const financeMinHeight = 140;
  static const financeMaxHeight = 250;
  static const financeMaxHeightExpansionTile = 215;

  @observable
  double layoutSize = 1.sh;

  @computed
  double get minSizeSheet => layoutSize - financeMaxHeight;

  @computed
  double get maxSizeSheet => layoutSize - financeMinHeight;

  @computed
  double get sizeSheet => cards.isShowCards ? minSizeSheet : maxSizeSheet;

  @computed
  double get maxHeightSheet => layoutSize - financeMaxHeightExpansionTile;

  @computed
  List<CardListDTO> get cardsList => cards.cardsList
      .map((item) => CardListDTO(id: item.id, title: item.title))
      .toList();

  @action
  Color luminanceColor(Color color) =>
      color.computeLuminance() > 0.6 ? Colors.black : Colors.white;
}

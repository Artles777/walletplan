import "package:flutter/cupertino.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:mobx/mobx.dart";
import "package:sliding_up_panel/sliding_up_panel.dart";
import "package:walletplan/store/history/history_cards.dart";
import "package:walletplan/store/history/history_panel.dart";

part "history.g.dart";

class HistoryState = _HistoryState with _$HistoryState;

abstract class _HistoryState with Store {
  final cards = HistoryCardsState();
  final panel = HistoryPanelState();

  final searchFocusNode = FocusNode();
  final panelController = PanelController();

  final cardsSize = 90;
  final layoutSize = 1.sh;

  @computed
  double get minSizePanelHistory => layoutSize - cardsSize;

  @action
  void setFocusSearch(BuildContext context) {
    FocusScope.of(context).requestFocus(searchFocusNode);
  }
}

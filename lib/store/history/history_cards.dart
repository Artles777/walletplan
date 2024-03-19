import "package:mobx/mobx.dart";

part "history_cards.g.dart";

class CardDTO {
  CardDTO({
    required this.amount,
    required this.label,
  });

  double amount;
  String label;
}

class HistoryCardsState = _HistoryCardsState with _$HistoryCardsState;

abstract class _HistoryCardsState with Store {
  @observable
  ObservableList<CardDTO> cardsList = ObservableList<CardDTO>.of([
    CardDTO(amount: 10000.00, label: "Потрачено сегодня"),
    CardDTO(amount: 130000.00, label: "Потрачено за месяц"),
    CardDTO(amount: 1050000.00, label: "Потрачено за год"),
  ]);
}

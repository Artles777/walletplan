import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:mobx/mobx.dart";

part "history_panel.g.dart";

Map<String, IconData> iconsMap = {
  "restaurant": Icons.restaurant,
};

class HistoryItem {
  HistoryItem({
    required this.id,
    required this.date,
    required this.description,
    required this.amount,
    required this.category,
  });

  int id;
  String date;
  String category;
  String description;
  double amount;
}

class HistoryPanelState = _HistoryPanelState with _$HistoryPanelState;

abstract class _HistoryPanelState with Store {
  @observable
  ObservableList<HistoryItem> historyList = ObservableList.of([
    HistoryItem(
      id: 0,
      category: "restaurant",
      description: "На продукты которые были куплины когда то давно",
      date: DateFormat("dd.MM.yy").format(DateTime.now()),
      amount: -2000.10,
    ),
    HistoryItem(
      id: 1,
      category: "restaurant",
      description: "Продукты когда то нужны были теперь хз",
      date: DateFormat("dd.MM.yy").format(DateTime.now()),
      amount: -5000.80,
    ),
    HistoryItem(
      id: 2,
      category: "restaurant",
      description: "Уже и не знаю что написать",
      date: DateFormat("dd.MM.yy").format(DateTime.now()),
      amount: -870000000000.99,
    ),
    HistoryItem(
      id: 2,
      category: "restaurant",
      description: "Уже и не знаю что написать",
      date: DateFormat("dd.MM.yy")
          .format(DateTime.now().subtract(Duration(days: 1))),
      amount: -870000000000.99,
    ),
  ]);
}

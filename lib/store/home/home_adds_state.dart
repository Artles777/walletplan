import "package:mobx/mobx.dart";
import "package:walletplan/store/home/adds/add_card_state.dart";
import "package:walletplan/store/home/adds/transactions_state.dart";

part "home_adds_state.g.dart";

class HomeAddsState = _HomeAddsState with _$HomeAddsState;

abstract class _HomeAddsState with Store {
  final addCard = AddCardState();
  final transactions = TransactionsState();
}

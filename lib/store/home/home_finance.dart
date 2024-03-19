import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:mobx/mobx.dart";
import "package:walletplan/helpers/enums/router_enums.dart";
import "package:walletplan/helpers/enums/store_enums.dart";

part "home_finance.g.dart";

class HomeFinanceState = _HomeFinanceState with _$HomeFinanceState;

abstract class _HomeFinanceState with Store {
  @action
  void createIncome() {}

  @action
  void createExpense() {}

  @action
  void navigateIncomeScreen(BuildContext context) {
    context.goNamed(
      "${HomeRouterNames.transactions}",
      extra: TransactionNameEnum.income,
    );
  }

  @action
  void navigateExpenseScreen(BuildContext context) {
    context.goNamed(
      "${HomeRouterNames.transactions}",
      extra: TransactionNameEnum.expense,
    );
  }
}

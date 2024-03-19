import "package:flutter/material.dart";
import "package:mobx/mobx.dart";

part "income_state.g.dart";

@immutable
class FormIncomeDTO {
  const FormIncomeDTO({
    required this.amount,
  });

  final Observable<double> amount;
}

class IncomeState = _IncomeState with _$IncomeState;

abstract class _IncomeState with Store {
  final TextEditingController amountController = TextEditingController();
  final amountFocusNode = FocusNode();

  final FormIncomeDTO _form = FormIncomeDTO(
    amount: Observable(0.0),
  );

  @computed
  double get amount => _form.amount.value;

  @action
  void changeAmount(String value) {
    if (value.isNotEmpty) {
      _form.amount.value = double.parse(double.parse(value).toStringAsFixed(2));
    }
  }

  @action
  void completeEditingAmount() {
    changeAmount(amount.toStringAsFixed(2));
    amountController.text = amount.toStringAsFixed(2);
    unfocusAmountField();
  }

  @action
  void focusAmountField() {
    amountFocusNode.requestFocus();
  }

  @action
  void unfocusAmountField() {
    amountFocusNode.unfocus();
  }
}

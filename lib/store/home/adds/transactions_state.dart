import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:mobx/mobx.dart";
import "package:syncfusion_flutter_datepicker/datepicker.dart";
import "package:walletplan/helpers/enums/store_enums.dart";
import "package:walletplan/store/home.dart";

part "transactions_state.g.dart";

Map<TransactionNameEnum, String> transactions = {
  TransactionNameEnum.income: "Доход",
  TransactionNameEnum.expense: "Расход",
};

@immutable
class FormTransactionsDTO {
  const FormTransactionsDTO({
    required this.amount,
    required this.cardId,
    required this.date,
    required this.repeatOperation,
    required this.notification,
    this.category,
    this.comment,
    this.reminder,
  });

  final Observable<double> amount;
  final Observable<String>? category;
  final Observable<String> cardId;
  final Observable<String> date;
  final Observable<String>? comment;
  final Observable<bool> repeatOperation;
  final Observable<bool> notification;
  final Observable<String>? reminder;
}

class TransactionsState = _TransactionsState with _$TransactionsState;

abstract class _TransactionsState with Store {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController cardController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController reminderController = TextEditingController();

  @computed
  TextEditingController get dateController => TextEditingController(
        text: initialDate,
      );
  final DateRangePickerController datepickerController =
      DateRangePickerController();

  final amountFocusNode = FocusNode();

  final List<String> expenseList = [
    "Продукты",
    "Одежда",
    "Транспорт",
    "Электрика"
  ];
  final List<String> incomeList = [
    "Инвестиции",
    "Бизнес",
    "Зарплата",
    "Деньги подаренные"
  ];

  final String? initialIncome = "Зарплата";
  final String? initialExpense = null;
  final String initialCard = "1";
  final String initialDate = DateFormat("dd.MM.yyyy").format(DateTime.now());

  @computed
  FormTransactionsDTO get _form => FormTransactionsDTO(
      amount: Observable(0.0),
      cardId: Observable(initialCard),
      date: Observable(initialDate),
      repeatOperation: Observable(false),
      notification: Observable(false));

  @observable
  TransactionNameEnum transactionName = TransactionNameEnum.income;

  @computed
  String get transactionConvertedName => transactions[transactionName]!;

  @computed
  double get amount => _form.amount.value;

  @computed
  String? get category => _form.category?.value;

  @computed
  String get cardId => _form.cardId.value;

  @computed
  String? get comment => _form.comment?.value;

  @computed
  String? get reminder => _form.reminder?.value;

  @computed
  bool get repeatOperation => _form.repeatOperation.value;

  @computed
  bool get notification => _form.notification.value;

  @computed
  bool get hasIncome => transactionName == TransactionNameEnum.income;

  @computed
  List<DropdownMenuEntry<String>> get categories =>
      (hasIncome ? incomeList : expenseList)
          .map(
            (item) => DropdownMenuEntry(value: item, label: item),
          )
          .toList();

  @computed
  String? get initialCategory => hasIncome ? initialIncome : initialExpense;

  @computed
  List<DropdownMenuEntry<String>> get cardsList => HomeState()
      .cardsList
      .map(
        (item) => DropdownMenuEntry(value: item.id, label: item.title),
      )
      .toList();

  @computed
  MaterialStateProperty<Icon?> get repeatOperationIcon =>
      MaterialStateProperty.resolveWith<Icon?>(
        (states) =>
            repeatOperation ? Icon(Icons.check) : const Icon(Icons.close),
      );

  @computed
  MaterialStateProperty<Icon?> get notificationIcon =>
      MaterialStateProperty.resolveWith<Icon?>(
        (states) => notification ? Icon(Icons.check) : const Icon(Icons.close),
      );

  @action
  void changeAmount(String value) {
    if (value.isNotEmpty) {
      _form.amount.value = double.parse(double.parse(value).toStringAsFixed(2));
    }
  }

  @action
  void changeCategory(String value) {
    _form.category?.value = value;
  }

  @action
  void completeEditingAmount() {
    changeAmount(amount.toStringAsFixed(2));
    amountController.text = amount.toStringAsFixed(2);
    unfocusAmountField();
  }

  @action
  void changeCard(String value) {
    _form.cardId.value = value;
  }

  @action
  void changeDate(String value) {
    _form.date.value = value;
    dateController.text = value;
  }

  @action
  void changeComment(String value) {
    _form.comment?.value = value;
  }

  @action
  void changeRepeatOperation(bool value) {
    _form.repeatOperation.value = value;
  }

  @action
  void changeNotification(bool value) {
    _form.notification.value = value;
  }

  @action
  void changeReminder(String value) {
    _form.reminder?.value = value;
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

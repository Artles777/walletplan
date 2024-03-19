import "package:flutter/material.dart";
import "package:mobx/mobx.dart";
import "package:walletplan/helpers/enums/store_enums.dart";

part "add_card_state.g.dart";

@immutable
class FormAddCardDTO {
  const FormAddCardDTO({
    required this.title,
    required this.type,
    required this.currency,
    required this.balance,
    required this.bank,
    required this.commonBalance,
    required this.syncBank,
  });

  final Observable<String> title;
  final Observable<TypeCardEnum> type;
  final Observable<CurrencyCardEnum> currency;
  final Observable<double> balance;
  final Observable<BanksEnum> bank;
  final Observable<bool> commonBalance;
  final Observable<bool> syncBank;
}

Map<TypeCardEnum, String> convertedTypes = {
  TypeCardEnum.card: "Карта",
  TypeCardEnum.bankAccount: "Банковский счет",
  TypeCardEnum.cash: "Наличные",
  TypeCardEnum.credit: "Кредит",
  TypeCardEnum.deposit: "Депозит",
};

Map<CurrencyCardEnum, String> convertedCurrencies = {
  CurrencyCardEnum.rub: "Рубль",
  CurrencyCardEnum.usd: "Доллар",
  CurrencyCardEnum.eur: "Евро",
};

Map<BanksEnum, String> convertedBanks = {
  BanksEnum.none: "Без банка",
  BanksEnum.sberbank: "Сбербанк",
  BanksEnum.alfa: "Альфа-банк",
  BanksEnum.tinkoff: "Тинькофф банк",
  BanksEnum.vtb: "Банк ВТБ"
};

class AddCardState = _AddCardState with _$AddCardState;

abstract class _AddCardState with Store {
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController typeSelectController = TextEditingController();
  final TextEditingController currencySelectController =
      TextEditingController();
  final TextEditingController balanceNumberController = TextEditingController();
  final TextEditingController bankSelectController = TextEditingController();

  final List<DropdownMenuEntry<TypeCardEnum>> types = TypeCardEnum.values
      .map(
        (type) => DropdownMenuEntry(value: type, label: convertedTypes[type]!),
      )
      .toList();

  final List<DropdownMenuEntry<CurrencyCardEnum>> currencies = CurrencyCardEnum
      .values
      .map(
        (type) =>
            DropdownMenuEntry(value: type, label: convertedCurrencies[type]!),
      )
      .toList();

  final List<DropdownMenuEntry<BanksEnum>> banks = BanksEnum.values
      .map(
        (bank) => DropdownMenuEntry(value: bank, label: convertedBanks[bank]!),
      )
      .toList();

  final FormAddCardDTO _form = FormAddCardDTO(
    title: Observable(""),
    type: Observable(TypeCardEnum.card),
    currency: Observable(CurrencyCardEnum.rub),
    balance: Observable(0.00),
    bank: Observable(BanksEnum.none),
    commonBalance: Observable(true),
    syncBank: Observable(false),
  );

  @computed
  String get title => _form.title.value;

  @computed
  TypeCardEnum get type => _form.type.value;

  @computed
  TypeCardEnum get currency => _form.type.value;

  @computed
  int get titleCount => title.length;

  @computed
  bool get commonBalance => _form.commonBalance.value;

  @computed
  bool get syncBank => _form.syncBank.value;

  @computed
  MaterialStateProperty<Icon?> get balanceThumbIcon =>
      MaterialStateProperty.resolveWith<Icon?>(
        (states) => commonBalance ? Icon(Icons.check) : const Icon(Icons.close),
      );

  @computed
  MaterialStateProperty<Icon?> get syncBankThumbIcon =>
      MaterialStateProperty.resolveWith<Icon?>(
        (states) => syncBank ? Icon(Icons.check) : const Icon(Icons.close),
      );

  @action
  void changeTitle(String value) {
    _form.title.value = value;
  }

  @action
  void changeType(TypeCardEnum value) {
    _form.type.value = value;
  }

  @action
  void changeCurrency(CurrencyCardEnum value) {
    _form.currency.value = value;
  }

  @action
  void changeBalance(String value) {
    _form.balance.value = double.parse(double.parse(value).toStringAsFixed(2));
  }

  @action
  void changeBank(BanksEnum value) {
    _form.bank.value = value;
  }

  @action
  void changeCommonBalance(bool value) {
    _form.commonBalance.value = value;
  }

  @action
  void changeSyncBank(bool value) {
    _form.syncBank.value = value;
  }
}

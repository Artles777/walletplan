import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:mobx/mobx.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/helpers/variables/sizes.dart";
import "package:walletplan/store/base.dart";
import "package:walletplan/store/home.dart";

import 'package:walletplan/helpers/formatters/amount_input_formatter.dart';
import "package:walletplan/widgets/commons/custom_datepicker.dart";
import "package:walletplan/widgets/commons/custom_dropdown_menu.dart";

class TransactionsFormWidget extends StatelessWidget {
  const TransactionsFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);
    final baseState = Provider.of<BaseState>(context);
    final transactionsState = state.adds.transactions;

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: PrimaryColors.primary99,
                ),
                child: SafeArea(
                  minimum: const EdgeInsets.only(
                    top: 20.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ReactionBuilder(
                            builder: (context) => autorun(
                              (_) {
                                transactionsState.focusAmountField();
                                transactionsState.datepickerController
                                    .selectedDate = DateTime.now();
                              },
                            ),
                            child: Expanded(
                              child: Focus(
                                onFocusChange: (focus) {
                                  if (!focus &&
                                      transactionsState
                                          .amountController.text.isEmpty) {
                                    transactionsState.completeEditingAmount();
                                  }
                                },
                                child: TextField(
                                  onChanged: transactionsState.changeAmount,
                                  onEditingComplete:
                                      transactionsState.completeEditingAmount,
                                  onTap: () {
                                    if (!transactionsState
                                        .amountFocusNode.hasFocus) {
                                      transactionsState.amountController.text =
                                          "";
                                    }
                                  },
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r"^(0\.?\d?\d?)|[1-9]\d*\.?"),
                                    ),
                                    AmountInputFormatter(),
                                  ],
                                  focusNode: transactionsState.amountFocusNode,
                                  controller:
                                      transactionsState.amountController,
                                  decoration: const InputDecoration(
                                    labelText: "Сумма",
                                    hintText: "0.00",
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: IconButton(
                              onPressed: transactionsState.focusAmountField,
                              iconSize: IconSizes.large,
                              icon: const Icon(Icons.qr_code_scanner),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Observer(
                          builder: (_) => CustomDropdownMenu(
                            controller: transactionsState.categoriesController,
                            dropdownMenuEntries: transactionsState.categories,
                            label: const Text("Категория"),
                            initialSelection: transactionsState.initialCategory,
                            width: MediaQuery.of(context).size.width - 32,
                            onSelected: (value) =>
                                transactionsState.changeCategory(value!),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomDropdownMenu(
                              controller: transactionsState.cardController,
                              dropdownMenuEntries: transactionsState.cardsList,
                              label: const Text("Счет"),
                              initialSelection: transactionsState.initialCard,
                              width: MediaQuery.of(context).size.width / 2.3,
                              onSelected: (value) =>
                                  transactionsState.changeCard(value!),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Observer(
                                  builder: (_) => TextField(
                                    controller:
                                        transactionsState.dateController,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                          insetPadding: EdgeInsets.symmetric(
                                            horizontal: 24,
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomDatepicker(
                                              controller: transactionsState
                                                  .datepickerController,
                                              onSubmit: (value) =>
                                                  transactionsState
                                                      .changeDate(value),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    keyboardType: TextInputType.none,
                                    showCursor: false,
                                    enableInteractiveSelection: false,
                                    decoration: const InputDecoration(
                                      labelText: "Дата",
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: TextField(
                          onChanged: transactionsState.changeComment,
                          controller: transactionsState.commentController,
                          decoration: const InputDecoration(
                            labelText: "Комментарий",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          children: [
                            Observer(
                              builder: (_) => Switch(
                                thumbIcon:
                                    transactionsState.repeatOperationIcon,
                                value: transactionsState.repeatOperation,
                                onChanged:
                                    transactionsState.changeRepeatOperation,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 12, right: 4),
                              child: Text("Повтор операции"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          children: [
                            Observer(
                              builder: (_) => Switch(
                                thumbIcon: transactionsState.notificationIcon,
                                value: transactionsState.notification,
                                onChanged: transactionsState.changeNotification,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 12, right: 4),
                              child: Text("Добавить напоминание"),
                            ),
                            const Icon(
                              Icons.lock_outline,
                              color: PrimaryColors.primary40,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: TextField(
                          onChanged: transactionsState.changeReminder,
                          controller: transactionsState.reminderController,
                          decoration: const InputDecoration(
                            labelText: "Напоминание",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
